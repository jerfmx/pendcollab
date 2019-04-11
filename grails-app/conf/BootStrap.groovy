import grails.util.GrailsUtil
import org.apache.commons.codec.digest.DigestUtils as DU
import pendcolab.*

class BootStrap {

   	def emailConfirmationService
    
    def init = { servletContext ->
    	println "loading bootstrap..."
    	switch(GrailsUtil.environment){
    		case "development":
    			def userAuth = new Auth(authority:"ROLE_USER", description: "Authenticated User").save()
				def su = new Auth(authority:"ROLE_ADMIN", description: "Administrator Role").save()
    			new Clave(nombre:'java').save()
    			new Clave(nombre:'groovy').save()
    			new Clave(nombre:'grails').save()
    			new Clave(nombre:'griffon').save()
    			new Clave(nombre:'admin').save()
    			new Reqmap(url:"/**",configAttribute:"IS_AUTHENTICATED_ANONYMOUSLY").save()
				new Reqmap(url:"/pendiente/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/usuario/list/**",configAttribute:"ROLE_ADMIN").save()
				new Reqmap(url:"/admin/**",configAttribute:"ROLE_ADMIN").save()
				new Reqmap(url:"/auth/**",configAttribute:"ROLE_ADMIN").save()
				new Reqmap(url:"/reqmap/**",configAttribute:"ROLE_ADMIN").save()
				new Reqmap(url:"/clave/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/direccion/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/categoria/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/listaAmigos/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/miembrolistaAmigos/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/searchable/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/standardFileManagerConnector/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/ck/ofm/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/ck/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/jasper/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/adminManage/**",configAttribute:"ROLE_ADMIN").save()
				new Reqmap(url:"/buildinfo/**",configAttribute:"ROLE_ADMIN").save()
				new Reqmap(url:"/barcode/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/ajaxUpload/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
    			new Reqmap(url:"/qrcode/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
    			new Reqmap(url:"/twitterChecker/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
    			
    			def u=new Usuario(usuario:'jerf',password:DU.md5Hex('jerfjerf'),nombre:'Eduardo',apellidos:'Razo',
    									confirmaPassword:DU.md5Hex('jerfjerf'),correo:'joseeduardo.razo@upaep.mx',
    			                        activo:true,mostrarCorreo:false,descripcion:'yo')
    			ListaAmigos l
    			if(u.validate()){
    				u.save()
					su.addToPeople(u)
					new Direccion(usuario:u,calle:'pestalozzi 9',ciudad:'pue',estado:'pue',pais:'MEX',cp:72080).save()
					new Categoria(usuario:u,nombre:'personal',descripcion:'personal').save()
					new Categoria(usuario:u,nombre:'profesional',descripcion:'profesional').save()
					new Pendiente(usuario:u,nombre:'prueba1',iniciado:new Date(),categoria:Categoria.get(1),estatus:'Incompleta',prioridad:'Baja',nota:'prueba1').save()
					new Pendiente(usuario:u,nombre:'prueba2',iniciado:new Date(),categoria:Categoria.get(1),estatus:'Incompleta',prioridad:'Baja',nota:'prueba2').save()
					new Pendiente(usuario:u,nombre:'prueba3',iniciado:new Date(),categoria:Categoria.get(1),estatus:'Incompleta',prioridad:'Baja',nota:'prueba3').save()
					l=new ListaAmigos(usuario:u,nombre:'amigos',descripcion:'amigos')
					l.save()
					new MiembroListaAmigos(lista:l,usuario:u,apodo:'yo').save()
    				}
    			else{
    				println u.errors
    				println "No guardado"
    			}
    			//Usuario.get(1)
    			
    			def u1=new Usuario(usuario:'spdiaz',password:DU.md5Hex('spdiaz'),nombre:'Sandra',apellidos:'Pérez',correo:'sandra.perez@upaep.mx',
    			                        confirmaPassword:DU.md5Hex('spdiaz'),activo:true,mostrarCorreo:true,descripcion:'sandy')
    			//Usuario.get(2)
    			if(u1.validate()){
    				u1.save()
					userAuth.addToPeople(u1)
					new Direccion(usuario:u1,calle:'24 pte 1508',ciudad:'pue',estado:'pue',pais:'MEX',cp:72080).save()
					new Categoria(usuario:u1,nombre:'personales',descripcion:'').save()
					new MiembroListaAmigos(lista:l,usuario:u1,apodo:'sandy').save()
					l=new ListaAmigos(usuario:u1,nombre:'mis amigos',descripcion:'')
					l.save()
					new MiembroListaAmigos(lista:l,usuario:u1,apodo:'yo').save()
					new MiembroListaAmigos(lista:l,usuario:u,apodo:'jerf').save()
					new Pendiente(usuario:u1,nombre:'prueba4',iniciado:new Date(),categoria:Categoria.get(3),estatus:'Incompleta',prioridad:'Baja',nota:'prueba4').save()
					new Pendiente(usuario:u1,nombre:'prueba5',iniciado:new Date(),categoria:Categoria.get(3),estatus:'Incompleta',prioridad:'Baja',nota:'prueba5').save()
    			}
    			else{
    				println u1.errors
    				println "No guardado"
    			}
    			break
    		case "production":
    			def userAuth = Auth.get(1)
    			if(!userAuth)
    				userAuth = new Auth(authority:"ROLE_USER", description: "Authenticated User").save()
				def su = Auth.get(2)
				if(!su)
					su = new Auth(authority:"ROLE_ADMIN", description: "Administrator Role").save()
    			if(Reqmap.list().size()<=16){
	    			new Reqmap(url:"/**",configAttribute:"IS_AUTHENTICATED_ANONYMOUSLY").save()
				new Reqmap(url:"/pendiente/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/usuario/list/**",configAttribute:"ROLE_ADMIN").save()
				new Reqmap(url:"/admin/**",configAttribute:"ROLE_ADMIN").save()
				new Reqmap(url:"/auth/**",configAttribute:"ROLE_ADMIN").save()
				new Reqmap(url:"/reqmap/**",configAttribute:"ROLE_ADMIN").save()
				new Reqmap(url:"/clave/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/direccion/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/categoria/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/listaAmigos/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/miembrolistaAmigos/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/searchable/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/standardFileManagerConnector/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/ck/ofm/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/ck/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/jasper/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/adminManage/**",configAttribute:"ROLE_ADMIN").save()
				new Reqmap(url:"/buildinfo/**",configAttribute:"ROLE_ADMIN").save()
				new Reqmap(url:"/barcode/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
				new Reqmap(url:"/ajaxUpload/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
	    			new Reqmap(url:"/qrcode/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
	    			new Reqmap(url:"/twitterChecker/**",configAttribute:"IS_AUTHENTICATED_FULLY").save()
					}
				Usuario admin = Usuario.get(1)
				if(!admin){
					admin = new Usuario(usuario:'jerf',password:DU.md5Hex('jerfjerf'),nombre:'Eduardo',apellidos:'Razo',
    									confirmaPassword:DU.md5Hex('jerfjerf'),correo:'joseeduardo.razo@upaep.mx',
    			                        activo:true,mostrarCorreo:false,descripcion:'yo').save()
    			    su.addToPeople(admin)
    			    }
				break
    	}
		emailConfirmationService.onConfirmation = { email, uid ->
			log.info("User with id $uid has confirmed their email address $email")
			// now do something…
			def u=Usuario.findByCorreo(email)
			if(u){
				print "activando..."
				u.activo=true
				u.confirmaPassword=u.password
				if(u.validate()) print("validado...")
				else{
					println """."""
					u.errors.each{
						println it
					}
				}
				print "salvando..."
				if(u.save())
					println "ok"
				else println "not ok"
				}
			println u
			// Then return a map which will redirect the user to this destination
			return [controller:'usuario',view:'thanks']
			}
		emailConfirmationService.onInvalid = { uid -> 
			log.info("User with id $uid failed to confirm email address after 30 days")
			//println("User with id $uid failed to confirm email address after 30 days")
			}
		emailConfirmationService.onTimeout = { email, uid -> 
			log.info("User with id $uid failed to confirm email address after 30 days")
			//println("User with id $uid failed to confirm email address after 30 days")
			}
    }
    
    def destroy = {
    }
}
