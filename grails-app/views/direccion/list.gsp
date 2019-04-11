
<%@ page import="pendcolab.Direccion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'direccion.label', default: 'Direccion')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'direccion.id.label', default: 'Id')}" />
                        
                       <!--     <th><g:message code="direccion.usuario.label" default="Usuario" /></th> -->
                        
                            <g:sortableColumn property="calle" title="${message(code: 'direccion.calle.label', default: 'Calle')}" />
                        
                            <g:sortableColumn property="ciudad" title="${message(code: 'direccion.ciudad.label', default: 'Ciudad')}" />
                        
                            <g:sortableColumn property="estado" title="${message(code: 'direccion.estado.label', default: 'Estado')}" />
                        
                            <g:sortableColumn property="pais" title="${message(code: 'direccion.pais.label', default: 'Pais')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${direccionInstanceList}" status="i" var="direccionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${direccionInstance.id}">${fieldValue(bean: direccionInstance, field: "id")}</g:link></td>
                        
                           <!-- <td>${fieldValue(bean: direccionInstance, field: "usuario")}</td> -->
                        
                            <td>${fieldValue(bean: direccionInstance, field: "calle")}</td>
                        
                            <td>${fieldValue(bean: direccionInstance, field: "ciudad")}</td>
                        
                            <td>${fieldValue(bean: direccionInstance, field: "estado")}</td>
                        
                            <td>${fieldValue(bean: direccionInstance, field: "pais")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${direccionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
