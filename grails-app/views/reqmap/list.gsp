
<%@ page import="pendcolab.Reqmap" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:set var="entityName" value="${message(code: 'reqmap.label', default: 'Reqmap')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'reqmap.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="url" title="${message(code: 'reqmap.url.label', default: 'Url')}" />
                        
                            <g:sortableColumn property="configAttribute" title="${message(code: 'reqmap.configAttribute.label', default: 'Config Attribute')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reqmapInstanceList}" status="i" var="reqmapInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reqmapInstance.id}">${fieldValue(bean: reqmapInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: reqmapInstance, field: "url")}</td>
                        
                            <td>${fieldValue(bean: reqmapInstance, field: "configAttribute")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reqmapInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
