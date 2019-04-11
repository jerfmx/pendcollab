package pendcolab

class ListaAmigosController {

    static allowedMethods = [save: "POST", update: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        Usuario u = Usuario.get(session.usuario.id)
        [listaAmigosInstanceList: ListaAmigos.findAllByUsuario(u,params), listaAmigosInstanceTotal: ListaAmigos.countByUsuario(u)]
    }

    def create = {
        def listaAmigosInstance = new ListaAmigos()
        listaAmigosInstance.properties = params
        listaAmigosInstance.usuario = session.usuario
        return [listaAmigosInstance: listaAmigosInstance]
    }

    def save = {
        def listaAmigosInstance = new ListaAmigos(params)
        listaAmigosInstance.usuario = session.usuario
        if (listaAmigosInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'listaAmigos.label', default: 'ListaAmigos'), listaAmigosInstance.id])}"
            redirect(action: "show", id: listaAmigosInstance.id)
        }
        else {
            render(view: "create", model: [listaAmigosInstance: listaAmigosInstance])
        }
    }

    def show = {
        def listaAmigosInstance = ListaAmigos.get(params.id)
        if (!listaAmigosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'listaAmigos.label', default: 'ListaAmigos'), params.id])}"
            redirect(action: "list")
        }
        else {
        	if(session.usuario.usuario!=listaAmigosInstance.usuario.usuario){
        		flash.message = "Solo puedes editar tu información"
        		redirect(action:'list')
        		return
        	}
            [listaAmigosInstance: listaAmigosInstance]
        }
    }

    def edit = {
        def listaAmigosInstance = ListaAmigos.get(params.id)
        if (!listaAmigosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'listaAmigos.label', default: 'ListaAmigos'), params.id])}"
            redirect(action: "list")
        }
        else {
        	if(session.usuario.usuario!=listaAmigosInstance.usuario.usuario){
        		flash.message = "Solo puedes editar tu información"
        		redirect(action:'list')
        		return
        	}
            return [listaAmigosInstance: listaAmigosInstance]
        }
    }

    def update = {
        def listaAmigosInstance = ListaAmigos.get(params.id)
        if (listaAmigosInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (listaAmigosInstance.version > version) {
                    
                    listaAmigosInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'listaAmigos.label', default: 'ListaAmigos')] as Object[], "Another user has updated this ListaAmigos while you were editing")
                    render(view: "edit", model: [listaAmigosInstance: listaAmigosInstance])
                    return
                }
            }
        	if(session.usuario.usuario!=listaAmigosInstance.usuario.usuario){
        		flash.message = "Solo puedes editar tu información"
        		redirect(action:'list')
        		return
        	}
            listaAmigosInstance.properties = params
            if (!listaAmigosInstance.hasErrors() && listaAmigosInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'listaAmigos.label', default: 'ListaAmigos'), listaAmigosInstance.id])}"
                redirect(action: "show", id: listaAmigosInstance.id)
            }
            else {
                render(view: "edit", model: [listaAmigosInstance: listaAmigosInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'listaAmigos.label', default: 'ListaAmigos'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def listaAmigosInstance = ListaAmigos.get(params.id)
        if (listaAmigosInstance) {
            try {
				if(session.usuario.usuario!=listaAmigosInstance.usuario.usuario){
					flash.message = "Solo puedes editar tu información"
					redirect(action:'list')
					return
				}
                listaAmigosInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'listaAmigos.label', default: 'ListaAmigos'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'listaAmigos.label', default: 'ListaAmigos'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'listaAmigos.label', default: 'ListaAmigos'), params.id])}"
            redirect(action: "list")
        }
    }

	def editarNombre = {
		log.info "Actualizando Nombre de Lista de Amigos"
		def lista = ListaAmigos.get(params.id)
		if(lista){
			lista.nombre = params.nombre
			lista.save()
			}
		render params.nombre
	}
	
	def agregar = {
		ListaAmigos lista
		if(params.listaAmigosNombre!=""){
			lista = new ListaAmigos(nombre:params.listaAmigosNombre,usuario:session.usuario)
			lista.save()
		}
		render(template:'/common/buddyList',var:'list',collection:ListaAmigos.findAllByUsuario(session.usuario))
	}
}
