package pendcolab

import feedsplugin.FeedBuilder

class RssController {

    def index = {
    	//println params
    	redirect(action:'feed',params:params)
    }
    
    def feed = {
		cache "recent_items_feed"
    	if(params.id) params.usuario=params.id
    	println "params: ${params}"
    	render(feedType:'atom'){
    		title = "Lista de Pendientes"
    		link = createLink(controller:'rss')
    		if(!params.usuario){
				Pendiente.list(sort:'nombre',order:'asc').each{ pendiente ->
					entry(pendiente){
						title = "${pendiente.nombre}"
						link = "${createLink(controller:'pendiente',action:'show',id:pendiente.id)}"
						author = "${pendiente.usuario}"
						publishedDate = pendiente.iniciado
						pendiente.nota
					}
				}
    		}
    		else{
		    	def u = Usuario.findByUsuario(params.usuario)
		    	Pendiente.findAllByUsuario(u).each{ pendiente ->
		    		entry(pendiente){
		    			title = "${pendiente.nombre}"
		    			link = "${createLink(controller:'pendiente',action:'show',id:pendiente.id)}"
		    			author = "${pendiente.usuario}"
						publishedDate = pendiente.iniciado
						pendiente.nota
		    		}
		    	}
    		}
    	}
    }
}
