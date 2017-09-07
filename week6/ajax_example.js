$('#button').on('click', function(event) {
	event.preventDefault();
	/* Act on the event */
	$.ajax({
		url: 'http://api.icndb.com/jokes/random',
		type: 'GET',
	})
	.done(function(data) {
		console.log("success");
		var joke = data['value']['joke']
		$(#list).append("<li>"+ joke + "</li>")
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
	
});

// if @url.save
// {success: true}.to_json

// in js, 
// response = JSON.paser(response)
// if response.sucess === true
// else $('#error').text('Invalid URL!')