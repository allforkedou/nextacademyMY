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

$(document).ready(function() {
    $('button').click(function() {
        $('div').fadeOut('slow');
    });
});

$(document).ready(function() {
    $('button').click(function() {
        $('#blue').fadeOut('slow');
    });
});

$(document).ready(function() {
    $('.pink, .red').fadeTo('slow',0);
});

$(document).ready(function() {
    $('div').click(function() {
        $(this).fadeOut('slow');
    });
});

$(document).ready(function() {
  $('.pull-me').click(function() {
  });
});

$(document).ready(function() {
  $('.pull-me').click(function() {
      $('.panel').slideToggle('slow');
  });
});



/////////////////////////////////////////////



// Dynamic HTML
$h1 = $("<h1>Hello</h1>");

$(document).ready(function () {
    $("body").append('<p>I\'m a paragraph!</p>');
});

$(document).ready(function () {
  //There is also before()
    $("#one").after('<p>Sneaking in...</p>'); 
});

$(document).ready(function () {
    $("#two").after('<p>Sneaking in...</p>');
});

// .empty() deletes an element's content and all its descendants. For instance, if you .empty() an 'ol', you'll also remove all its 'li's and their text.
// .remove(), not only deletes an element's content, but deletes the element itself.
$(document).ready(function () {
    $("#two").after('<p>Sneaking in...</p>');
    $('p').remove();
});

// .addClass() and .removeClass()
// <div id="title" class="highlighted">I'm highlighted!</div>
$(document).ready(function() {
    $('#text').click(function() {
        $(this).addClass('highlighted');
    });
});

//Turning highlight on and off
$(document).ready(function() {
    $('#text').click(function() {
        $(this).toggleClass('highlighted');
    });
});

$("div").height("100px");
$("div").width("50px");
$("div").css("background-color","#008800");

$(document).ready(function() {
  // $('div').height('200px');
  // $('div').width('200px');
  $('div').css({
    'height': '200px',
    'width': '200px',
    'border-radius': '10px'
  });
});

// .html() can be used to set the contents of the first element match it finds.
// .val() is used to get the value of form elements. For example,would get the value of the first checked checkbox that jQuery finds.
$('div').html("I love jQuery!");
$('input:checkbox:checked').val();

$(document).ready(function() {
  $('p').html("jQuery magic in action!");
});

// <form name="checkListForm">
//   <input type="text" name="checkListItem"/>
// </form>
$(document).ready(function() {
    $('#button').click(function() {
        let toAdd = $('input[name=checkListItem]').val();
    });
});

$(document).ready(function() {
    $('#button').click(function() {
        var toAdd = $('input[name=checkListItem]').val();
        $('.list').append('<div class="item">'+toAdd+'</div>');
    });
});
;

// The problem is that it won't work—jQuery looks for all the .items when the DOM is loaded, so by the time your document is ready, it's already decided there are no .items to .remove(), and your code won't work.
$('.item').click(function() {
    $(this).remove();
});

$(document).on('click', '.item', function() {
    $(this).remove();
});



/////////////////////////////////////////////



// jQuery Events
$(document).ready(function() {
    $('button').click(function() {
      var toAdd = $("input[name=message]").val();
        $('#messages').append("<p>"+toAdd+"</p>");
    });
});

$(document).ready(function() {
  $('div').click(function(event) {
    $('div').fadeOut('fast');
  });
});

$(document).ready(function() {
  $('div').hover(function(event) {
    $(this).addClass('red');
  });
});


$(document).ready(function() {
  $('div').dblclick(function(event) {
    $(this).fadeOut('fast');
  });
});

$(document).ready(function(){
  $('div').hover(
    function(){
        $(this).addClass('active')
    },
    function(){
        $(this).removeClass('active')  
    }
  );
});

$(document).ready(function() {
  $('input').focus(function(event) {
    $(this).css({
      'outline-color': '#FF0000',
      'color': '#FF0000'
    });
  });
});

$(document).ready(function() {
  $(document).keydown(function(event) {
    /* Act on the event */
    $('div').animate({
    left: '+=10px'},
    500);
  });
});

$(document).ready(function() {
    $(document).keydown(function(key) {
        switch(parseInt(key.which,10)) {
      // Left arrow key pressed
      case 37:
        $('img').animate({left: "-=10px"}, 'fast');
        break;
      // Up Arrow Pressed
      case 38:
        // Put our code here
        $('img').animate({top: "-=10px"}, 'fast');
        break;
      // Right Arrow Pressed
      case 39:
        // Put our code here
        $('img').animate({left: "+=10px"}, 'fast');
        break;
      // Down Arrow Pressed
      case 40:
        // Put our code here
        $('img').animate({top: "+=10px"}, 'fast');
        break;
    }
  });
});



/////////////////////////////////////////////



// jQuery Effects
$(document).ready(function() {
  $('div').hide();
});

$(document).ready(function() {
  $('img').animate({top: '+=100px'}, 1000)
  //milliseconds
});

$(document).ready(function() {
  $('div').click(function(event) {
    /* Act on the event */
    $(this).effect('explode')
  });
});

$(document).ready(function() {
  $('div').click(function(event) {
    /* Act on the event */
    $(this).effect('bounce', {times:3}, 500)
  });
});

$(document).ready(function() {
  $('div').click(function(event) {
    /* Act on the event */
    $(this).effect('slide')
  });
});

$(document).ready(function() {
    $("#menu").accordion({collapsible: true, active: false});
});

$(document).ready(function() {
  $("#car").draggable();
});

$(document).ready(function() {
  $("div").resizable();
});

// <ol>
//     <li>Super Mario Bros.</li>
//     <li>Tetris</li>
//     <li>Legend of Zelda: Link's Awakening</li>
//     <li>Kirby's Dream World</li>
//     <li>Burger Time</li>
//     <li>Pokémon Red</li>
//     <li>Pokémon Blue</li>
// </ol>
$(document).ready(function() {
    $("ol").selectable();
});

$(document).ready(function() {
    $("ol").sortable();
});

$(document).ready(function() {
  
});

// http://api.jqueryui.com/autocomplete/ jQuery AutoComplete
// https://www.talater.com/annyang/ Annyang




