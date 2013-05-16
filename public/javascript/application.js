$(function() {
  $( "#slider-range-max" ).slider({
    range: "max",
    min: 0,
    max: 100,
    value: 35,
    slide: function( event, ui ) {
      $( "#profanity_level" ).val( ui.value );
    }
  });
  $( "#profanity_level" ).val( $( "#slider-range-max" ).slider( "value" ) );
});