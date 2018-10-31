$(function() {
  $('form').submit(function(e) {
    e.preventDefault();
    var $form = $(this);
    var name = $form.find('#name').val();
    var quantity = $form.find('#quantity').val() || '1';
    var listItem = '<li>' + quantity + ' ' + name + '</li>'


    $('ul').append(listItem);
    $form[0].reset();
  });
});
