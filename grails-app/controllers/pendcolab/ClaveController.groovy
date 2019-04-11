package pendcolab

class ClaveController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [claveInstanceList: Clave.list(params), claveInstanceTotal: Clave.count()]
    }

    def create = {
        def claveInstance = new Clave()
        claveInstance.properties = params
        return [claveInstance: claveInstance]
    }

    def save = {
        def claveInstance = new Clave(params)
        if (claveInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'clave.label', default: 'Clave'), claveInstance.id])}"
            redirect(action: "show", id: claveInstance.id)
        }
        else {
            render(view: "create", model: [claveInstance: claveInstance])
        }
    }

    def show = {
        def claveInstance = Clave.get(params.id)
        if (!claveInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clave.label', default: 'Clave'), params.id])}"
            redirect(action: "list")
        }
        else {
            [claveInstance: claveInstance]
        }
    }

    def edit = {
        def claveInstance = Clave.get(params.id)
        if (!claveInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clave.label', default: 'Clave'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [claveInstance: claveInstance]
        }
    }

    def update = {
        def claveInstance = Clave.get(params.id)
        if (claveInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (claveInstance.version > version) {
                    
                    claveInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'clave.label', default: 'Clave')] as Object[], "Another user has updated this Clave while you were editing")
                    render(view: "edit", model: [claveInstance: claveInstance])
                    return
                }
            }
            claveInstance.properties = params
            if (!claveInstance.hasErrors() && claveInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'clave.label', default: 'Clave'), claveInstance.id])}"
                redirect(action: "show", id: claveInstance.id)
            }
            else {
                render(view: "edit", model: [claveInstance: claveInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clave.label', default: 'Clave'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def claveInstance = Clave.get(params.id)
        if (claveInstance) {
            try {
                claveInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'clave.label', default: 'Clave'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'clave.label', default: 'Clave'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clave.label', default: 'Clave'), params.id])}"
            redirect(action: "list")
        }
    }
}
