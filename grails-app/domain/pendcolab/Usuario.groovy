package pendcolab

import grails.plugins.emailvalidator.*

class Usuario {

	String usuario
	String password
	String confirmaPassword
	String nombre
	String apellidos
	String correo
	boolean mostrarCorreo
	boolean activo
	String descripcion
	
	static hasMany = [direcciones:Direccion, categorias:Categoria, pendientes:Pendiente, listasAmigos:ListaAmigos,authorities: Auth]
	static transients = ["confirmaPassword"]
	static belongsTo = Auth
	
    static constraints = {
    	usuario(blank:false,nullable:false,unique:true)
    	password(blank:false,nullable:false,password:true)
    	confirmaPassword(blank:false,nullable:false,password:true)
    	nombre(blank:false,nullable:false)
    	apellidos(blank:false,nullable:false)
    	correo(blank:false,nullable:false,email:true,validator:{
			EmailValidatorService emailValidatorService = new EmailValidatorService()
    		EmailStatus status=emailValidatorService.check(it)
    		println "status: ${status.verified} ${status.syntaxValid} ${status.getIsDomainValid()}"
    		return status.syntaxValid&&status.getIsDomainValid()
    	})
    	mostrarCorreo()
    	activo()
    	descripcion(blank:true,nullable:true,maxSize:1000)
    }
    
    String toString(){
    	"$nombre $apellidos"
    	}
}
