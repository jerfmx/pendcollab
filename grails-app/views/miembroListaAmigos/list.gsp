
<%@ page import="pendcolab.MiembroListaAmigos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'miembroListaAmigos.label', default: 'MiembroListaAmigos')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'miembroListaAmigos.id.label', default: 'Id')}" />
                        
                            <th><g:message code="miembroListaAmigos.lista.label" default="Lista" /></th>
                        
                            <g:sortableColumn property="apodo" title="${message(code: 'miembroListaAmigos.apodo.label', default: 'Apodo')}" />
                        
                            <th><g:message code="miembroListaAmigos.usuario.label" default="Usuario" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${miembroListaAmigosInstanceList}" status="i" var="miembroListaAmigosInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${miembroListaAmigosInstance.id}">${fieldValue(bean: miembroListaAmigosInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: miembroListaAmigosInstance, field: "lista")}</td>
                        
                            <td>${fieldValue(bean: miembroListaAmigosInstance, field: "apodo")}</td>
                        
                            <td>${fieldValue(bean: miembroListaAmigosInstance, field: "usuario")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${miembroListaAmigosInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
