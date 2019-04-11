package pendcolab

class Pendiente {

	Usuario usuario
	String nombre
	String nota
	Categoria categoria
	String estatus
	String prioridad
	Date iniciado
	Date modificado
	Date finalizado
	byte[] archivo
	String nombreArchivo
	String tipoContenido
	
	static hasMany = [claves:Clave]
	static belongsTo = Usuario
	static searchable = {
		mapping{
			boost 2.0
			spellCheck "include"
		}
	}

    static mapping = {
    	columns{
    		categoria lazy:false
    		usuario lazy:false
    	}
    }
	
    static constraints = {
    	usuario(nullable:false)
    	categoria(nullable:false)
    	nombre(blank:false,nullable:false)
    	estatus(inList:['Incompleta','Completa'])
    	prioridad(inList:['Baja','Media','Alta'])
    	iniciado(nullable:true)
    	modificado(nullable:true)
    	finalizado(nullable:true,validator:{ val,obj ->
    		if(val!=null){
    			return val.after(obj.iniciado)
    		}
    		return true
    	})
    	archivo(nullable:true,maxSize:1000000,size:0..1000000)
    	nombreArchivo(blank:true,nullable:true)
    	tipoContenido(blank:true,nullable:true)
    	nota(blank:true,nullable:true,maxSize:1000)
    }
    
    String toString(){
    	"$nombre"
    	}
    	
    def beforeInsert = {
    	iniciado = new Date()
    	modificado = new Date()
    }
    
    def beforeUpdate = {
    	modificado = new Date()
    }
}
