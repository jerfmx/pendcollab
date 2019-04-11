

<%@ page import="pendcolab.MiembroListaAmigos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'miembroListaAmigos.label', default: 'MiembroListaAmigos')}" />
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
            <g:hasErrors bean="${miembroListaAmigosInstance}">
            <div class="errors">
                <g:renderErrors bean="${miembroListaAmigosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${miembroListaAmigosInstance?.id}" />
                <g:hiddenField name="version" value="${miembroListaAmigosInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lista"><g:message code="miembroListaAmigos.lista.label" default="Lista" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: miembroListaAmigosInstance, field: 'lista', 'errors')}">
                                    <g:select name="lista.id" from="${pendcolab.ListaAmigos.findAllByUsuario(session.usuario)}" optionKey="id" value="${miembroListaAmigosInstance?.lista?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="apodo"><g:message code="miembroListaAmigos.apodo.label" default="Apodo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: miembroListaAmigosInstance, field: 'apodo', 'errors')}">
                                    <g:textField name="apodo" value="${miembroListaAmigosInstance?.apodo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuario"><g:message code="miembroListaAmigos.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: miembroListaAmigosInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${pendcolab.Usuario.list()}" optionKey="id" value="${miembroListaAmigosInstance?.usuario?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
