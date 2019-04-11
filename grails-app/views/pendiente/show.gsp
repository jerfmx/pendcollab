
<%@ page import="pendcolab.Pendiente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'pendiente.label', default: 'Pendiente')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pendiente.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pendienteInstance, field: "id")}</td>
                            
                        </tr>
                    
                      <!--  <tr class="prop">
                            <td valign="top" class="name"><g:message code="pendiente.usuario.label" default="Usuario" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${pendienteInstance?.usuario?.id}">${pendienteInstance?.usuario?.encodeAsHTML()}</g:link></td>
                            
                        </tr> -->
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pendiente.categoria.label" default="Categoria" /></td>
                            
                            <td valign="top" class="value"><g:link controller="categoria" action="show" id="${pendienteInstance?.categoria?.id}">${pendienteInstance?.categoria?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pendiente.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pendienteInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pendiente.estatus.label" default="Estatus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pendienteInstance, field: "estatus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pendiente.prioridad.label" default="Prioridad" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pendienteInstance, field: "prioridad")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pendiente.iniciado.label" default="Iniciado" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${pendienteInstance?.iniciado}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pendiente.modificado.label" default="Modificado" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${pendienteInstance?.modificado}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pendiente.finalizado.label" default="Finalizado" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${pendienteInstance?.finalizado}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pendiente.archivo.label" default="Archivo" /></td>
                            
                            <td valign="top" class="value">
                            	<a href="${createLink(action:'descargaArchivo',id:pendienteInstance?.id)}" target="_new">${pendienteInstance?.nombreArchivo}</a>
                            	<g:if test="${pendienteInstance?.archivo}">
                            		&nbsp;(${pendienteInstance?.archivo?.size()/1024} kb)
                            	</g:if>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pendiente.nota.label" default="Nota" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pendienteInstance, field: "nota")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pendiente.claves.label" default="Claves" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${pendienteInstance.claves}" var="c">
                                    <li><g:link controller="clave" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${pendienteInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
