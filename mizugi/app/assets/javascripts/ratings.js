// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
  var product_id = $('#product-id').data('product_id');
  var rate = $('#rate-score').data('rate');
  if (rate != '') {
    $('#star' + rate).prop('checked', true);
  }

  $('.star-rating').on('click', function() {
    rate = $(this).val();
    console.log(rate + ' ' + product_id);
    $.post('/ratings', { id: product_id, rate: rate }, function() {
      location.reload();
    });
  })
})