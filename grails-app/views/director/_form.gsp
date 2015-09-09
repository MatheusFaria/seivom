<%@ page import="seivom.Director" %>



<div class="fieldcontain ${hasErrors(bean: directorInstance, field: 'movie', 'error')} ">
	<label for="movie">
		<g:message code="director.movie.label" default="Movie" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${directorInstance?.movie?}" var="m">
    <li><g:link controller="movie" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="movie" action="create" params="['director.id': directorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'movie.label', default: 'Movie')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: directorInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="director.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${directorInstance?.name}"/>
</div>

