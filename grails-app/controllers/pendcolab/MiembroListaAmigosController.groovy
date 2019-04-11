package pendcolab

class MiembroListaAmigosController {

    static allowedMethods = [save: "POST", update: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        Usuario u = Usuario.get(session.usuario.id)
        def listas = ListaAmigos.findAllByUsuario(u)
        def r=[]
        listas.each{
        	r+=MiembroListaAmigos.findAllByLista(it,params)
        }
        [miembroListaAmigosInstanceList: r, miembroListaAmigosInstanceTotal: r.size()]
    }

    def create = {
        def miembroListaAmigosInstance = new MiembroListaAmigos()
        miembroListaAmigosInstance.properties = params
        return [miembroListaAmigosInstance: miembroListaAmigosInstance]
    }

    def save = {
    	Usuario u=session.usuario
    	ListaAmigos l=ListaAmigos.findByUsuarioAndId(u,params.lista.id)
    	if(!l){
    		flash.message="Solo puedes editar tu información"
    		redirect(action:'list')
    		return
    	}
        def miembroListaAmigosInstance = new MiembroListaAmigos(params)
        if (miembroListaAmigosInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'miembroListaAmigos.label', default: 'MiembroListaAmigos'), miembroListaAmigosInstance.id])}"
            redirect(action: "show", id: miembroListaAmigosInstance.id)
        }
        else {
            render(view: "create", model: [miembroListaAmigosInstance: miembroListaAmigosInstance])
        }
    }

    def show = {
        def miembroListaAmigosInstance = MiembroListaAmigos.get(params.id)
        if (!miembroListaAmigosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'miembroListaAmigos.label', default: 'MiembroListaAmigos'), params.id])}"
            redirect(action: "list")
        }
        else {
			Usuario u=session.usuario
			ListaAmigos l=ListaAmigos.findByUsuarioAndId(u,miembroListaAmigosInstance.lista.id)
			if(!l){
				flash.message="Solo puedes editar tu información"
				redirect(action:'list')
				return
			}
            [miembroListaAmigosInstance: miembroListaAmigosInstance]
        }
    }

    def edit = {
    	Usuario u=session.usuario
    	ListaAmigos l=ListaAmigos.findByUsuarioAndId(u,miembroListaAmigosInstance.lista.id)
    	if(!l){
    		flash.message="Solo puedes editar tu información"
    		redirect(action:'list')
    		return
    	}
        def miembroListaAmigosInstance = MiembroListaAmigos.get(params.id)
        if (!miembroListaAmigosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'miembroListaAmigos.label', default: 'MiembroListaAmigos'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [miembroListaAmigosInstance: miembroListaAmigosInstance]
        }
    }

    def update = {
        def miembroListaAmigosInstance = MiembroListaAmigos.get(params.id)
        if (miembroListaAmigosInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (miembroListaAmigosInstance.version > version) {
                    
                    miembroListaAmigosInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'miembroListaAmigos.label', default: 'MiembroListaAmigos')] as Object[], "Another user has updated this MiembroListaAmigos while you were editing")
                    render(view: "edit", model: [miembroListaAmigosInstance: miembroListaAmigosInstance])
                    return
                }
            }
			Usuario u=session.usuario
			ListaAmigos l=ListaAmigos.findByUsuarioAndId(u,miembroListaAmigosInstance.lista.id)
			if(!l){
				flash.message="Solo puedes editar tu información"
				redirect(action:'list')
				return
			}
            miembroListaAmigosInstance.properties = params
            if (!miembroListaAmigosInstance.hasErrors() && miembroListaAmigosInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'miembroListaAmigos.label', default: 'MiembroListaAmigos'), miembroListaAmigosInstance.id])}"
                redirect(action: "show", id: miembroListaAmigosInstance.id)
            }
            else {
                render(view: "edit", model: [miembroListaAmigosInstance: miembroListaAmigosInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'miembroListaAmigos.label', default: 'MiembroListaAmigos'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def miembroListaAmigosInstance = MiembroListaAmigos.get(params.id)
        if (miembroListaAmigosInstance) {
            try {
				Usuario u=session.usuario
				ListaAmigos l=ListaAmigos.findByUsuarioAndId(u,miembroListaAmigosInstance.lista.id)
				if(!l){
					flash.message="Solo puedes editar tu información"
					redirect(action:'list')
					return
				}
                miembroListaAmigosInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'miembroListaAmigos.label', default: 'MiembroListaAmigos'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'miembroListaAmigos.label', default: 'MiembroListaAmigos'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'miembroListaAmigos.label', default: 'MiembroListaAmigos'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def agrega = {
    	def u = Usuario.get(params.usuarioId)
    	def lista = ListaAmigos.get(params.listaAmigosId)
    	MiembroListaAmigos m
    	if(u&&lista){
    		m = new MiembroListaAmigos(apodo:u.usuario,usuario:u,lista:lista).save()
    	}
    	render(template:'/common/buddyListMember',var:'buddy',collection:MiembroListaAmigos.findAllByLista(lista))
    }

	def editarApodo = {
		log.info "Actualizando Apodo de Miembro de Lista de Amigos"
		def m = MiembroListaAmigos.get(params.id)
		if(m){
			m.apodo = params.apodo
			m.save()
			}
		render params.apodo
	}

}
