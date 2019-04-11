

<%@ page import="pendcolab.Direccion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'direccion.label', default: 'Direccion')}" />
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
            <g:hasErrors bean="${direccionInstance}">
            <div class="errors">
                <g:renderErrors bean="${direccionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${direccionInstance?.id}" />
                <g:hiddenField name="version" value="${direccionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                          <!--  <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuario"><g:message code="direccion.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${pendcolab.Usuario.list()}" optionKey="id" value="${direccionInstance?.usuario?.id}"  />
                                </td>
                            </tr> -->
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="calle"><g:message code="direccion.calle.label" default="Calle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'calle', 'errors')}">
                                    <g:textField name="calle" value="${direccionInstance?.calle}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ciudad"><g:message code="direccion.ciudad.label" default="Ciudad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'ciudad', 'errors')}">
                                    <g:textField name="ciudad" value="${direccionInstance?.ciudad}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estado"><g:message code="direccion.estado.label" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'estado', 'errors')}">
                                    <g:textField name="estado" value="${direccionInstance?.estado}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pais"><g:message code="direccion.pais.label" default="Pais" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'pais', 'errors')}">
                                    <g:countrySelect name="pais" noSelection="['':'Elige...']" value="${direccionInstance?.pais}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cp"><g:message code="direccion.cp.label" default="Cp" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'cp', 'errors')}">
                                    <g:textField name="cp" value="${fieldValue(bean: direccionInstance, field: 'cp')}" />
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
