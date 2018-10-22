$(function() {
  var templates = {};

  $("script[type='text/x-handlebars']").each(function() {
    var $tmpl = $(this);
    templates[$tmpl.attr('id')] = Handlebars.compile($tmpl.html());
  });
});
