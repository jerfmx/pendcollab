<g:if test="${session.usuario}">
	<li class="buddy" id="buddy${buddy.id}">
		<a href="${createLink(controller:'usuario',action:'show',id:buddy.usuario.id)}">
			<pendcolab:editInPlace id="MiembroListaAmigosNombre${buddy.id}" url="[controller:'miembroListaAmigos',action:'editarApodo',id:buddy.id]" rows="1" cols="10" paramNombre="apodo">
				${buddy.apodo}</pendcolab:editInPlace> (${buddy.usuario})
			<g:link controller="miembroListaAmigos" action="delete" id="${buddy.id}">
				<img border="0" src="${resource(dir:'images',file:'delete_obj.gif')}" alt="[-]"/>
			</g:link>
		</a>
	</li>
	<br/>
</g:if>
