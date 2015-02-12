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
  var validateRequiredFields = function(form){
    var result = true;
    $('#contactForm *').filter(':input').each(function(){
      if (!$(this).val()){
        $("#"+$(this).attr("id") +"-container").addClass('has-error');
        result = false;
      } else {
        $("#"+$(this).attr("id") +"-container").removeClass('has-error');
      }
    });
    return result;
  };

  var sendEmail = function(){
    if (validateRequiredFields($("#contactForm")))
    {
      $.ajax({
        url: '/contacts/',
        type: 'POST',
        data: $("#contactForm").serialize(),
        dataType: 'json'
      })
      .done(function(response) {
        $("#contactModal").modal('hide');
        if(response.status == 200){
          // $(".alert .alert-text").html(response.message);
          $("#confirmationModal").modal('show');
        }
      });
    }
  };

  $('.contact-button').click(function(){
    $.ajax({
      url: '/products/'+ $(this).attr("product-id"),
      type: 'GET',
      dataType: 'json'
    })
    .done(function(response) {
      $('#contactModal .modal-body #travelDestiny').val(response.name);
      $('#contactModal').modal('show');
    });
    
  });

  $('#contactModal .btn-primary').click(function(){
    sendEmail();
  });

  $('#carousel-example-generic').carousel();
  
        
  $('[data-toggle="tooltip"]').tooltip();
};

$(document).ready(ready);
$(document).on('page:load', ready);
