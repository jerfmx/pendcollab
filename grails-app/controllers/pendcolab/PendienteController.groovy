package pendcolab

import org.grails.plugins.springsecurity.service.AuthenticateService
import org.springframework.security.context.SecurityContextHolder as SCH
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import java.text.SimpleDateFormat
import org.apache.poi.hssf.usermodel.*
import org.grails.plugins.excelimport.ExcelImportUtils

class PendienteController {

	def authenticateService

    static allowedMethods = [save: "POST", update: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
    	cache "authed_page"
    	println "${grailsApplication.config.music.location}\n${grailsApplication.config.twitterChecker.storageFolder}"
    	Usuario u=Usuario.findByUsuario(SCH?.context?.authentication.principal?.getUsername())
    	session.usuario=u
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        u=Usuario.get(session.usuario?.id)
        [pendienteInstanceList: Pendiente.findAllByUsuario(u,params), pendienteInstanceTotal: Pendiente.countByUsuario(u)]
    }

    def create = {
    	cache "authed_page"
        def pendienteInstance = new Pendiente()
        pendienteInstance.properties = params
        pendienteInstance.usuario = session.usuario
        return [pendienteInstance: pendienteInstance]
    }

    def save = {
    	cache "authed_page"
        def pendienteInstance = new Pendiente(params)
        pendienteInstance.usuario = session.usuario
        cargarArchivo pendienteInstance
        if (pendienteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pendiente.label', default: 'Pendiente'), pendienteInstance.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "create", model: [pendienteInstance: pendienteInstance])
        }
    }

    def show = {
    	cache "authed_page"
        def pendienteInstance = Pendiente.get(params.id)
        if (!pendienteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pendiente.label', default: 'Pendiente'), params.id])}"
            redirect(action: "list")
        }
        else {
        	if(pendienteInstance.usuario?.usuario!=session.usuario?.usuario){
        		flash.message="Solo puedes editar tu información"
        		redirect(action:'list')
        		return
        	}
            [pendienteInstance: pendienteInstance]
        }
    }

    def edit = {
    	cache "authed_page"
        def pendienteInstance = Pendiente.get(params.id)
        if (!pendienteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pendiente.label', default: 'Pendiente'), params.id])}"
            redirect(action: "list")
        }
        else {
        	if(pendienteInstance.usuario?.usuario!=session.usuario?.usuario){
        		flash.message="Solo puedes editar tu información"
        		redirect(action:'list')
        		return
        	}
		return [pendienteInstance: pendienteInstance]
        }
    }

    def update = {
    	cache "authed_page"
        def pendienteInstance = Pendiente.get(params.id)
        if (pendienteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pendienteInstance.version > version) {
                    
                    pendienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pendiente.label', default: 'Pendiente')] as Object[], "Another user has updated this Pendiente while you were editing")
                    render(view: "edit", model: [pendienteInstance: pendienteInstance])
                    return
                }
            }
        	if(pendienteInstance.usuario?.usuario!=session.usuario?.usuario){
        		flash.message="Solo puedes editar tu información"
        		redirect(action:'list')
        		return
        	}
            def old=pendienteInstance.archivo
            def oldname=pendienteInstance.nombreArchivo
            def oldtype=pendienteInstance.tipoContenido
            pendienteInstance.properties = params
            if(params.archivo==oldname||params.archivo.originalFilename.trim()==""){
            	pendienteInstance.archivo=old
            	pendienteInstance.nombreArchivo=oldname
            	pendienteInstance.tipoContenido=oldtype
            }
            else cargarArchivo pendienteInstance
            
            if (!pendienteInstance.hasErrors() && pendienteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'pendiente.label', default: 'Pendiente'), pendienteInstance.id])}"
                redirect(action: "list")
            }
            else {
                render(view: "edit", model: [pendienteInstance: pendienteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pendiente.label', default: 'Pendiente'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
    	cache "authed_page"
        def pendienteInstance = Pendiente.get(params.id)
        if (pendienteInstance) {
            try {
				if(pendienteInstance.usuario?.usuario!=session.usuario?.usuario){
					flash.message="Solo puedes editar tu información"
					redirect(action:'list')
					return
				}
                pendienteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pendiente.label', default: 'Pendiente'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pendiente.label', default: 'Pendiente'), params.id])}"
                redirect(action: "list")
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pendiente.label', default: 'Pendiente'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def beforeInterceptor = {
    	log.info "${session.usuario?.usuario} Inicio action ${controllerName}Controller.${actionName}(): parametros $params"
    }
    
    def afterInterceptor = { model ->
    	log.trace "${} Termino action ${controllerName}Controller.${actionName}(): return $model"
    }
    
    def cargarArchivo = { pendiente ->
    	cache "authed_page"
    	if(request instanceof MultipartHttpServletRequest){
    		MultipartHttpServletRequest mhsr=(MultipartHttpServletRequest)request
    		CommonsMultipartFile archivo = mhsr.getFile("archivo")
    		println("file: "+archivo.originalFilename)
    		if(pendiente.nombreArchivo!=archivo.originalFilename&&archivo.originalFilename!=""){
				pendiente.nombreArchivo=archivo.originalFilename
				pendiente.tipoContenido=archivo.contentType
				pendiente.archivo=archivo.bytes
    		}
    	}
    	else println("no multipart")
    }
    
    def cargarArchivoAjax = {
    	cache "authed_page"
    	if(request instanceof MultipartHttpServletRequest){
    		MultipartHttpServletRequest mhsr=(MultipartHttpServletRequest)request
    		CommonsMultipartFile archivo = mhsr.getFile("qqfile")
    		println("file: "+archivo?.originalFilename)
    		def pendiente = Pendiente.get(params.id)
    		if(pendiente.nombreArchivo!=archivo.originalFilename&&archivo.originalFilename!=""){
				pendiente.nombreArchivo=archivo.originalFilename
				pendiente.tipoContenido=archivo.contentType
				pendiente.archivo=archivo.bytes
    		}
    		render('{success:true}')
    	}
    	else{ 
    		println("no multipart")
    		render('{success:false}')
    		}
    }
    
    def descargaArchivo = {
    	cache "authed_page"
    	def pendiente = Pendiente.get(params.id)
    	response.setHeader("Content-disposition","attachment; filename=${pendiente.nombreArchivo}")
    	response.contentType=pendiente.tipoContenido
    	response.outputStream << pendiente.archivo
    }

	def guardar = {
		cache "authed_page"
        def pendienteInstance = new Pendiente(params)
        pendienteInstance.usuario = session.usuario
        if (pendienteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pendiente.label', default: 'Pendiente'), pendienteInstance.id])}"
			def lista = [pendienteInstance]
			render(template:'detalle',var:'pendiente',collection:lista)
        }
	}

	def completeTask = {
		cache "authed_page"
		def pendiente = Pendiente.get(params.id)
		if(pendiente){
			pendiente.finalizado=new Date()
			pendiente.modificado=new Date()
			pendiente.estatus="Completa"
			pendiente.save()
		}
		def lista = [pendiente]
		render(template:'detalle',var:'pendiente',collection:lista)
	}
	
	def reporte = {
		cache "authed_page"
		def pendientes = Pendiente.findAllByUsuario(session.usuario)
		chain(controller:'jasper',action:'index',model:[data:pendientes],params:params)
	}
	
	def importar = {
		cache "authed_page"
    	if(request instanceof MultipartHttpServletRequest){
    		MultipartHttpServletRequest mhsr=(MultipartHttpServletRequest)request
    		CommonsMultipartFile archivo = mhsr.getFile("qqfile")
    		//println("file: "+archivo?.originalFilename)
			if(archivo){
				if(archivo.originalFilename.toLowerCase().contains('.csv')){
					new String(archivo?.bytes).eachCsvLine{ row ->
						if(row[0]!='nombre'){
							def props = [:]
							props.nombre = row[0]
							def tmp = row[1].split(' ')
							props.usuario = Usuario.findByNombreAndApellidos(tmp[0],tmp[1])
							props.categoria = Categoria.findByUsuarioAndNombre(props.usuario,row[2])
							props.prioridad = row[3]
							props.estatus = row[4]
							if(row[5]!="") props.iniciado = new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(row[5])
							else props.iniciado = null
							if(row[6]!="") props.finalizado = new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(row[6])
							else props.finalizado = null
							if(row[7]!="") props.nota = row[7]
							else props.nota = null
							if(!props.finalizado?.after(new Date())) props.finalizado=null
							new Pendiente(props).save()
						}
					}
					render('{success:true}')
	    		}else if(archivo.originalFilename.toLowerCase().contains('.xls')){
	    			HSSFWorkbook workbook=new HSSFWorkbook(archivo.inputStream)
					Map CONFIG_BOOK_COLUMN_MAP = [
														sheet:'Page 1', 
														startRow: 1,
														columnMap:  [
																	'B':'nombre',
																	'C':'usuario',
																	'D':'categoria',
																	'E':'prioridad',
																	'F':'estatus',
																	'G':'iniciado',
																	'H':'finalizado',
																	'I':'nota'
																	]
														]
	    			ExcelImportUtils.convertColumnMapConfigManyRows(workbook, CONFIG_BOOK_COLUMN_MAP).each{ map ->
	    				def tmp=map.usuario.split(' ')
	    				map.usuario=Usuario.findByNombreAndApellidos(tmp[0],tmp[1])
	    				map.categoria=Categoria.findByUsuarioAndNombre(map.usuario,map.categoria)
	    				if(map.iniciado!="") map.iniciado=new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(map.iniciado)
	    				else map.iniciado=null
	    				if(map.finalizado) map.finalizado=new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(map.finalizado)
						if(!map.finalizado?.after(new Date())) map.finalizado=null
	    				new Pendiente(map).save()
	    				}
					render('{success:true}')	    				
	    		}
			}
			else render('{success:false}')
    	}
    	else{ 
    		render('{success:false}')
    		}
	}
}
