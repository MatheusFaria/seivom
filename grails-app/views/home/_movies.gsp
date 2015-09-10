<div class="well">
<div class="container" style="width: 100%">
        <div class="row">
          <div class="col-md-3">
            <img src="${createLink(controller:'movie', action:'get_poster', id:movie.ident())}"  class="img-responsive">
          </div>
          <div class="col-md-9">
                <a href="${createLink(controller:'movie', action:'show', id:movie.id)}"/>
                        <strong>${movie.title}</strong>
                </a>
                <p>${movie.description}</p>
                        <ul class="list-inline list-unstyled">
                                <li>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                                </li>
                        </ul>
          </div>
        </div>
      </div>
    </div>
