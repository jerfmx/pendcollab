<g:if test="${session.usuario}">
	<div id="buddyListMember${list.id}">
		<h1>
			<pendcolab:editInPlace id="listaAmigosNombre${list.id}" url="[controller:'listaAmigos',action:'editarNombre',id:list.id]" rows="1" cols="10" paramNombre="nombre">
				${list.nombre}
			</pendcolab:editInPlace>
		<g:link controller="listaAmigos" action="delete" id="${list.id}">
			<img border="0" src="${resource(dir:'images',file:'delete_obj.gif')}" alt="[-]"/>
		</g:link>
		<pendcolab:showHide update="AddListaAmigos${list.id}">
			<img border="0" src="${resource(dir:'images',file:'add_obj.gif')}" alt="[*]"/>
		</pendcolab:showHide>
		</h1>

		<div id="AddListaAmigos${list.id}" style="display:none">
			<g:formRemote name="buddyListForm${list.id}" url="[controller:'miembroListaAmigos',action:'agrega']" update="buddyListMembers${list.id}" onComplete="showhide('AddListaAmigos${list.id}')">
				<input type="hidden" name="listaAmigosId" value="${list.id}"/>
				<input type="hidden" name="usuarioId" value=""/>
				<input type="text" id="autocomplete${list.id}" name="userId" onclick="this.submit()"/>
				<span id="indicator1" style="display: none"><img src="${resource(dir:'images',file:'spinner.gif')}" alt="Working..." /></span>
				<div id="autocomplete_choices${list.id}" class="autocomplete"></div>

				<script type="text/javascript">
					new Ajax.Autocompleter("autocomplete${list.id}", "autocomplete_choices${list.id}", "${createLink(controller:'usuario',action:'buscaUsuarios')}", {afterUpdateElement : getSelectionId${list.id}});

					function getSelectionId${list.id}(text, li) {
						document.buddyListForm${list.id}.usuarioId.value = li.id;
						}
				</script>
			</g:formRemote>
		</div>

		<div id="buddyListMembers${list.id}">
			<ul>
				<g:render template="/common/buddyListMember" var="buddy" collection="${pendcolab.MiembroListaAmigos.findAllByLista(list)}" />
			<ul>
		</div>
		<br style="line-height: 40%" />
	</div>
</g:if>
