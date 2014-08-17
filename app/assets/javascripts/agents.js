$(document).ready( function() {

  $('#zipform').on("submit", function(event) {
    event.preventDefault();
    var zipinfo = $( this ).serializeArray();
    zipinfo = zipinfo[0]["value"]
    $.ajax({
        type: "POST",
        url: "/zip",
        data: { zipcode: zipinfo }
    }).done(function() {
      $('#new_agent').append("<input type='hidden' name='zipcode' value='" + zipinfo +"'>");
      });
  });

  $("body").on("click",":checkbox", function() {
   if($( this ).is(':checked')) {
      var val = parseFloat($('#price').text());
      var new_val = (val+ 45);
      $('#price').replaceWith("<span id='price'>" + new_val + "</span>");
   } else {
      var val = parseFloat($('#price').text());
      var new_val = (val - 45);
      $('#price').replaceWith("<span id='price'>" + new_val + "</span>");
   }
  });
});
