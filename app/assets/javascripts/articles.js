$(document).on('page:load', function() {
  $('.visibleChk').change(function(){
    $.ajax({
      url: '/article/'+ this.value +'/visible',
      type: 'GET',
      dataType: 'json'
    })
    .done(function() {
      console.log("success");
    });

  });

  var deleteArticle = function(articleKey){
    $.ajax({
      url: '/articles/'+articleKey ,
      type: 'DELETE',
      dataType: 'json'
    })
    .done(function() {
      $("#article" + articleKey ).hide();
    });

  };

  $('#modalDelete').on('shown.bs.modal', function (event) {
    debugger;
    var button = $(event.relatedTarget);
    var articleKey = button.attr("article-key");
    var modal = $(this);
    console.log(articleKey);
    $('#doDelete').attr('article-key', articleKey);
    $('#doDelete').click(function(event) {
      deleteArticle(articleKey);
      $('#modalDelete').modal('hide');
    });
  });
});
