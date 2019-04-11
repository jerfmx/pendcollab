package pendcolab

class MiembroListaAmigos {

	ListaAmigos lista
	String apodo
	Usuario usuario

	static belongsTo = ListaAmigos
	
    static constraints = {
    	lista(nullable:false)
    	apodo(blank:false,nullable:false)
    	usuario(nullable:false)
    }
    
    static mapping = {
    	columns{
    		usuario lazy:false
    	}
    }
    
    String toString(){
    	"$apodo (${usuario} [${usuario?.usuario}])"
    	}
}
