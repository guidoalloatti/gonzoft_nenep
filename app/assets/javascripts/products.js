$(document).on('page:load', function() {
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
});
