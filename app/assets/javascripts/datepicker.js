$(document).on('ready page:load', function() {
  $('.input-group.date').datepicker({
    format: 'yyyy-mm-dd',
    autoclose: true
  });
});
