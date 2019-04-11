<g:if test="${session.usuario}">
	<div id="tagCloud">
		<g:if test="${session.usuario}">
			<h2>Tag Cloud:</h2>
			<pendcolab:tagCloud />
		</g:if>
	</div>
	<div id="twitter">
		<h2>My timeline</h2>
		<div id="timelineWrapper">
			<div id="timeline">
				<twitterChecker:timeline max="10"/>
			</div>
		</div>

		<h2>Mentions</h2>
		<div id="mentionsWrapper">
			<div id="mentions">
				<twitterChecker:mentions/>
			</div>
		</div>

		<h2>Retweets</h2>
		<div id="rtsWrapper">
			<div id="rts">
				<twitterChecker:rts/>
			</div>
		</div>
	</div>
</g:if>
