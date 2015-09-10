<%@ page import="seivom.Movie" %>

<br style="clear:both">

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'title', 'error')} ">
	<label class="control-label" for="title">
		<g:message code="movie.title.label" default="Title" />
		
	</label>
	<g:textField class="form-control" name="title" value="${movieInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'genres', 'error')} ">
	<label class="control-label" for="genres">
		<g:message code="movie.genres.label" default="Genres" />
		
	</label>
	<g:select class="form-control" name="genres" from="${seivom.Genre.list()}" multiple="multiple" optionKey="id" size="1" value="${movieInstance?.genres*.id}" class="one-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'actors', 'error')} ">
	<label class="control-label" for="actors">
		<g:message code="movie.actors.label" default="Actors" />
		
	</label>
	<g:select class="form-control" name="actors" from="${seivom.Actor.list()}" multiple="multiple" optionKey="id" size="1" value="${movieInstance?.actors*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'decription', 'error')} ">
	<label class="control-label" for="decription">
		<g:message code="movie.decription.label" default="Decription" />
		
	</label>
	<g:textField class="form-control" name="decription" value="${movieInstance?.decription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'director', 'error')} required">
	<label for="director">
		<g:message code="movie.director.label" default="Director" />
		<span class="required-indicator">*</span>
	</label>
	<g:select class="form-control" id="director" name="director.id" from="${seivom.Director.list()}" optionKey="id" required="" value="${movieInstance?.director?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'duration', 'error')} required">
	<label class="control-label" for="duration">
		<g:message code="movie.duration.label" default="Duration" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duration" class="form-control" type="number" value="${movieInstance.duration}" required=""/>
</div>


<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'studio', 'error')} required">
	<label class="control-label" for="studio">
		<g:message code="movie.studio.label" default="Studio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select class="form-control" id="studio" name="studio.id" from="${seivom.Studio.list()}" optionKey="id" required="" value="${movieInstance?.studio?.id}" class="many-to-one"/>
</div>


<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'year', 'error')} required">
	<label class="control-label" for="year">
		<g:message code="movie.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="year" precision="year"  value="${movieInstance?.year}"  />
</div>

