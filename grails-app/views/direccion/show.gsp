
<%@ page import="pendcolab.Direccion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'direccion.label', default: 'Direccion')}" />
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
                            <td valign="top" class="name"><g:message code="direccion.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: direccionInstance, field: "id")}</td>
                            
                        </tr>
                    
                     <!--   <tr class="prop">
                            <td valign="top" class="name"><g:message code="direccion.usuario.label" default="Usuario" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${direccionInstance?.usuario?.id}">${direccionInstance?.usuario?.encodeAsHTML()}</g:link></td>
                            
                        </tr> -->
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="direccion.calle.label" default="Calle" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: direccionInstance, field: "calle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="direccion.ciudad.label" default="Ciudad" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: direccionInstance, field: "ciudad")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="direccion.estado.label" default="Estado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: direccionInstance, field: "estado")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="direccion.pais.label" default="Pais" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: direccionInstance, field: "pais")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="direccion.cp.label" default="Cp" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: direccionInstance, field: "cp")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${direccionInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
