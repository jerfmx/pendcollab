
<%@ page import="pendcolab.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
                            <td valign="top" class="name"><g:message code="usuario.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.usuario.label" default="Usuario" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "usuario")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.password.label" default="Password" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "password")}</td>
                            
                        </tr>
                    
                     <!--   <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.confirmaPassword.label" default="Confirma Password" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "confirmaPassword")}</td>
                            
                        </tr> -->
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.apellidos.label" default="Apellidos" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "apellidos")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.correo.label" default="Correo" /></td>
                            
                            <g:if test="${usuarioInstance.mostrarCorreo}">
                            	<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "correo")}</td>
                            </g:if>
                            <g:else>
                            	<td valign="top" class="value">correo oculto</td>
                            </g:else>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.mostrarCorreo.label" default="Mostrar Correo" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${usuarioInstance?.mostrarCorreo}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.activo.label" default="Activo" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${usuarioInstance?.activo}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.descripcion.label" default="Descripcion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "descripcion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.categorias.label" default="Categorias" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${usuarioInstance.categorias}" var="c">
                                    <li><g:link controller="categoria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.direcciones.label" default="Direcciones" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${usuarioInstance.direcciones}" var="d">
                                    <li><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.listasAmigos.label" default="Listas Amigos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${usuarioInstance.listasAmigos}" var="l">
                                    <li><g:link controller="listaAmigos" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.pendientes.label" default="Pendientes" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${usuarioInstance.pendientes}" var="p">
                                    <li><g:link controller="pendiente" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${usuarioInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
