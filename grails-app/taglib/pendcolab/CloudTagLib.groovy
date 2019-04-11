package pendcolab

import pendcolab.*

class CloudTagLib {

	static namespace="pendcolab"
	
	def resources = { attrs, body ->
		out << """
		<style>
			.tag {
				height: 150px; background: #DDDDDD; border: 1px solid #BBBBBB; width: 400px;
				}

			.tagLink {
				text-decoration: none; margin-left: 3px; margin-right: 3px; color: #656565;
				}
		</style>
    <style type="text/css">
    h2 {
        font: 14pt lucida, arial;
        margin: 20px 0 0 0;
        color: #4e763e;
        font-weight: bold;
    }

    #mentionsWrapper, #timelineWrapper, #rtsWrapper {
        border: 1px solid #37a3c1;
        max-height: 300px;
        width: 248px;
        overflow: auto;
    }

    #mentions, #timeline, #rts {
        width: 228px;
    }

    .tweet {
        width: 220px;
        min-height: 30px;
        color: #444;
        font: 9pt Arial;
        border-bottom: 1px dotted #37a3c1;
        padding: 6px 6px 10px 6px;
    }

    .tweet A {
        text-decoration: none;
        color: #37a3c1;
    }

    .tweet A.author {
        color: #4e763e;
        font-weight: bold;
    }

    .tweet .avatar {
        float: left;
        display: block;
        margin: 0 6px 0 0px;
    }

    .tweet IMG {
        width: 30px;
        height: 30px;
    }

    .tweet .text {
    }

    .tweet .foot {
        margin-top: 4px;
        color: #888;
        font: 7pt lucida, arial;
    }

    .tweet .foot A.reply {
        font-weight: bold;
    }



    </style>
    		"""
		}
	def tagCloud = { attrs, body ->
		def lista = Clave.list()
		def map = [:]
		lista.each{ clave ->
			map[clave.nombre]=0.1f+Math.random()%(lista.size()/10.0f)
		}
		out << richui.tagCloud(class:'tag',linkClass:'tagLink',values:map)
	}
}
