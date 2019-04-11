package pendcolab

class Clave {

	String nombre
	String descripcion

	static hasMany = [pendientes:Pendiente]
	static belongsTo = Pendiente
	
    static constraints = {
    	nombre(blank:false,nullable:false,validator:{
    		if(Clave.findAllByDescripcion(it).size()>0){
    			return false
    		}
    		return true
    	})
    	descripcion(nullable:true,blank:true)
    }
    
    String toString(){
    	nombre
    }
}
