var products = function() {
  var modal = document.getElementById('new-product-modal');
  var button = document.getElementById('add-product');
  var close = document.getElementsByClassName('close')[0];

  button.onclick = function() {
    modal.style.display = 'block';
  }

  close.onclick = function() {
    modal.style.display = 'none';
  }

  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = 'none';
    }
  }

  $('#new-product-modal form').submit(function(e) {
    e.preventDefault();

    var url = $(this).attr('action');
    var name = $('#new-product-modal form input#product_name').val();
    var description = $('#new-product-modal form textarea#product_description').val();

    $.post(url, { name: name, description: description }, function(data) {
      debugger
      modal.style.display = 'none';
      var name = $('#new-product-modal form input#product_name').val("");
      var description = $('#new-product-modal form textarea#product_description').val("");
    });
  });
}
$(document).ready(products);
$(document).load(products);
