package pendcolab

class CategoriaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        Usuario u = Usuario.get(session.usuario.id)
        [categoriaInstanceList: Categoria.findAllByUsuario(u,params), categoriaInstanceTotal: Categoria.countByUsuario(u)]
    }

    def create = {
        def categoriaInstance = new Categoria()
        categoriaInstance.properties = params
        categoriaInstance.usuario = session.usuario
        return [categoriaInstance: categoriaInstance]
    }

    def save = {
        def categoriaInstance = new Categoria(params)
        categoriaInstance.usuario = session.usuario

        if (categoriaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoriaInstance.id])}"
            redirect(action: "show", id: categoriaInstance.id)
        }
        else {
            render(view: "create", model: [categoriaInstance: categoriaInstance])
        }
    }

    def show = {
        def categoriaInstance = Categoria.get(params.id)
        if (!categoriaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
            redirect(action: "list")
        }
        else {
        	if(categoriaInstance.usuario.usuario!=session.usuario.usuario){
        		flash.message="Solo puedes editar tu información"
        		redirect(action:'list')
        		return
        	}
            [categoriaInstance: categoriaInstance]
        }
    }

    def edit = {
        def categoriaInstance = Categoria.get(params.id)
        if (!categoriaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
            redirect(action: "list")
        }
        else {
        	if(categoriaInstance.usuario.usuario!=session.usuario.usuario){
        		flash.message="Solo puedes editar tu información"
        		redirect(action:'list')
        		return
        	}
            return [categoriaInstance: categoriaInstance]
        }
    }

    def update = {
        def categoriaInstance = Categoria.get(params.id)
        if (categoriaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (categoriaInstance.version > version) {
                    
                    categoriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'categoria.label', default: 'Categoria')] as Object[], "Another user has updated this Categoria while you were editing")
                    render(view: "edit", model: [categoriaInstance: categoriaInstance])
                    return
                }
            }
        	if(categoriaInstance.usuario.usuario!=session.usuario.usuario){
        		flash.message="Solo puedes editar tu información"
        		redirect(action:'list')
        		return
        	}
            categoriaInstance.properties = params
            categoriaInstance.usuario = session.usuario
            if (!categoriaInstance.hasErrors() && categoriaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoriaInstance.id])}"
                redirect(action: "show", id: categoriaInstance.id)
            }
            else {
                render(view: "edit", model: [categoriaInstance: categoriaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def categoriaInstance = Categoria.get(params.id)
        if (categoriaInstance) {
            try {
				if(categoriaInstance.usuario.usuario!=session.usuario.usuario){
					flash.message="Solo puedes editar tu información"
					redirect(action:'list')
					return
				}
                categoriaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
            redirect(action: "list")
        }
    }
}
