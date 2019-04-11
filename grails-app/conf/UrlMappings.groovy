class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:'/index')
		"500"(view:'/error')
		"400"(view:'/error')

		"/rss/feed/$usuario?"{
			controller="rss"
			action="feed"
			constraints{
			
			}
		}
		
		"/$rest/$controller1?/$id?"{
			controller = "rest"
			action = [GET:"show", PUT:"create", POST:"update", DELETE:"delete"]
			constraints{
				rest(inList:["rest","json"])
			}
		}
	}
}
