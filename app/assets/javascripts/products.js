var ready;
ready = function(){
  $('#showExtra').click(function(){
    $('#showExtra').hide();
    $('form.edit_product .hidden').removeClass('hidden');
    $('form.new_product .hidden').removeClass('hidden');
  });

  $('.product.visibleChk').change(function(){
    $.ajax({
      url: '/product/'+ this.value +'/visible',
      type: 'GET',
      dataType: 'json'
    })
    .done(function() {
      console.log("success");
    });

  });

  var deleteProduct = function(productKey){
    $.ajax({
      url: '/products/'+productKey ,
      type: 'DELETE',
      dataType: 'json'
    })
    .done(function() {
      $("#product" + productKey ).hide();
    });

  };

  $('#modalDeleteProduct').on('shown.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var productKey = button.attr("product-key");
    var modal = $(this);
    console.log(productKey);
    $('#doDelete').attr('product-key', productKey);
    $('#doDelete').click(function(event) {
      deleteProduct(productKey);
      $('#modalDeleteProduct').modal('hide');
    });
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);