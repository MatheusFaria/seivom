<%@ page import="seivom.Review" %>

<g:javascript>
	$('.rating-bar .glyphicon').on("mouseover", function(){
		$(this).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
	    $(this).nextAll().removeClass('glyphicon-star').addClass('glyphicon-star-empty');
		$(this).prevAll().removeClass('glyphicon-star-empty').addClass('glyphicon-star');
	});

	$('.rating-bar .glyphicon').on("mouseleave", function(){
		var selectedStar = $(this).parent().find('.selected');

		selectedStar.removeClass('glyphicon-star-empty').addClass('glyphicon-star');
	    selectedStar.nextAll().removeClass('glyphicon-star').addClass('glyphicon-star-empty');
		selectedStar.prevAll().removeClass('glyphicon-star-empty').addClass('glyphicon-star');
	});

	$('.rating-bar .glyphicon').click(function(){
        $('.rating-bar .selected').removeClass('selected');
        $(this).addClass('selected');
        $("#rate-field").val($(this).attr("value"));
	});
</g:javascript>


	<fieldset class="form">
		<div class="rating-bar pull-right"> 
  			<span class="glyphicon glyphicon-star" value="1"></span>
  			<span class="glyphicon glyphicon-star" value="2"></span>
  			<span class="glyphicon glyphicon-star selected" value="3"></span>
  			<span class="glyphicon glyphicon-star-empty" value="4"></span>
  			<span class="glyphicon glyphicon-star-empty" value="5"></span>
  			<input type="hidden" id="rate-field" name="rate" value="${fieldValue(bean: reviewInstance, field: 'rate')}">
		</div>

		<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'comment', 'error')} required">
			<label for="comment">
				<g:message code="review.form.title" default="Leave your review below" />
				<span class="required-indicator">*</span>
			</label>
			<g:textArea name="comment" class="form-control" value="${reviewInstance?.comment}" required="" placeholder="${message(code: "my.localized.content", default: "Type your review here...")}" rows="3"/>
		</div>

		<g:hiddenField id="movie" name="movie.id" value="${reviewInstance?.movie?.id}" />
		<g:hiddenField id="person" name="person.id" value="${reviewInstance?.person?.id}" />

