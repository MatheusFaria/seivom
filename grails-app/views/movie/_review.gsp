<div class="panel panel-default">
  <div class="panel-heading">
  	<strong>${review.person.realname}</strong> said:

  	<div class="user-rating pull-right"> 

  		<g:each in="${(1..5).toList()}" var="i">
  			<g:if test="${ i <= review.rate }">
  				<span class="glyphicon glyphicon-star"></span>
  			</g:if>
  			<g:else>
  				<span class="glyphicon glyphicon-star-empty"></span>
  			</g:else>
		</g:each>

		</div>

  </div>
  <div class="panel-body">
        ${review.comment}
  </div>
</div>
