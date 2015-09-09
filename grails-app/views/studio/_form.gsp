<%@ page import="seivom.Studio" %>



<div class="fieldcontain ${hasErrors(bean: studioInstance, field: 'movie', 'error')} ">
	<label for="movie">
		<g:message code="studio.movie.label" default="Movie" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studioInstance?.movie?}" var="m">
    <li><g:link controller="movie" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="movie" action="create" params="['studio.id': studioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'movie.label', default: 'Movie')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: studioInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="studio.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${studioInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studioInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="studio.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${studioInstance?.name}"/>
</div>

