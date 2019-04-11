

<%@ page import="pendcolab.Admin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'admin.label', default: 'Admin')}" />
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
            <g:hasErrors bean="${adminInstance}">
            <div class="errors">
                <g:renderErrors bean="${adminInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${adminInstance?.id}" />
                <g:hiddenField name="version" value="${adminInstance?.version}" />
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
                                  <label for="categorias"><g:message code="admin.categorias.label" default="Categorias" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'categorias', 'errors')}">
                                    
<ul>
<g:each in="${adminInstance?.categorias?}" var="c">
    <li><g:link controller="categoria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="categoria" action="create" params="['admin.id': adminInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'categoria.label', default: 'Categoria')])}</g:link>

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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="direcciones"><g:message code="admin.direcciones.label" default="Direcciones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'direcciones', 'errors')}">
                                    
<ul>
<g:each in="${adminInstance?.direcciones?}" var="d">
    <li><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="direccion" action="create" params="['admin.id': adminInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'direccion.label', default: 'Direccion')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="listasAmigos"><g:message code="admin.listasAmigos.label" default="Listas Amigos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'listasAmigos', 'errors')}">
                                    
<ul>
<g:each in="${adminInstance?.listasAmigos?}" var="l">
    <li><g:link controller="listaAmigos" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="listaAmigos" action="create" params="['admin.id': adminInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'listaAmigos.label', default: 'ListaAmigos')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pendientes"><g:message code="admin.pendientes.label" default="Pendientes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'pendientes', 'errors')}">
                                    
<ul>
<g:each in="${adminInstance?.pendientes?}" var="p">
    <li><g:link controller="pendiente" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="pendiente" action="create" params="['admin.id': adminInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pendiente.label', default: 'Pendiente')])}</g:link>

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
