// Introducing jQuery
$(document).ready(function() {
   $('div').mouseenter(function() {
       $(this).animate({
           height: '+=10px'
       });
   });
   $('div').mouseleave(function() {
       $(this).animate({
           height: '-=10px'
       }); 
   });
   $('div').click(function() {
       $(this).toggle(1000);
   }); 
});

$(document).ready(function() {
    $('#notready').fadeOut('fast');
});

// How to input js into html
// <script  type="text/javascript" src="script.js"></script>

$(document).ready(function(){
    $('div').slideDown('slow');
});

$(document).ready(function(){
    $('div').fadeTo('fast',1);
});

$(document).mouseleave(function(){
    $('div').fadeTo('fast',0.5);
});



/////////////////////////////////////////////



// jQuery Functions
$(document).ready(function() {
	$('div').hide();
});

$(document).ready(function() {
    $('div').click(function() {
        $('div').fadeOut('slow');
    });
});

$(document).ready(function() {
    let $target = $('li:nth-child(4)');
    $target.fadeOut('fast');
});

let $div = $('div'); //$div is just a variable

$(document).ready(function(){
    $('div').fadeIn('slow');
});

$(document).ready(function() {
    $('button').click(function() {
        $('div').fadeOut('slow');
    });
});

