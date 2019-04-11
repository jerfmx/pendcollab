package pendcolab

class ReqmapController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reqmapInstanceList: Reqmap.list(params), reqmapInstanceTotal: Reqmap.count()]
    }

    def create = {
        def reqmapInstance = new Reqmap()
        reqmapInstance.properties = params
        return [reqmapInstance: reqmapInstance]
    }

    def save = {
        def reqmapInstance = new Reqmap(params)
        if (reqmapInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'reqmap.label', default: 'Reqmap'), reqmapInstance.id])}"
            redirect(action: "show", id: reqmapInstance.id)
        }
        else {
            render(view: "create", model: [reqmapInstance: reqmapInstance])
        }
    }

    def show = {
        def reqmapInstance = Reqmap.get(params.id)
        if (!reqmapInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reqmap.label', default: 'Reqmap'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reqmapInstance: reqmapInstance]
        }
    }

    def edit = {
        def reqmapInstance = Reqmap.get(params.id)
        if (!reqmapInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reqmap.label', default: 'Reqmap'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reqmapInstance: reqmapInstance]
        }
    }

    def update = {
        def reqmapInstance = Reqmap.get(params.id)
        if (reqmapInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reqmapInstance.version > version) {
                    
                    reqmapInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reqmap.label', default: 'Reqmap')] as Object[], "Another user has updated this Reqmap while you were editing")
                    render(view: "edit", model: [reqmapInstance: reqmapInstance])
                    return
                }
            }
            reqmapInstance.properties = params
            if (!reqmapInstance.hasErrors() && reqmapInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reqmap.label', default: 'Reqmap'), reqmapInstance.id])}"
                redirect(action: "show", id: reqmapInstance.id)
            }
            else {
                render(view: "edit", model: [reqmapInstance: reqmapInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reqmap.label', default: 'Reqmap'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def reqmapInstance = Reqmap.get(params.id)
        if (reqmapInstance) {
            try {
                reqmapInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'reqmap.label', default: 'Reqmap'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'reqmap.label', default: 'Reqmap'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reqmap.label', default: 'Reqmap'), params.id])}"
            redirect(action: "list")
        }
    }
}
