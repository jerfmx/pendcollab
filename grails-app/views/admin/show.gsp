
<%@ page import="pendcolab.Admin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'admin.label', default: 'Admin')}" />
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
                            <td valign="top" class="name"><g:message code="admin.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: adminInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.usuario.label" default="Usuario" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: adminInstance, field: "usuario")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.password.label" default="Password" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: adminInstance, field: "password")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.confirmaPassword.label" default="Confirma Password" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: adminInstance, field: "confirmaPassword")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: adminInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.apellidos.label" default="Apellidos" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: adminInstance, field: "apellidos")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.correo.label" default="Correo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: adminInstance, field: "correo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.mostrarCorreo.label" default="Mostrar Correo" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${adminInstance?.mostrarCorreo}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.activo.label" default="Activo" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${adminInstance?.activo}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.descripcion.label" default="Descripcion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: adminInstance, field: "descripcion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.categorias.label" default="Categorias" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${adminInstance.categorias}" var="c">
                                    <li><g:link controller="categoria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.departamento.label" default="Departamento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: adminInstance, field: "departamento")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.direcciones.label" default="Direcciones" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${adminInstance.direcciones}" var="d">
                                    <li><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.listasAmigos.label" default="Listas Amigos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${adminInstance.listasAmigos}" var="l">
                                    <li><g:link controller="listaAmigos" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.pendientes.label" default="Pendientes" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${adminInstance.pendientes}" var="p">
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
                    <g:hiddenField name="id" value="${adminInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
