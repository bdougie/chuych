// Tooltips for Social Links
$('.tooltip-social').tooltip({
  selector: "a[data-toggle=tooltip]"
})

// Flexslider
$(document).ready(function($) {
	$('#main-slider').flexslider({
		animation: "fade",
		slideshowSpeed: 3500,
		controlNav: false,
		directionNav: false
	});
});

// Owl Carousel
$(document).ready(function($) {
      $("#owl-example").owlCarousel();
});

// Mailchimp Newsletter
$(document).ready(function() {
	$('#invite').ketchup().submit(function() {
	if ($(this).ketchup('isValid')) {
	var action = $(this).attr('action');
	$.ajax({
	url: action,
	type: 'POST',
	data: {
	email: $('#address').val()
	},
	success: function(data){
	$('#result').html(data).css('color', 'white');
	},
	error: function() {
	$('#result').html('Sorry, an error occurred.').css('color', 'white');
	}
	});
	}
	return false;
	});
});
