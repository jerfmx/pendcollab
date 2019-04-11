<div id="pendienteDetalle${pendiente.id}" class="todo" title="Detalle del pendiente ${pendiente.id}">
	<div class="todoTitle"><h2>${pendiente.nombre?.encodeAsHTML()}
		<g:link action="edit" id="${pendiente.id}">
			<img src="${resource(dir:'images',file:'write_obj.gif')}" border="0" alt="[EDIT]"/>
		</g:link>
		<g:remoteLink action="delete" id="${pendiente.id}" update="pendienteDetalle${pendiente.id}" onComplete="highlight('pendienteDetalle${pendiente.id}');">
			<img border="0" alt="[DELETE]" src="${resource(dir:'images',file:'delete_obj.gif')}"/>
		</g:remoteLink>
		<pendcolab:showHide update="pendienteUpload${pendiente.id}">
			<img src="${resource(dir:'images',file:'up-arrow.jpg')}" width="15" height="15" border="0" alt="[UPLOAD]"/>
		</pendcolab:showHide>
		<div id="pendienteUpload${pendiente.id}" class="pendiente" style="display:none">
			Archivo: 
			<uploader:uploader id="archivo${pendiente.id}" url="${[controller:'pendiente', action:'cargarArchivoAjax',id:pendiente.id]}" sizeLimit="1000000">
				<uploader:noScript>
					<p>Se necesita javascript</p>
				</uploader:noScript>
				<uploader:onComplete>
					showHide('pendienteUpload${pendiente.id}');
				</uploader:onComplete>
			</uploader:uploader>
		</div>
		<pendcolab:showHide update="pendienteDetalleFull${pendiente.id}">
			<img border="0" alt="[ShowALL]" src="${resource(dir:'images',file:'add_obj.gif')}"/>
		</pendcolab:showHide></h2>
		<div id="pendienteDetalleFull${pendiente.id}" class="pendiente" style="display:none">
			<B>Estatus:</B> ${pendiente.estatus?.encodeAsHTML()} <br/>
			<b>Prioridad:</b> ${pendiente.prioridad?.encodeAsHTML()} <br/>
			<b>Creado:</b> ${pendiente.iniciado?.encodeAsHTML()} <br/>
			<b>Modificado:</b> ${pendiente.modificado?.encodeAsHTML()} <br/>
			<g:if test="${pendiente.finalizado==null}">
				<b>Completar Pendiente:</b> <input type="checkbox" onclick="${remoteFunction(action:'completeTask',id:pendiente.id,update:'pendienteDetalle'+pendiente.id,onComplete:'highlight(\'pendienteDetalle'+pendiente.id+'\')')};"/> <br/>
			</g:if>
			<g:else>
				<b>Completado:</b> ${pendiente.finalizado?.encodeAsHTML()} <br/>
			</g:else>
			<b>Archivo:</b>
			<g:if test="${pendiente.tipoContenido?.startsWith('image')}">
				<richui:lightBox href="${createLink(action:'descargaArchivo',id:pendiente.id)}">${pendiente.nombreArchivo?.encodeAsHTML()}</richui:lightBox> <br/>
			</g:if>
			<g:else>
				<a href="${createLink(action:'descargaArchivo',id:pendiente.id)}">
					${pendiente.nombreArchivo?.encodeAsHTML()}
				</a> <br/>
			</g:else>
			<!-- radeox -->
			<b>Nota:</b> <pendcolab:radeoxRender>${pendiente.nota}</pendcolab:radeoxRender><br/>
			<b>C&oacute;digos: </b> <img align="middle" width="200" height="50" src="${createLink(controller:'barcode',action:'barcode',id:pendiente.id)}"/> <qrcode:image width="100" height="100" text="${pendiente.id}${pendiente.nombre.toUpperCase()}${new java.text.SimpleDateFormat('yyyyMMddhhmm').format(pendiente.iniciado)}"/>
			
				<g:remoteLink action="showNotes" id="${pendiente.id}" update="pendienteDetalleNota${pendiente.id}">
					Notas
				</g:remoteLink><br/>
				<div id="pendienteDetalleNota${pendiente.id}"></div>
			
		</div>
	</div>
	<%
		def url=new URL(grailsApplication.config.grails.serverURL)
		def server="${url.protocol}://${url.host}:${url.port}"
	%>
	<b:bookmark title="${pendiente.nombre}" permalink="${server}${createLink(action:'show',id:pendiente.id)}" type="addtoany"/>
</div>
<richui:tooltip id="pendienteDetalle${pendiente.id}" />
