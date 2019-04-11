package pendcolab

class AuthController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [authInstanceList: Auth.list(params), authInstanceTotal: Auth.count()]
    }

    def create = {
        def authInstance = new Auth()
        authInstance.properties = params
        return [authInstance: authInstance]
    }

    def save = {
        def authInstance = new Auth(params)
        if (authInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'auth.label', default: 'Auth'), authInstance.id])}"
            redirect(action: "show", id: authInstance.id)
        }
        else {
            render(view: "create", model: [authInstance: authInstance])
        }
    }

    def show = {
        def authInstance = Auth.get(params.id)
        if (!authInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'auth.label', default: 'Auth'), params.id])}"
            redirect(action: "list")
        }
        else {
            [authInstance: authInstance]
        }
    }

    def edit = {
        def authInstance = Auth.get(params.id)
        if (!authInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'auth.label', default: 'Auth'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [authInstance: authInstance]
        }
    }

    def update = {
        def authInstance = Auth.get(params.id)
        if (authInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (authInstance.version > version) {
                    
                    authInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'auth.label', default: 'Auth')] as Object[], "Another user has updated this Auth while you were editing")
                    render(view: "edit", model: [authInstance: authInstance])
                    return
                }
            }
            authInstance.properties = params
            if (!authInstance.hasErrors() && authInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'auth.label', default: 'Auth'), authInstance.id])}"
                redirect(action: "show", id: authInstance.id)
            }
            else {
                render(view: "edit", model: [authInstance: authInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'auth.label', default: 'Auth'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def authInstance = Auth.get(params.id)
        if (authInstance) {
            try {
                authInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'auth.label', default: 'Auth'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'auth.label', default: 'Auth'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'auth.label', default: 'Auth'), params.id])}"
            redirect(action: "list")
        }
    }
}
