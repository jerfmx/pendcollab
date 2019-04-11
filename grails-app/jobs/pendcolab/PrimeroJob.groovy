package pendcolab


class PrimeroJob {
    def timeout = 5000l // execute job once in 5 seconds
    def concurrent = false
    def group = "MmyServices"
    

    def execute() {
        //println "Hola desde el primer Job: ${new Date()}"
    }
}
