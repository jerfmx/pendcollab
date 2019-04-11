package quartz

class JobAdminController{

	def quartzScheduler

	def index = { redirect(action:'show') }

	def show = {
		def status = ""
		switch(params.operation){
			case 'pause':
				quartzScheduler.pauseJob("PrimeroJob","myServices")
				status = "Pausado un job"
				break
			case 'resume':
				quartzScheduler.resumeJob("PrimeroJob","myServices")
				status = "Reanudado un job"
				break
			case 'pauseGroup':
				quartzScheduler.pauseJobGroup("myServices")
				status = "Pausado un grupo"
				break
			case 'resumeGroup':
				quartzScheduler.resumeJobGroup("myServices")
				status = "Reanudado un grupo"
				break
			case 'pauseAll':
				quartzScheduler.pauseAll()
				status = "Pausados todos los jobs"
				break
			case 'resumeAll':
				quartzScheduler.resumeAll()
				status = "Reanudados todos los job"
				break
		}
	return [status: status]
	}
}
