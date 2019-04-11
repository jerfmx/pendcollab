
<%@ page import="pendcolab.ListaAmigos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'listaAmigos.label', default: 'ListaAmigos')}" />
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
                            <td valign="top" class="name"><g:message code="listaAmigos.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listaAmigosInstance, field: "id")}</td>
                            
                        </tr>
                    
                       <!-- <tr class="prop">
                            <td valign="top" class="name"><g:message code="listaAmigos.usuario.label" default="Usuario" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${listaAmigosInstance?.usuario?.id}">${listaAmigosInstance?.usuario?.encodeAsHTML()}</g:link></td>
                            
                        </tr> -->
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listaAmigos.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listaAmigosInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listaAmigos.descripcion.label" default="Descripcion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listaAmigosInstance, field: "descripcion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listaAmigos.miembros.label" default="Miembros" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${listaAmigosInstance.miembros}" var="m">
                                    <li><g:link controller="miembroListaAmigos" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${listaAmigosInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
