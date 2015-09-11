<%@ page import="seivom.Studio" %>

<br style="clear:both">

<div class="form-group fieldcontain ${hasErrors(bean: studioInstance, field: 'movies', 'error')} ">
	<label class="control-label" for="movies">
		<g:message code="studio.movies.label" default="Movies" />
		
	</label>
	
	<select multiple name="movies" class="form-control" size="3">
		<g:each in="${seivom.Movie.list()}" var="movie">
		    <option value="${movie.id}">${movie.title}</option>
		</g:each>
	</select>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: studioInstance, field: 'country', 'error')} ">
	<label class="control-label" for="country">
		<g:message code="studio.country.label" default="Country" />
		
	</label>
	<g:textField class="form-control" name="country" value="${studioInstance?.country}"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: studioInstance, field: 'name', 'error')} ">
	<label class="control-label" for="name">
		<g:message code="studio.name.label" default="Name" />
		
	</label>
	<g:textField class="form-control" name="name" value="${studioInstance?.name}"/>
</div>

