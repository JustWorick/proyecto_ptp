document.addEventListener('DOMContentLoaded', function() {
  var toggle = document.querySelector('.sidebar-toggle');
  var sidebar = document.querySelector('.sidebar');
  var closeButton = document.querySelector('.close-button');

  toggle.addEventListener('click', function() {
    sidebar.classList.toggle('open');
  });

  closeButton.addEventListener('click', function() {
    sidebar.classList.remove('open');
  });

  document.addEventListener('click', function(event) {
    var isClickInside = sidebar.contains(event.target) || toggle.contains(event.target);
    if (!isClickInside && sidebar.classList.contains('open')) {
      sidebar.classList.remove('open');
    }
  });
});







