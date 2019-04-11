package pendcolab

import static org.apache.commons.lang.StringUtils.*
import org.codehaus.groovy.runtime.InvokerHelper
import org.codehaus.groovy.grails.commons.GrailsDomainClass
import org.codehaus.groovy.grails.commons.DomainClassArtefactHandler
import org.apache.commons.codec.digest.DigestUtils as DU
import pendcolab.Error

class RestController {

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
		def restType = (params.rest == "rest")?"XML":"JSON"
		render obj."encodeAs$restType"()
	}

	def show = {
		cache "authed_page"
		def result
		if(login){
			if(params.id) {
				result = invoke("get", params.id)
				if(!result) result=new Error(mensaje:"${domainClassName} not found with id ${params.id}",fecha:new Date()).save()
			} else {
			if(!params.max) params.max = 10
				result = invoke("list", params)
				if(!result) result=new Error(mensaje:"${domainClassName} not found with id ${params.id}",fecha:new Date()).save()
			}
			format(result)
		}
	}

	def delete = {
		cache "authed_page"
		if(ogin){
			def result = invoke("get", params.id);
			if(result) {
				result.delete()
			} else {
				result = new Error(mensaje: "${domainClassName} not found with id ${params.id}",fecha:new Date()).save()
			}
			format(result)
		}
	}

	def update = {
		cache "authed_page"
		def result
		if(login){
			def domain = invoke("get", params.id)
			if(domain) {
				domain.properties = params
				if(!domain.hasErrors() && domain.save()) {
					result = domain
				} else {
					result = new Error(mensaje: "${domainClassName} could not be saved",fecha:new Date()).save()
				}
			} else {
				result = new Error(mensaje: "${domainClassName} not found with id ${params.id}",fecha:new Date()).save()
			}
			format(result)
		}
	}

	def create = {
		cache "authed_page"
		def result
		if(login){
			def domain = InvokerHelper.invokeConstructorOf(domainClass.getClazz(), null)
			def input = ""
			request.inputStream.eachLine {
				input += it
				}
			// convert input to name/value pairs
			if(input && input != '') {
				input.tokenize('&').each {
					def nvp = it.tokenize('=');
					params.put(nvp[0],nvp[1]);
					}
				}
	//		println "params: $params"
			domain.properties = params
	//		println "dprops: ${domain.properties}"
	//		if(domain.hasErrors()) println "errores: ${domain.errors}"
	//		else println "no errors"
			if(!domain.hasErrors() && domain.save()) {
				result = domain
				} else {
					result = new Error(mensaje: "${domainClassName} could not be created",fecha:new Date()).save()
				}
			format(result)
		}
	}

}
