<%@ page import="seivom.Studio" %>

<br style="clear:both">

<div class="fieldcontain ${hasErrors(bean: studioInstance, field: 'movies', 'error')} ">
	<label class="control-label" for="movies">
		<g:message code="studio.movies.label" default="Movies" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studioInstance?.movies?}" var="m">
    <li><g:link controller="movie" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="movie" action="create" params="['studio.id': studioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'movies.label', default: 'Movies')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: studioInstance, field: 'country', 'error')} ">
	<label class="control-label" for="country">
		<g:message code="studio.country.label" default="Country" />
		
	</label>
	<g:textField class="form-control" name="country" value="${studioInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studioInstance, field: 'name', 'error')} ">
	<label class="control-label" for="name">
		<g:message code="studio.name.label" default="Name" />
		
	</label>
	<g:textField class="form-control" name="name" value="${studioInstance?.name}"/>
</div>

