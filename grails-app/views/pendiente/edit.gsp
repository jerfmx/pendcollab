

<%@ page import="pendcolab.Pendiente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'pendiente.label', default: 'Pendiente')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pendienteInstance}">
            <div class="errors">
                <g:renderErrors bean="${pendienteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:uploadForm method="post">
                <g:hiddenField name="id" value="${pendienteInstance?.id}" />
                <g:hiddenField name="version" value="${pendienteInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                           <!-- <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuario"><g:message code="pendiente.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pendienteInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${pendcolab.Usuario.list()}" optionKey="id" value="${pendienteInstance?.usuario?.id}"  />
                                </td>
                            </tr> -->
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="categoria"><g:message code="pendiente.categoria.label" default="Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pendienteInstance, field: 'categoria', 'errors')}">
                                    <g:select name="categoria.id" from="${pendcolab.Categoria.findAllByUsuario(session.usuario)}" optionKey="id" value="${pendienteInstance?.categoria?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="pendiente.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pendienteInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${pendienteInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estatus"><g:message code="pendiente.estatus.label" default="Estatus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pendienteInstance, field: 'estatus', 'errors')}">
                                    <g:select name="estatus" from="${pendienteInstance.constraints.estatus.inList}" value="${pendienteInstance?.estatus}" valueMessagePrefix="pendiente.estatus"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="prioridad"><g:message code="pendiente.prioridad.label" default="Prioridad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pendienteInstance, field: 'prioridad', 'errors')}">
                                    <g:select name="prioridad" from="${pendienteInstance.constraints.prioridad.inList}" value="${pendienteInstance?.prioridad}" valueMessagePrefix="pendiente.prioridad"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="iniciado"><g:message code="pendiente.iniciado.label" default="Iniciado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pendienteInstance, field: 'iniciado', 'errors')}">
                                    <calendar:datePicker name="iniciado" defaultValue="${pendienteInstance?.iniciado}"/>
                                </td>
                            </tr>
                        
                           <!--<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="modificado"><g:message code="pendiente.modificado.label" default="Modificado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pendienteInstance, field: 'modificado', 'errors')}">
                                    <g:datePicker name="modificado" precision="day" value="${pendienteInstance?.modificado}" default="none" noSelection="['': '']" />
                                </td>
                            </tr> -->
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="finalizado"><g:message code="pendiente.finalizado.label" default="Finalizado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pendienteInstance, field: 'finalizado', 'errors')}">
                                    <calendar:datePicker name="finalizado" defaultValue="${pendienteInstance?.finalizado}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="finalizado"><g:message code="pendiente.archivo.label" default="Archivo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pendienteInstance, field: 'archivo', 'errors')}">
                                	<a href="${createLink(action:'descargaArchivo',id:pendienteInstance.id)}" target="_new">${pendienteInstance.nombreArchivo}</a><br/>
                                    <input type="file" name="archivo">
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nota"><g:message code="pendiente.nota.label" default="Nota" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pendienteInstance, field: 'nota', 'errors')}">
									<ckeditor:editor name="nota">
										${pendienteInstance?.nota}
									</ckeditor:editor>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="claves"><g:message code="pendiente.claves.label" default="Claves" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pendienteInstance, field: 'claves', 'errors')}">
                                    <g:select name="claves" from="${pendcolab.Clave.list()}" multiple="yes" optionKey="id" size="5" value="${pendienteInstance?.claves*.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:uploadForm>
        </div>
    </body>
</html>
