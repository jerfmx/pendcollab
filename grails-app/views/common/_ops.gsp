<div id="list">
	<g:if test="${session.usuario}">
		<h1>PlayList</h1>
		<sm:playlist>
			<pendcolab:ligas/>
	   </sm:playlist>
	</g:if>
</div>
