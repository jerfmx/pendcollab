<g:if test="${session.usuario}">
	<pendcolab:preLoadShowHide />
	<div id="buddies">
		<div class="title">
			<b>Amigos</b><pendcolab:showHide update="AddListaAmigos">
				<img border="0" alt="[+]" src="${resource(dir:'images',file:'add_obj.gif')}"/>
			</pendcolab:showHide>
		</div>
		<div id="AddListaAmigos" style="display:none">
			<g:formRemote name="listaAmigosForm" url="[controller:'listaAmigos',action:'agregar']" update="buddyList" onComplete="showhide('AddListaAmigos')">
				<input type="text" name="listaAmigosNombre" onclick="this.submit();" />
			</g:formRemote>
		</div>
		<div id="buddyList">
			<g:render template="/common/buddyList" var="list" collection="${pendcolab.ListaAmigos.findAllByUsuario(session?.usuario)}" />
		</div>
	</div>
</g:if>
