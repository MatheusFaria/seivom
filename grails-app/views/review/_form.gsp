<%@ page import="seivom.Review" %>



<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'comment', 'error')} required">
	<label for="comment">
		<g:message code="review.comment.label" default="Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="comment" required="" value="${reviewInstance?.comment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'rate', 'error')} required">
	<label for="rate">
		<g:message code="review.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="rate" from="${0..5}" class="range" required="" value="${fieldValue(bean: reviewInstance, field: 'rate')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'movie', 'error')} required">
	<label for="movie">
		<g:message code="review.movie.label" default="Movie" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="movie" name="movie.id" from="${seivom.Movie.list()}" optionKey="id" required="" value="${reviewInstance?.movie?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="review.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${seivom.Person.list()}" optionKey="id" required="" value="${reviewInstance?.person?.id}" class="many-to-one"/>
</div>

