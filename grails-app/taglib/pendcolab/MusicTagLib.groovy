package pendcolab

import pendcolab.*

class MusicTagLib {

	static namespace="pendcolab"
	
	def ligas = { attrs, body ->
		def f=new File(grailsApplication.config.music.location.toString())
		println f?.absolutePath
		if(f.exists()){
			f.eachFile{ file ->
				if(!file.isDirectory())
					out << """<a href='${g.resource(dir:f.name,file:file.name)}'><font size="2">${file.name}</font></a>
					       """
			}
		}
	}
}
