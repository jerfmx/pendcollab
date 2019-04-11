<%@ page import="pendcolab.Usuario" %>
<html>
	<head>
		<title>Ingresar a Pendientes Colaborativos</title>
		<meta name="layout" content="main" />
		<feed:meta kind="atom" version="1.0" controller="rss" action="feed"/>
	</head>
	<body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
		<div class="body">
			<g:if test="${flash.message}">
				<div class="message">
					${flash.message}
				</div>
			</g:if>
			<p>
				Bienvenido a tus Pendientes Colaborativos.  Ingresar como:
			</p>
			<g:form action="entrada" controller="usuario">
				<div class="dialog">
					<table>
						<tbody>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="usuario"><g:message code="usuario.usuario.label" default="Usuario" /></label>
								</td>
								<td valign="top" class="valueClear">
									<input name="usuario" value="" type="text"/>
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="usuario"><g:message code="usuario.password.label" default="Password" /></label>
								</td>
								<td valign="top" class="valueClear">
									<input name="password" value="" type="password"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="buttons">
					<span class="button">
						<g:actionSubmit class="save" action="ingresar" value="Ingresar"/>
					</span>
				</div>
			</g:form>
		</div>
	</body>
</html>
