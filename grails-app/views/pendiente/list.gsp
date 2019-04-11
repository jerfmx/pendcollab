
<%@ page import="pendcolab.Pendiente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'pendiente.label', default: 'Pendiente')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
           <!-- <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span> -->
			<span class="menuButton"><a class="list" href="${createLink(uri:'/rss/feed/'+session?.usuario?.usuario)}">RSS</a></span>
			<g:ifAllGranted role="ROLE_ADMIN">
				<span class="menuButton"><a class="list" href="${createLink(uri:'/admin/admin')}">Admin</a></span>
			</g:ifAllGranted>
			<span class="menuButton"><a class="list" href="${createLink(uri:'/pendiente/list')}">Actualizar Lista</a></span>
        </div>
        <div class="body">
        	<pendcolab:preLoadShowHide />
            <h1><g:message code="default.list.label" args="[entityName]" />
            <pendcolab:showHide update="addPendiente">
            	<img border="0" src="${resource(dir:'images',file:'add_obj.gif')}" alt="[ADD]"/>
            </pendcolab:showHide></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div id="addPendiente" style="display:none">
            	<g:formRemote name="pendienteForm" url="[controller:'pendiente',action:'guardar']" update="pendienteList" onComplete="showHide('addPendiente')" enctype="multipart/form-data">
					<g:hiddenField name="id" value="${pendiente?.id}" />
					<div class="dialog">
						<table>
							<tbody>
								<tr class='prop'>
									<td valign='top' class='name'>
										<label for='categoria'>Categoria:</label>
									</td>
									<td valign='top' class="value ${hasErrors(bean:pendiente,field:'usuario','errors')}">
										<g:select name="categoria.id" from="${pendcolab.Categoria.findAllByUsuario(session.usuario)}" optionKey="id" value="${pendiente?.categoria?.id}"  />
									</td>
								</tr>

								<tr class='prop'>
									<td valign='top' class='name'>
										<label for='nombre'>Nombre:</label>
									</td>
									<td valign='top' class="value ${hasErrors(bean:pendiente,field:'nombre','errors')}">
										<input type="text" name='nombre' value="${pendiente?.nombre?.encodeAsHTML()}"/>
									</td>
								</tr>

								<tr class='prop'>
									<td valign='top' class='name'>
										<label for='iniciado'>Iniciado:</label>
									</td>
									<td valign='top' class="value ${hasErrors(bean:pendiente,field:'creado','errors')}">
										<calendar:datePicker name="iniciado" defaultValue="${pendiente?.iniciado}"/>
									</td>
								</tr>

								<tr class='prop'>
									<td valign='top' class='name'>
										<label for='prioridad'>Prioridad:</label></td>
									<td valign='top' class="value ${hasErrors(bean:pendiente,field:'prioridad','errors')}">
										<g:select from="${new Pendiente().constraints?.prioridad?.inList}" name='prioridad' value="${pendiente?.prioridad}"/>
									</td>
								</tr>

								<tr class='prop'>
									<td valign='top' class='name'>
										<label for='estatus'>Estatus:</label>
									</td>
									<td valign='top' class="value ${hasErrors(bean:pendiente,field:'estatus','errors')}">
										<g:select from="${new Pendiente().constraints?.estatus?.inList}" name='estatus' value="${pendiente?.estatus}"/>
									</td>
								</tr>

								<tr class='prop'>
									<td valign='top' class='name'>
										<label for='nota'>Nota:</label>
									</td>
									<td valign='top' class="value ${hasErrors(bean:pendiente,field:'nota','errors')}">
										<ckeditor:editor name="nota">
											${pendiente?.nota}
										</ckeditor:editor>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="buttons">
						<span class="formButton">
							<input type="submit" value="${pendiente?.id > 0 ? 'Update' : 'Create'}"/>
						</span>

						<span class="formButton">
							<a class="formButton" href="${createLink(controller: 'pendiente', action: 'list')}">Cancelar</a>
						</span>
					</div>
				</g:formRemote>
            </div>
            <div id="pendienteList">
            	<g:render template="detalle" var="pendiente" collection="${Pendiente.findAllByUsuario(session.usuario)}"/>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pendienteInstanceTotal}" />
            </div>
			<g:jasperReport
				jasper="pendientesUsuario"
				format="PDF,HTML,XML,CSV,XLS,RTF,TEXT,ODT,ODS,DOCX,XLSX,PPTX"
				name="Pendientes de ${session.usuario}"
				controller="pendiente"
				action="reporte"
				height="20"
				>
				<input type="hidden" name="usuario" value="${session.usuario}"/>
				<input type="hidden" name="useDefaultParameters" value="true"/>
			</g:jasperReport><br/>
			<g:jasperReport
				jasper="pendientesExport"
				format="XML,CSV,XLS,XLSX"
				name="Exportar Pendientes"
				controller="pendiente"
				action="reporte"
				height="20"
				>
				<input type="hidden" name="usuario" value="${session.usuario}"/>
				<input type="hidden" name="useDefaultParameters" value="true"/>
			</g:jasperReport><nobr>
			<pendcolab:showHide update="pendienteImport">
				| <img src="${resource(dir:'images',file:'up-arrow.jpg')}" width="20" height="20" border="0" alt="[UPLOAD] XLS o CSV"/> | 
			</pendcolab:showHide> <strong>Importar Pendientes</strong> <div id="pendienteImport" class="pendiente" style="display:none">
				Archivo: 
				<uploader:uploader id="import" url="${[controller:'pendiente', action:'importar']}" sizeLimit="1000000">
					<uploader:noScript>
						<p>Se necesita javascript</p>
					</uploader:noScript>
					<uploader:onComplete>
						showHide('pendienteImport');
					</uploader:onComplete>
				</uploader:uploader>
			</div></nobr>
        </div>
    </body>
</html>
