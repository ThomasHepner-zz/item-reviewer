var products = function() {
  var modal = document.getElementById('form-modal');
  var button = document.getElementById('new-form');
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

  $('.new-product-modal form').submit(function(e) {
    e.preventDefault();

    var url = $(this).attr('action');
    var name = $('.new-product-modal form input#product_name').val();
    var description = $('.new-product-modal form textarea#product_description').val();

    $.post(url, { name: name, description: description }, function(data) {
      modal.style.display = 'none';
      var name = $('.new-product-modal form input#product_name').val("");
      var description = $('.new-product-modal form textarea#product_description').val("");
    });
  });

  $('.new-review-modal form').submit(function(e) {
    e.preventDefault();

    var url = $(this).attr('action');
    var content = $('.new-review-modal form textarea#review_content').val();
    var rating = $('.new-review-modal form input#rating-slider').val();

    $.post(url, { content: content, rating: rating }, function(data) {
      modal.style.display = 'none';
      var content = $('.new-review-modal form textarea#review_content').val("");
      var rating = $('.new-review-modal form input#rating-slider').val("");
    });
  });
}
$(document).ready(products);
$(document).load(products);
