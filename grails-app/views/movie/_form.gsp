<%@ page import="seivom.Movie" %>

<br style="clear:both">

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'reviews', 'error')} ">
	<label class="control-label" for="reviews">
		<g:message code="movie.reviews.label" default="Reviews" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${movieInstance?.reviews?}" var="r">
    <li><g:link controller="review" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="review" action="create" params="['movie.id': movieInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'review.label', default: 'Review')])}</g:link>
</li>
</ul>

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

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'genre', 'error')} ">
	<label class="control-label" for="genre">
		<g:message code="movie.genre.label" default="Genre" />
		
	</label>
	<g:textField name="genre" class="form-control" value="${movieInstance?.genre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'studio', 'error')} required">
	<label class="control-label" for="studio">
		<g:message code="movie.studio.label" default="Studio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select class="form-control" id="studio" name="studio.id" from="${seivom.Studio.list()}" optionKey="id" required="" value="${movieInstance?.studio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'title', 'error')} ">
	<label class="control-label" for="title">
		<g:message code="movie.title.label" default="Title" />
		
	</label>
	<g:textField class="form-control" name="title" value="${movieInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'year', 'error')} required">
	<label class="control-label" for="year">
		<g:message code="movie.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker class="form-control" name="year" precision="year"  value="${movieInstance?.year}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'year', 'error')} required">
<label class="control-label" for="poster"><g:message code="movie.poster.label" default="Poster" />
		<span class="required-indicator">*</span></label>
<input class="form-control" type="file" name="poster" id="poster" />
</div>

