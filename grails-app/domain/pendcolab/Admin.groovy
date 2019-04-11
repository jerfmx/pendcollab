package pendcolab

class Admin extends Usuario{

	String departamento
	
    static constraints = {
    	departamento(nullable:true,blank:true)
    }
    
    String toString(){
    	"*($departamento): ${super.toString()}"
    }
}
