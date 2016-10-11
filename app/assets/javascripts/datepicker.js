$(document).on('turbolinks:load', function() {
  $('input.input-date').datepicker({
    format: 'yyyy-mm-dd',
    autoclose: true
  });
});
