

<%@ page import="pendcolab.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usuarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${usuarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario"><g:message code="usuario.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'usuario', 'errors')}">
                                    <g:textField name="usuario" value="${usuarioInstance?.usuario}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="usuario.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" value="${usuarioInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="confirmaPassword"><g:message code="usuario.confirmaPassword.label" default="Confirma Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'confirmaPassword', 'errors')}">
                                    <g:passwordField name="confirmaPassword" value="${usuarioInstance?.confirmaPassword}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="usuario.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${usuarioInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="apellidos"><g:message code="usuario.apellidos.label" default="Apellidos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'apellidos', 'errors')}">
                                    <g:textField name="apellidos" value="${usuarioInstance?.apellidos}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="correo"><g:message code="usuario.correo.label" default="Correo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'correo', 'errors')}">
                                    <g:textField name="correo" value="${usuarioInstance?.correo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mostrarCorreo"><g:message code="usuario.mostrarCorreo.label" default="Mostrar Correo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'mostrarCorreo', 'errors')}">
                                    <g:checkBox name="mostrarCorreo" value="${usuarioInstance?.mostrarCorreo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="activo"><g:message code="usuario.activo.label" default="Activo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'activo', 'errors')}">
                                    <g:checkBox name="activo" value="${usuarioInstance?.activo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="usuario.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'descripcion', 'errors')}">
                                    <g:textArea name="descripcion" cols="40" rows="5" value="${usuarioInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
