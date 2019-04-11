package pendcolab


class ReporteNocturnoJob {
    def name = "ReporteNocturno" // Job name
	def group = "PendColab"   // Job group
	//def startDelay = 30000 // Wait 20 seconds to start the job
	//def timeout = 600000    // Execute job once every 60 seconds
	def cronExpression = "0 0 8 * * ?" // Run every day at 1:00 a.m.
	def batchService

    def execute() {
		log.info "Iniciando Reporte Nocturno: ${new Date()}"
		println "Iniciando Reporte Nocturno: ${new Date()}"
		batchService.reportes.call()
		log.info "Finalizado Reporte Nocturno: ${new Date()}"
		println "Finalizado Reporte Nocturno: ${new Date()}"
    }
}
