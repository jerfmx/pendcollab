package pendcolab

import org.apache.commons.codec.digest.DigestUtils as DU
import groovy.text.*
import org.springframework.mail.*
import org.codehaus.groovy.grails.commons.ApplicationHolder

class UsuarioController {

	def emailerService
	def emailConfirmationService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    }

    def create = {
        def usuarioInstance = new Usuario()
        usuarioInstance.properties = params
        return [usuarioInstance: usuarioInstance]
    }

    def save = {
        if(params.password!=params.confirmaPassword){
        	flash.message="Las contraseñas no coinciden"
        	redirect(action:'list')
        	return
        }
        def usuarioInstance = new Usuario(params)
        usuarioInstance.password = DU.md5Hex(params.password)
        if (usuarioInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
   			def auth=Auth.findByAuthority("ROLE_USER")
			Usuario u=auth.people.find{it.id=params.id}
			if(!u) auth.addToPeople(usuarioInstance)
            redirect(action: "show", id: usuarioInstance.id)
        }
        else {
            render(view: "create", model: [usuarioInstance: usuarioInstance])
        }
    }

    def show = {
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
        else {
            [usuarioInstance: usuarioInstance]
        }
    }

    def edit = {
    	def admin=Auth.findByAuthority("ROLE_ADMIN").people.find{ it.id=session.usuario.id}
    	if(session.usuario.usuario != Usuario.get(params.id).usuario && !admin){
    		flash.message = "Solo puedes editar tu información"
    		redirect(action:'list')
    		return
    	}
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
        else {
        	usuarioInstance.confirmaPassword=usuarioInstance.password
            return [usuarioInstance: usuarioInstance]
        }
    }

    def update = {
        def usuarioInstance = Usuario.get(params.id)
        if (usuarioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (usuarioInstance.version > version) {
                    usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'usuario.label', default: 'Usuario')] as Object[], "Another user has updated this Usuario while you were editing")
                    render(view: "edit", model: [usuarioInstance: usuarioInstance])
                    return
                }
            }
            def oldp=usuarioInstance.password
            if(params.password!=params.confirmaPassword){
            	flash.message="Las contraseñas no coinciden"
            	redirect(action:'show',id:usuarioInstance.id)
            	return
            }
            usuarioInstance.properties = params
            if(params.password==""&&params.confirmaPassword==""){
            	usuarioInstance.password=oldp
            }
            else{
            	if(params.password!=oldp){
            		usuarioInstance.password=DU.md5Hex(params.password)
            		}
            	else usuarioInstance.password=oldp
            }
            if (!usuarioInstance.hasErrors() && usuarioInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
                redirect(action: "show", id: usuarioInstance.id)
            }
            else {
				if(session.usuario.usuario != UsuarioInstance.usuario){
					flash.message = "Solo puedes editar tu información"
					redirect(action:'list')
					return
				}
                render(view: "edit", model: [usuarioInstance: usuarioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
    	def admin=Auth.findByAuthority("ROLE_ADMIN").people.find{ it.id=session.usuario.id}
        def usuarioInstance = Usuario.get(params.id)
		if(session.usuario.usuario != usuarioInstance.usuario && !admin){
			flash.message = "Solo puedes editar tu información"
			redirect(action:'list')
			return
		}
        if (usuarioInstance) {
            try {
                usuarioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def entrar = {}
    
    def entrada = {
    	def hpass=""
    	if(params.password)
    		hpass = DU.md5Hex(params?.password)
    	else hpass=""
    	Usuario u = Usuario.findByUsuarioAndPassword(params.usuario,hpass)
    	if(!u){
    		flash.message = "Usuario no encontrado"
    		redirect(action:'entrar')
    		return
    	}
    	session.usuario = u
    	redirect(controller:'pendiente')
    }
    
    def salida = {
    	if(session.usuario){
    		session.usuario = null
    		session.invalidate()
    		redirect(action:'entrar')
    	}
    }

    def registro = {
        def usuarioInstance = new Usuario()
        usuarioInstance.properties = params
        return [usuarioInstance: usuarioInstance]
    }

    def registrar = {
        if(params.password!=params.confirmaPassword){
        	flash.message="Las contraseñas no coinciden"
        	redirect(action:'list')
        	return
        }
        def captcha=session.captcha
        session.captcha=null
        if(params.captcha.toUpperCase()!=captcha){
        	flash.message="Los codigos no coinciden"
        	redirect(action:'registro')
        	return
        }
        
        def usuarioInstance = new Usuario(params)
        usuarioInstance.password = DU.md5Hex(params.password)
        if (usuarioInstance.save(flush: true)) {
            flash.message = "usuario registrado"
			enviaNotificacion usuarioInstance
			emailConfirmationService.sendConfirmation(usuarioInstance.correo,"Por favor confirma para poder activar tu cuenta",
			       [view:'confirm'])
			def auth=Auth.findByAuthority("ROLE_USER")
			auth.addToPeople(usuarioInstance)
            redirect(controller:'pendiente')
        }
        else {
            render(view: "registro", model: [usuarioInstance: usuarioInstance])
        }
    }

	private enviaNotificacion = { usuario ->
		def etmpl = ApplicationHolder.application.parentContext.getResource("/WEB-INF/templates/regisrationEmail.gtpl").getFile()
		def datos = ["usuario": usuario]
		def eng = new SimpleTemplateEngine()
		def tmpl = eng.createTemplate(etmpl).make(datos)
		def cuerpo = tmpl.toString()
		def correo = [
			para:usuario.correo,
			titulo:"Bienvenido a Pendientes Colaborativos",
			texto:cuerpo
			]
		println(correo)
		try{
			emailerService.sendEmail(correo,[])
			}catch(MailException ex){
				log.error("Fallo envio de correo",ex)
				return false
			}
		true
	}

	def buscaUsuarios = {
		def usuarios = Usuario.createCriteria().list(){
			or{
				like("usuario","%${params.userId}%")
				like("nombre","%${params.userId}%")
				like("apellidos","%${params.userId}%")
			}
			order("apellidos")
			order("nombre")
		}
		def writer = new StringWriter()
		new groovy.xml.MarkupBuilder(writer).ul{
			for(u in usuarios){
				li(id:u.id,"$u.apellidos,$u.nombre")
			}
		}
		render writer.toString()
	}
	
	def confirm = {}
}
