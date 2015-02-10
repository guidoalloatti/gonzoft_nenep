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
//= require bootstrap.min
//= require turbolinks
//= require_tree .
var ready;
ready = function(){
  $('#carousel-example-generic').carousel();

  $('.modal').on('show.bs.modal', function () {
    if ($(document).height() > $(window).height()) {
          // no-scroll
          $('body').addClass("modal-open-noscroll");
      }
      else {
          $('body').removeClass("modal-open-noscroll");
      }
  })
  $('.modal').on('hide.bs.modal', function () {
      $('body').removeClass("modal-open-noscroll");
  })
      
  $('[data-toggle="tooltip"]').tooltip();
};

$(document).ready(ready);
$(document).on('page:load', ready);
