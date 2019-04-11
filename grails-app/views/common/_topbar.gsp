<div id="menu">
	<nobr>
		<g:isLoggedIn>
			<g:link controller="rss" action="feed">
				<img border="0" align="middle" src="${resource(dir:'images',file:'feed.png')}" alt="[RSS]" width="15" height="15"/>
			</g:link> | 
			<g:link controller="usuario" action="show" id="${session.usuario.id}">
				<b><g:loggedInUserInfo field="nombre"/>
					  <g:loggedInUserInfo field="apellidos"/></b>
			</g:link>
			| <g:link controller="searchable" action="index">
				<g:message code="topbar.search" />
			</g:link> | 
			<g:link controller="logout" action="index">
				<g:message code="topbar.logout" />
			</g:link>
		</g:isLoggedIn>
		<g:isNotLoggedIn>
			<g:link controller="rss" action="feed">
				<img border="0" align="middle" src="${resource(dir:'images',file:'feed.png')}" alt="[RSS]" width="15" height="15"/>
			</g:link> | 
			<g:link controller="usuario" action="registro">
				<b>Registrar</b>
			</g:link> | 
			<g:link controller="login" action="index">
				<g:message code="topbar.login" />
			</g:link>
		</g:isNotLoggedIn>
	</nobr>
</div>
