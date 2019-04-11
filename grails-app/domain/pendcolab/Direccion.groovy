package pendcolab

class Direccion {

	Usuario usuario
	String calle
	String ciudad
	String estado
	String pais
	int cp
	
	static belongsTo = Usuario

    static constraints = {
    	usuario(nullable:false)
    	calle(blank:false,nullable:false)
    	ciudad(blank:false,nullable:false)
    	estado(blank:false,nullable:false)
    	pais(blank:false,nullable:false)
    	cp()
    }
    
    String toString(){
    	"$calle, $cp, $ciudad, $estado, $pais"
    	}
}
