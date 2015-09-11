<div class="well">
<div class="container" style="width: 100%">
        <div class="row">
          <div class="col-md-3">
            <img src="${createLink(controller:'movie', action:'get_poster', id:movie.ident())}"  class="img-responsive">
          </div>
          <div class="col-md-9">
                <g:link controller='movie' action='show' id='movie.id'>
                        <strong>${movie.title}</strong>
                </g:link>

                <div class="user-rating"> 
                  <g:each in="${(1..5).toList()}" var="i">
                    <g:if test="${ i <= (movie.reviews.rate.sum() / movie.reviews.size()) }">
                      <span class="glyphicon glyphicon-star"></span>
                    </g:if>
                    <g:else>
                      <span class="glyphicon glyphicon-star-empty"></span>
                    </g:else>
                </g:each>
              </div>

                <br>
                <p>${movie.description}</p>
          </div>
        </div>
      </div>
    </div>
