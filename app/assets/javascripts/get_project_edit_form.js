$(function() {

  $('#editProjectForm').one('ajax:success', function(e, html) {
    $('.project_links').append($(html));
  });

});