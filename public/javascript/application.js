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

$(function(){
  $( "textarea#output" ).val( "" )
  $( "#generate" ).click(function(){
    var url            = $( "form" ).attr( "action" )
    var staticStart    = $( "#static_start" ).is( ":checked" );
    var paragraphs     = $( "#paragraphs" ).val();
    var profanityLevel = $( "#profanity_level" ).val();

    $.ajax( {
      type: "GET",
      url: "api/generate",
      data: {
        static_start: staticStart,
        paragraphs: paragraphs,
        profanity_level: profanityLevel
      },
      success: function(data){
        $( "textarea#output" ).val( data )
      },
      error: function(){
        $( "textarea#output" ).val( "Sorry, man. Something's fucked up." )
      }
    } );
  });
});
