

<%@ page import="pendcolab.ListaAmigos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'listaAmigos.label', default: 'ListaAmigos')}" />
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
            <g:hasErrors bean="${listaAmigosInstance}">
            <div class="errors">
                <g:renderErrors bean="${listaAmigosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${listaAmigosInstance?.id}" />
                <g:hiddenField name="version" value="${listaAmigosInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        <!--    <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuario"><g:message code="listaAmigos.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaAmigosInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${pendcolab.Usuario.list()}" optionKey="id" value="${listaAmigosInstance?.usuario?.id}"  />
                                </td>
                            </tr> -->
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="listaAmigos.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaAmigosInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${listaAmigosInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="listaAmigos.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaAmigosInstance, field: 'descripcion', 'errors')}">
                                    <g:textArea name="descripcion" cols="40" rows="5" value="${listaAmigosInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="miembros"><g:message code="listaAmigos.miembros.label" default="Miembros" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: listaAmigosInstance, field: 'miembros', 'errors')}">
                                    
<ul>
<g:each in="${listaAmigosInstance?.miembros?}" var="m">
    <li><g:link controller="miembroListaAmigos" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="miembroListaAmigos" action="create" params="['listaAmigos.id': listaAmigosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'miembroListaAmigos.label', default: 'MiembroListaAmigos')])}</g:link>

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
