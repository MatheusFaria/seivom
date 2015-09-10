<div class="well">
	<div class="container" style="width: 100%">
        <div class="row">
        	<div class="col-md-3">
        		<img src="${createLink(controller:'movie', action:'get_poster', id:movie.ident())}"  class="img-responsive">
        	</div>
            <div class="col-md-9">
                <h2>${movie.title}</h2>
                <small>${movie.year.getAt(Calendar.YEAR)}, ${movie.duration} <g:message code="default.time.minutes" default="minutes" /></small>
                <p>${movie.description}</p>
                <!--<ul class="list-inline list-unstyled">
                        <li>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        </li>-->
                </ul>
          	</div>
        </div>
  	</div>
</div>
