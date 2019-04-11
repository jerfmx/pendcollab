
<%@ page import="pendcolab.Pendiente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pendiente.label', default: 'Pendiente')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
        	<pendcolab:preLoadShowHide />
            <h1><g:message code="default.list.label" args="[entityName]" />
            <pendcolab:showHide update="addPendiente">
            	<img border="0" src="${resource(dir:'images',file:'add_obj.gif')}" alt="[ADD]"/>
            </pendcolab:showHide></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'pendiente.id.label', default: 'Id')}" />
                        
                          <!--  <th><g:message code="pendiente.usuario.label" default="Usuario" /></th> -->
                        
                            <th><g:message code="pendiente.categoria.label" default="Categoria" /></th>
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'pendiente.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="estatus" title="${message(code: 'pendiente.estatus.label', default: 'Estatus')}" />
                        
                            <g:sortableColumn property="prioridad" title="${message(code: 'pendiente.prioridad.label', default: 'Prioridad')}" />
                            
                            <g:sortableColumn property="nota" title="${message(code: 'pendiente.prioridad.label', default: 'Nota')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pendienteInstanceList}" status="i" var="pendienteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pendienteInstance.id}">${fieldValue(bean: pendienteInstance, field: "id")}</g:link></td>
                        
                           <!-- <td>${fieldValue(bean: pendienteInstance, field: "usuario")}</td> -->
                        
                            <td>${fieldValue(bean: pendienteInstance, field: "categoria")}</td>
                        
                            <td>${fieldValue(bean: pendienteInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: pendienteInstance, field: "estatus")}</td>
                        
                            <td>${fieldValue(bean: pendienteInstance, field: "prioridad")}</td>
                        	
                        	<td>${fieldValue(bean: pendienteInstance, field: "nota")}</td>
                        	
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pendienteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
