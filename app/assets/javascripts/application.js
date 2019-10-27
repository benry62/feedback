// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui/effects/effect-blind
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks




$(document).on('turbolinks:load', function() {
  $( ".not_current" ).hide();




  $("a[id^='edit_']").click(function(){
    var tabId = event.target.id.split("_").pop();
    $("#h").remove();
    $("#holder").remove();
    $("#n_" + tabId ).after( "<tr id=\"h\"><td colspan='9'><div id='holder'><td></div></tr>" );
    })


  $( "button" ).click(function() {
    $( ".not_current" ).toggle();
  });

  $( "a#cancel" ).click(function() {
    alert("click");
  });





});
