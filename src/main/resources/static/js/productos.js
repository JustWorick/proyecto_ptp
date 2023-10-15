/**
 * productos.js
 */

// Selecciona el elemento con la clase sidebar-toggle
var toggle = document.querySelector('.sidebar-toggle');

// Selecciona el elemento con la clase sidebar
var sidebar = document.querySelector('.sidebar');

// Añade un evento de tipo click al elemento toggle
toggle.addEventListener('click', function() {
  // Alterna la clase open al elemento sidebar
  sidebar.classList.toggle('open');
});

// Load More Functionality
document.getElementById('loadMore').addEventListener('click', function() {
    var numDisplayed = parseInt(document.getElementById('numDisplayed').value, 10);
    document.getElementById('numDisplayed').value = numDisplayed + 1;
    document.getElementById('productForm').submit();
});

var stars = document.querySelectorAll('.star');

stars.forEach(function(star) {
    star.addEventListener('click', function() {
        var value = parseInt(this.getAttribute('data-value'), 10);
        // Actualizar el valor del medidor
        var meter = this.parentElement.nextElementSibling;
        meter.value = value;

        // Cambiar la apariencia de las estrellas
        stars.forEach(function(s) {
            if (s.getAttribute('data-value') <= value) {
                s.classList.add('active');
            } else {
                s.classList.remove('active');
            }
        });
    });
});
