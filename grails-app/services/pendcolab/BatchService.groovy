package pendcolab

import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.codehaus.groovy.grails.plugins.jasper.JasperService
import org.springframework.context.*
import groovy.text.*
import org.springframework.mail.*

class BatchService implements ApplicationContextAware{

    static transactional = false

	JasperService jasperService

	public void setApplicationContext(ApplicationContext applicationContext) {
		this.applicationContext = applicationContext
	}
	
	def ApplicationContext applicationContext
	def emailerService // injected


    def reportes = {
		log.info "Inicia proceso de reportes nocturnos"
		def usuarios = Usuario.withCriteria{
			isNotNull('correo')
		}
		usuarios?.each{ usuario ->
			def datos = Pendiente.findAllByUsuario(usuario)
			Map params = new HashMap()
			params.model = [data:datos]
			params.usuario = usuario.toString()
			params._format="PDF"
			params._name="pendientesUsuario"
			params._file="pendientesUsuario"
			params.name="pendientesUsuario"
			params.useDefaultParameters="true"
			//println "params: ${params}"
			ByteArrayOutputStream byteArray = jasperService.buildReportDefinition(params, Locale.getDefault(), params.model).contentStream
			Map attach = new HashMap()
			attach.put("ReportePendiente.pdf",byteArray.toByteArray())
			sendReport(usuario,attach)
		}
		log.info "Fin de proceso de reportes nocturnos"
    }
    
    def sendReport = { usuario, attach ->
		def etmpl = ApplicationHolder.application.parentContext.getResource("/WEB-INF/templates/reporteNocturno.gtpl").getFile()
		def datos = ["usuario": usuario]
		def eng = new SimpleTemplateEngine()
		def tmpl = eng.createTemplate(etmpl).make(datos)
		def cuerpo = tmpl.toString()
		def correo = [
			para:usuario.correo,
			titulo:"Tu reporte de Pendientes Colaborativos",
			texto:cuerpo
			]
		//println(correo)
		try{
			emailerService.sendEmail(correo,attach)
			}catch(MailException ex){
				log.error("Fallo envio de correo",ex)
			}
    }
}
