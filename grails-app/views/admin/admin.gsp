<!DOCTYPE html>
<html>
    <head>
        <title>Admin</title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
        <g:javascript library="application" />
		<g:javascript library="scriptaculous" />
		<g:javascript library="dojo" />
		<dojo:header theme="soria"/>
		<dojo:require modules="['dijit.layout.TabContainer','dijit.layout.ContentPane', 'dijit.Editor']"/>
    </head>
    <body class="soria">
    	<div id="page">
			<div id="spinner" class="spinner" style="display:none;">
				<img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
			</div>
			<div id="topbar">
				<g:render template="/common/topbar" />
			</div>
			<div id="header">
				<h1>Pendientes Colaborativos</h1>
			</div>
			<div id="content">
				<div class="nav">
					<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
					<span class="menuButton"><a class="list" href="${createLink(uri:'/pendiente/list')}">Pendientes</a></span>
				</div>
				<iframe src="${createLink(controller:'adminManage',action:'index')}" width="100%" height="600" border="0" frameborder="0">
				</iframe>
			</div>
			<div id="sidebar">
				<g:render template="/common/buddies" />
				<iframe src="${createLink(controller:'buildInfo')}" width="100%" height="600" border="0" frameborder="0">
				</iframe>
			</div>
			<div id="footer">
				<g:render template="/common/footer" />
			</div>
		</div>
    </body>
</html>
