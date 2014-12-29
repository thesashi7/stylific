// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets
//= require moment.min
//= require fullcalendar
//= require customer

$(document).ready(function(){
	$(".cb").click(function(){
      $(this).toggleClass("red-border");
	});
  $(".rb").click(function(){
    $(".rb").removeClass("red-border");
    $(this).addClass("red-border");
  });
});

$(function() {
  $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 500);
        return false;
      }
    }
  });
});

$(document).ready(function () {
  $('[data-toggle="offcanvas"]').click(function () {
    $('.row-offcanvas').toggleClass('active')
  });
});

/* CODE FOR REGISTRATION PROCESS */

function backToStage1()
{
  $("#stage2").css("display", "none");
  $("#stage1").css("display", "block");
  $(".page-header #registration-header").html("Choose global style");
}

function processStage1()
{
  $("#stage1").css("display", "none");
  $("#stage2").css("display", "block");
  $(".page-header #registration-header").html("Choose jacket you like");
}