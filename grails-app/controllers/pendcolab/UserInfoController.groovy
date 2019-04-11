package pendcolab

import static org.apache.commons.lang.StringUtils.*
import org.codehaus.groovy.runtime.InvokerHelper
import org.codehaus.groovy.grails.commons.GrailsDomainClass
import org.codehaus.groovy.grails.commons.DomainClassArtefactHandler
import org.apache.commons.codec.digest.DigestUtils as DU
import pendcolab.Error

class UserInfoController {
	private GrailsDomainClass domainClass
	private String domainClassName
	private boolean login

	def beforeInterceptor = {
		def authHeader = request.getHeader("Authorization")
		if(!authHeader){
			response.status = 401
			response.addHeader("WWW-Authenticate","Basic realm=\"Secure Area\"")
			//return
			login=false
		}
//		println "auth: $authHeader"
		if(authHeader){
			def tokens=authHeader.split(' ')
			def tokenUserPass=new String(new sun.misc.BASE64Decoder().decodeBuffer(tokens[1]));
			tokens=tokenUserPass.split(':')
			def usuario=tokens[0]
			def pass=tokens[1]
			def hpass=DU.md5Hex(pass)
			def u = Usuario.findByUsuarioAndPassword(usuario,hpass)
			if(u){
				session.usuario=u
				login=true
				}
			else{
				session.usuario=null
				response.status=403
				login=false
				//return
				}
		}
		domainClassName = "pendcolab."+capitalize(params.controller1)
//		println domainClassName
		domainClass = grailsApplication.getArtefact(DomainClassArtefactHandler.TYPE, domainClassName)
//		println domainClass
	}

	private invoke(method, parameters) {
		InvokerHelper.invokeStaticMethod(domainClass.getClazz(), method, parameters)
	}

	private format(obj) {
		//def restType = (params.rest == "rest")?"XML":"JSON"
		render obj."encodeAsXML"()
	}
	
	def show = {
		cache "authed_page"
		def result
		if(login){
			result = session.usuario
		}
		else{
			result = new Error(mensaje:'No esta firmado',fecha:new Date()).save()
		}
		format(result)
	}
	
	def index = {
		redirect(action:show)
	}
}
