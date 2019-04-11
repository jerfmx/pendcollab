
<%@ page import="pendcolab.Categoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'categoria.id.label', default: 'Id')}" />
                        
                          <!--  <th><g:message code="categoria.usuario.label" default="Usuario" /></th> -->
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'categoria.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'categoria.descripcion.label', default: 'Descripcion')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${categoriaInstanceList}" status="i" var="categoriaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${categoriaInstance.id}">${fieldValue(bean: categoriaInstance, field: "id")}</g:link></td>
                        
                          <!--  <td>${fieldValue(bean: categoriaInstance, field: "usuario")}</td> -->
                        
                            <td>${fieldValue(bean: categoriaInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: categoriaInstance, field: "descripcion")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${categoriaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
