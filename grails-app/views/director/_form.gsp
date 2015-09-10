<%@ page import="seivom.Director" %>

<br style="clear:both">

<div class="fieldcontain ${hasErrors(bean: directorInstance, field: 'movies', 'error')} ">
	<label class="control-label" for="movies">
		<g:message code="director.movies.label" default="Movies" />
	</label>
	
<ul class="one-to-many">
<g:each in="${directorInstance?.movies?}" var="m">
    <li><g:link controller="movie" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="movie" action="create" params="['director.id': directorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'movies.label', default: 'Movies')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: directorInstance, field: 'name', 'error')} ">
	<label class="control-label" for="name">
		<g:message code="director.name.label" default="Name" />
	</label>
	<g:textField class="form-control"  name="name" value="${directorInstance?.name}"/>
</div>


