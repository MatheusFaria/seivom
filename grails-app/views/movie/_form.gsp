<%@ page import="seivom.Movie" %>

<br style="clear:both">

<div class="form-group fieldcontain ${hasErrors(bean: movieInstance, field: 'title', 'error')} ">
	<label class="control-label" for="title">
		<g:message code="movie.title.label" default="Title" />
		
	</label>
	<g:textField class="form-control" name="title" value="${movieInstance?.title}"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: movieInstance, field: 'genres', 'error')} ">
	<label class="control-label" for="genres">
		<g:message code="movie.genres.label" default="Genres" />
	</label>
	<select multiple name="genres" class="form-control" size="3">
		<g:each in="${seivom.Genre.list()}" var="genre">
            <option value="${genre.id}">${genre.name}</option>
        </g:each>
	</select>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: movieInstance, field: 'actors', 'error')} ">
	<label class="control-label" for="actors">
		<g:message code="movie.actors.label" default="Actors" />	
	</label>
	<select multiple name="actors" class="form-control" size="3">
		<g:each in="${seivom.Actor.list()}" var="actor">
            <option value="${actor.id}">${actor.name}</option>
        </g:each>
	</select>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: movieInstance, field: 'description', 'error')} ">
	<label class="control-label" for="description">
		<g:message code="movie.description.label" default="Description" />
		
	</label>
	<g:textField class="form-control" name="description" value="${movieInstance?.description}"/>
</div>


<div class="form-group fieldcontain ${hasErrors(bean: movieInstance, field: 'director', 'error')} required">
	<label for="director">
		<g:message code="movie.director.label" default="Director" />
		<span class="required-indicator">*</span>
	</label>

	<select id="director" name="director.id" class="form-control">
		<g:each in="${seivom.Director.list()}" var="director">
            <option value="${director.id}">${director.name}</option>
        </g:each>
	</select>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: movieInstance, field: 'duration', 'error')} required">
	<label class="control-label" for="duration">
		<g:message code="movie.duration.label" default="Duration" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duration" class="form-control" type="number" value="${movieInstance.duration}" required=""/>
</div>


<div class="form-group fieldcontain ${hasErrors(bean: movieInstance, field: 'studio', 'error')} required">
	<label class="control-label" for="studio">
		<g:message code="movie.studio.label" default="Studio" />
		<span class="required-indicator">*</span>
	</label>
		
	<select id="studio" name="studio.id" class="form-control">
		<g:each in="${seivom.Studio.list()}" var="studio">
            <option value="${studio.id}">${studio.name}</option>
        </g:each>
	</select>
</div>


<div class="form-group fieldcontain ${hasErrors(bean: movieInstance, field: 'year', 'error')} required">
	<label class="control-label" for="year">
		<g:message code="movie.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker class="form-control" name="year" precision="year"  value="${movieInstance?.year}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'poster', 'error')} required">
<label class="control-label" for="poster"><g:message code="movie.poster.label" default="Poster" />
		<span class="required-indicator">*</span></label>
<input class="form-control" type="file" name="poster" id="poster" />
</div>

