$(() => {
  var url = window.location.pathname;
  var product_id = url.substring(url.lastIndexOf('/') + 1);
  
  function update_detail() {
    $.ajax({
      type: 'GET',
      url: `/products/update_price`,
      data: {
        id: product_id,
        male_size: $(".size-select-male .current").html(),
        female_size: $(".size-select-female .current").html(),
        male_color: $(".color-select-male .current").html(),
        female_color: $(".color-select-female .current").html()
      }
    }).done((response) => {
      $("#product-price").html(`$${response.selected_male_product.price + response.selected_female_product.price}`)
      $("#cart_male_product_id").val(response.selected_male_product.id)
      $("#cart_female_product_id").val(response.selected_female_product.id)
    })
  }
  
  $(".size-select-male").change(function(){ update_detail() })
  $(".size-select-female").change(function(){ update_detail() })
  $(".color-select-male").change(function(){ update_detail() })
  $(".color-select-female").change(function(){ update_detail() })
})