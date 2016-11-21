var loadModal = function() {
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
}
$(document).ready(loadModal);
