$(document).ready(function(){
  $("#btn-chat").attr('disabled', true);
  $("#btn-input").keyup(function(){
    if ( $(this).val() != ""){
      $("#btn-chat").attr('disabled', false);
    } else {
      $("#btn-chat").attr('disabled', true);
    }
  });
});
