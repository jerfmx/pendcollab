
<%@ page import="pendcolab.Clave" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'clave.label', default: 'Clave')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'clave.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'clave.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'clave.descripcion.label', default: 'Descripcion')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${claveInstanceList}" status="i" var="claveInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${claveInstance.id}">${fieldValue(bean: claveInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: claveInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: claveInstance, field: "descripcion")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${claveInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
