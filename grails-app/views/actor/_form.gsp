<%@ page import="seivom.Actor" %>

<br style="clear:both">

<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'movies', 'error')} ">
	<label class="control-label" for="movies">
		<g:message code="actor.movies.label" default="Movies" />
	</label>
	
<ul class="one-to-many">
<g:each in="${actorInstance?.movies?}" var="m">
    <li><g:link controller="movie" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="movie" action="create" params="['actor.id': actorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'movies.label', default: 'Movies')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'name', 'error')} ">
	<label class="control-label" for="name">
		<g:message code="actor.name.label" default="Name" />
	</label>
	<g:textField class="form-control"  name="name" value="${actorInstance?.name}"/>
</div>


