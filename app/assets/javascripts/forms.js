$(function() {
  $('.js-submit-on-change').change(function() {
    $(this).closest('form').submit();
  })
});