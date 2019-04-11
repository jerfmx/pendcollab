package pendcolab

class Categoria {

	Usuario usuario
	String nombre
	String descripcion
	
	static belongsTo = Usuario
	static hasMany = [pendientes:Pendiente]

    static constraints = {
    	usuario(nullable:false)
    	nombre(blank:false,nullable:false)
    	descripcion(blank:true,nullable:true,maxSize:1000)
    }
    
    String toString(){
    	nombre
    }
}
