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

  $(".select-stage4").change(function(){
    var s1 = document.getElementById("select-stage4-1").value;
    var s2 = document.getElementById("select-stage4-2").value;
    var s3 = document.getElementById("select-stage4-3").value;
    if( s1 != "nil" && s2 != "nil" && s3 != "nil")
    {
      $("#stage4Next").removeAttr("disabled");
    }else{
      $("#stage4Next").attr("disabled", "");
    }
  });
});

/* CODE FOR REGISTRATION PROCESS */
function stage1NextEnable()
{
  $("#stage1Next").removeAttr("disabled");
}
function stage2NextEnable()
{
  var cbs21 = document.getElementById("jacket1").checked;
  var cbs22 = document.getElementById("jacket2").checked;
  var cbs23 = document.getElementById("jacket3").checked;
  if(cbs21 || cbs22 || cbs23)
  {
    $("#stage2Next").removeAttr("disabled");
  }
  else
  {
    $("#stage2Next").attr("disabled", "");
  }
  
}
function stage3NextEnable()
{
  var cbs31 = document.getElementById("pants1").checked;
  var cbs32 = document.getElementById("pants2").checked;
  var cbs33 = document.getElementById("pants3").checked;
  if(cbs31 || cbs32 || cbs33)
  {
    $("#stage3Next").removeAttr("disabled");
  }
  else
  {
    $("#stage3Next").attr("disabled", "");
  }
  
}
function stage4NextEnable()
{
  $("#stage4Next").removeAttr("disabled");
}

function backToStage1()
{
  $("#stage2").css("display", "none");
  $("#stage1").css("display", "block");
  $(".page-header #registration-header").html("Choose global style");
}
function backToStage2()
{
  $("#stage3").css("display", "none");
  $("#stage2").css("display", "block");
  $(".page-header #registration-header").html("Choose jacket <small>all that apply</small>");
}
function backToStage3()
{
  $("#stage4").css("display", "none");
  $("#stage3").css("display", "block");
  $(".page-header #registration-header").html("Choose pants <small>all that apply</small>");
}
function backToStage4()
{
  $("#stage5").css("display", "none");
  $("#stage4").css("display", "block");
  $(".page-header #registration-header").html("Choose size");
}

function processStage1()
{
  $("#stage1").css("display", "none");
  $("#stage2").css("display", "block");
  $(".page-header #registration-header").html("Choose jacket <small>all that apply</small>");
}
function processStage2()
{
  $("#stage2").css("display", "none");
  $("#stage3").css("display", "block");
  $(".page-header #registration-header").html("Choose pants <small>all that apply</small>");
}
function processStage3()
{
  $("#stage3").css("display", "none");
  $("#stage4").css("display", "block");
  $(".page-header #registration-header").html("Choose size");
}
function processStage4()
{
  $("#stage4").css("display", "none");
  $("#stage5").css("display", "block");
  $(".page-header #registration-header").html("Choose hat, shoes, and sizes");
}












