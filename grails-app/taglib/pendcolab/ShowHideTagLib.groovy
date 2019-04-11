package pendcolab

class ShowHideTagLib {

	static namespace = "pendcolab"

	def showHide = { attrs, body ->
		def divId = attrs['update']
		out << """<a href="javascript:showHide('$divId');">${body()}</a>"""
	}
	
	def preLoadShowHide = { attrs, body ->
		out << """
			<script language="javascript">
				//<!--
				
				function showHide(layer_ref){
					// Let's get the state
					var state = document.getElementById(layer_ref).style.display;
					if(state=='block'){
						state='none';
					}else{
						state='block';
					}
					if(document.all){ //IE
						eval("document.all."+layer_ref+".style.display=state");
					}
					if(document.layers){ // Netscape / mozilla
						document.layers[layer_ref].display=state;
					}
					if(document.getElementById&&!document.all){
						hza=document.getElementById(layer_ref);
						hza.style.display = state;
					}
				}
				// -->
			</script>
			"""
	}
}
