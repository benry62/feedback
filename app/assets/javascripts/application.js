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


  $("body").on("click", "img[id^='i_']", function(){
    var sid = event.target.id.split("_").pop();
    var klass = $(this).attr("class");
    var flag = (klass == "show") ? 0 : 1;
    var new_class = (klass == "show") ? "hidden" : "show";
    var flagJson = {student: {flag: flag}};
    $.ajax({
      type: "PUT",
      url: "/students/" + sid +'.json',
      dataType: "json",
      data: flagJson,
      success: function(){
        $("img[id=i_" + sid + "]").removeClass(klass).addClass(new_class);
      }
    })
  })


  $("body").on("click", "a[id^='edit_']", function(){
    var tabId = event.target.id.split("_").pop();
    $("#h").remove();
    $("#holder").remove();
    $("#n_" + tabId ).after( "<tr id=\"h\"><td colspan='9'><div id='holder'><td></div></tr>" );
  })


  $( "button" ).click(function() {
    $( ".not_current" ).toggle();
  });

  $("body").on("click", "span[id^='s_']", function(){
    var ids = event.target.id.split("_");
    var cid = ids[1];
    var hwid = ids[2];
    $.ajax({
      type: "GET",
      url: "/homeworks/" + hwid + "/comments/" + cid ,
      dataType: "json",
      success: function(data){
        $("#www").empty().html(data.www)
        $("#afd").empty().html(data.area_for_development)
          $( "#dialog" ).dialog("open");
      } // end success
    }) // end ajax
  }) // end span


  $("#dialog").dialog({
      autoOpen: false,
      modal: true,
      title: "Comments"
  });

  $("body").on("click", "img[id^='cx_']", function(){
    var sid = event.target.id.split("_").pop();
    $.ajax({
      type: "GET",
      url: "/notes/?student_id=" + sid,
      dataType: "json",
      success: function(data){
        var s = ''
        for(var i = 0; i < data.length; i++) {
            var obj = data[i].text;
            if (obj.length > 0) {
              s = s + "<li>" + obj + "</li>";
            }
        }
        if (s.length > 0) {
          s = "<ul>" + s + "</ul>"
        } else {
          s = "No notes"
        }
        $("#text").empty().html(s)
        $( "#dialog" ).dialog("open");
      } // success
    })// ajax
  })// "img[id^='cn_']


});
