$(document).ready(function() {
	$('#like_form').on('click', function(event) {
		var form = $(this);
		event.preventDefault();
		/* Act on the event */
		$.ajax({
			url: form.attr('action'),
			type: 'POST',
			dataType: 'json',
			data: form.serialize(),
		})
		.done(function(data) {
			console.log("success");
			likeBtn = form.find('#like');
			console.log(likeBtn);
			if(likeBtn.hasClass('btn-success')){
				likeBtn.removeClass('btn-success');
				likeBtn.addClass('btn-secondary');
				likeBtn.text('Disliked ' + data.likes_count);
			}
			else{
				likeBtn.removeClass('btn-secondary');
				likeBtn.addClass('btn-success');
				likeBtn.text('Liked ' + data.likes_count);
			}
		})
		.fail(function() {
			console.log("error");
		})
		.always(function() {
			console.log("complete");
		});
		
	});
});