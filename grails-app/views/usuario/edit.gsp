

<%@ page import="pendcolab.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
            <g:hasErrors bean="${usuarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${usuarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${usuarioInstance?.id}" />
                <g:hiddenField name="version" value="${usuarioInstance?.version}" />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="categorias"><g:message code="usuario.categorias.label" default="Categorias" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'categorias', 'errors')}">
                                    
<ul>
<g:each in="${usuarioInstance?.categorias?}" var="c">
    <li><g:link controller="categoria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="categoria" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'categoria.label', default: 'Categoria')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="direcciones"><g:message code="usuario.direcciones.label" default="Direcciones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'direcciones', 'errors')}">
                                    
<ul>
<g:each in="${usuarioInstance?.direcciones?}" var="d">
    <li><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="direccion" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'direccion.label', default: 'Direccion')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="listasAmigos"><g:message code="usuario.listasAmigos.label" default="Listas Amigos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'listasAmigos', 'errors')}">
                                    
<ul>
<g:each in="${usuarioInstance?.listasAmigos?}" var="l">
    <li><g:link controller="listaAmigos" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="listaAmigos" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'listaAmigos.label', default: 'ListaAmigos')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pendientes"><g:message code="usuario.pendientes.label" default="Pendientes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'pendientes', 'errors')}">
                                    
<ul>
<g:each in="${usuarioInstance?.pendientes?}" var="p">
    <li><g:link controller="pendiente" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="pendiente" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pendiente.label', default: 'Pendiente')])}</g:link>

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
