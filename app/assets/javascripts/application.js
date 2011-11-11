// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function($) {
	
	
  $('div#left-choice').live('click', function() {
    $.post('/attendees',
           { attendee_id: $('div#left-choice span').attr('id') },
           function(){ $('div#right-choice').fadeOut(1000, function() { window.location = '/'; } );
    });
  });

  $('div#right-choice').live('click', function() {
    $.post('/attendees',
           { attendee_id: $('div#right-choice span').attr('id') },
           function(){ $('div#left-choice').fadeOut(1000, function() { window.location = '/'; } );
    });
  });

  $('ol#ranking li:nth-child(2)').addClass('gold');
  $('ol#ranking li:nth-child(3)').addClass('silver');
  $('ol#ranking li:nth-child(4)').addClass('bronze');
});