<%@ page import="seivom.Director" %>

<br style="clear:both">

<div class="form-group fieldcontain ${hasErrors(bean: directorInstance, field: 'movies', 'error')} ">
	<label class="control-label" for="movies">
		<g:message code="director.movies.label" default="Movies" />
	</label>

	<select multiple name="movies" class="form-control" size="3">
		<g:each in="${seivom.Movie.list()}" var="movie">
		    <option value="${movie.id}">${movie.title}</option>
		</g:each>
	</select>

</div>

<div class="fieldcontain ${hasErrors(bean: directorInstance, field: 'name', 'error')} ">
	<label class="control-label" for="name">
		<g:message code="director.name.label" default="Name" />
	</label>
	<g:textField class="form-control"  name="name" value="${directorInstance?.name}"/>
</div>


