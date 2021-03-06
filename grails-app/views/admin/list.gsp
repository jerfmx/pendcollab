
<%@ page import="pendcolab.Admin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'admin.label', default: 'Admin')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'admin.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="usuario" title="${message(code: 'admin.usuario.label', default: 'Usuario')}" />
                        
                            <g:sortableColumn property="password" title="${message(code: 'admin.password.label', default: 'Password')}" />
                        
                            <g:sortableColumn property="confirmaPassword" title="${message(code: 'admin.confirmaPassword.label', default: 'Confirma Password')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'admin.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="apellidos" title="${message(code: 'admin.apellidos.label', default: 'Apellidos')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${adminInstanceList}" status="i" var="adminInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${adminInstance.id}">${fieldValue(bean: adminInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: adminInstance, field: "usuario")}</td>
                        
                            <td>${fieldValue(bean: adminInstance, field: "password")}</td>
                        
                            <td>${fieldValue(bean: adminInstance, field: "confirmaPassword")}</td>
                        
                            <td>${fieldValue(bean: adminInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: adminInstance, field: "apellidos")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${adminInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
