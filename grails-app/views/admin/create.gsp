

<%@ page import="pendcolab.Admin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'admin.label', default: 'Admin')}" />
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
            <g:hasErrors bean="${adminInstance}">
            <div class="errors">
                <g:renderErrors bean="${adminInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario"><g:message code="admin.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'usuario', 'errors')}">
                                    <g:textField name="usuario" value="${adminInstance?.usuario}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="admin.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" value="${adminInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="confirmaPassword"><g:message code="admin.confirmaPassword.label" default="Confirma Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'confirmaPassword', 'errors')}">
                                    <g:passwordField name="confirmaPassword" value="${adminInstance?.confirmaPassword}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="admin.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${adminInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="apellidos"><g:message code="admin.apellidos.label" default="Apellidos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'apellidos', 'errors')}">
                                    <g:textField name="apellidos" value="${adminInstance?.apellidos}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="correo"><g:message code="admin.correo.label" default="Correo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'correo', 'errors')}">
                                    <g:textField name="correo" value="${adminInstance?.correo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mostrarCorreo"><g:message code="admin.mostrarCorreo.label" default="Mostrar Correo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'mostrarCorreo', 'errors')}">
                                    <g:checkBox name="mostrarCorreo" value="${adminInstance?.mostrarCorreo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="activo"><g:message code="admin.activo.label" default="Activo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'activo', 'errors')}">
                                    <g:checkBox name="activo" value="${adminInstance?.activo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="admin.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'descripcion', 'errors')}">
                                    <g:textArea name="descripcion" cols="40" rows="5" value="${adminInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="departamento"><g:message code="admin.departamento.label" default="Departamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'departamento', 'errors')}">
                                    <g:textField name="departamento" value="${adminInstance?.departamento}" />
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
