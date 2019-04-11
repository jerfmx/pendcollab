package pendcolab

class AdminController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [adminInstanceList: Admin.list(params), adminInstanceTotal: Admin.count()]
    }

    def create = {
        def adminInstance = new Admin()
        adminInstance.properties = params
        return [adminInstance: adminInstance]
    }

    def save = {
        def adminInstance = new Admin(params)
        if (adminInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'admin.label', default: 'Admin'), adminInstance.id])}"
            redirect(action: "show", id: adminInstance.id)
        }
        else {
            render(view: "create", model: [adminInstance: adminInstance])
        }
    }

    def show = {
        def adminInstance = Admin.get(params.id)
        if (!adminInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
            redirect(action: "list")
        }
        else {
            [adminInstance: adminInstance]
        }
    }

    def edit = {
    	if(session.usuario.usuario != Admin.get(params.id).usuario){
    		flash.message = "Solo puedes editar tu información"
    		redirect(action:'list')
    		return
    	}
        def adminInstance = Admin.get(params.id)
        if (!adminInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [adminInstance: adminInstance]
        }
    }

    def update = {
        def adminInstance = Admin.get(params.id)
        if (adminInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (adminInstance.version > version) {
                    
                    adminInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'admin.label', default: 'Admin')] as Object[], "Another user has updated this Admin while you were editing")
                    render(view: "edit", model: [adminInstance: adminInstance])
                    return
                }
            }
            adminInstance.properties = params
            if (!adminInstance.hasErrors() && adminInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'admin.label', default: 'Admin'), adminInstance.id])}"
                redirect(action: "show", id: adminInstance.id)
            }
            else {
				if(session.usuario.usuario != adminInstance.usuario){
					flash.message = "Solo puedes editar tu información"
					redirect(action:'list')
					return
				}
                render(view: "edit", model: [adminInstance: adminInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		if(session.usuario.usuario != UsuarioInstance.usuario){
			flash.message = "Solo puedes editar tu información"
			redirect(action:'list')
			return
		}
        def adminInstance = Admin.get(params.id)
        if (adminInstance) {
            try {
                adminInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def admin = {}
}
