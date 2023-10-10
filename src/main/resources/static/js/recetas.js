/**
 * 
 */

// Archivo script.js que contiene el código JavaScript

// Selecciona el elemento con la clase sidebar-toggle
var toggle = document.querySelector('.sidebar-toggle');

// Selecciona el elemento con la clase sidebar
var sidebar = document.querySelector('.sidebar');

// Añade un evento de tipo click al elemento toggle
toggle.addEventListener('click', function() {
  // Alterna la clase open al elemento sidebar
sidebar.classList.toggle('open');
});
