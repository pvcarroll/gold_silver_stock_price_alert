// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
(function () {
    alert('alerts.js self-invoking function');
})();

alert('alerts.js message');


$(document).ready(function() {
  $("#alert_item").change(function() {
    if ($("#alert_item").val() == "stock") {
      $(".stockField").fadeIn('fast');
    } else {
      $(".stockField").fadeOut('fast');
    }
  });
});