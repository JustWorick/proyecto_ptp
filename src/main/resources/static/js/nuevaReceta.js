/**
 * 
 */
$(document).ready(function() {
  // Add event listener for form submission
  $('form').submit(function(event) {
    event.preventDefault(); // Prevent default form submission
    var form = $(this); // Get the form element
    var url = form.attr('action'); // Get the form action URL
    var data = form.serialize(); // Serialize the form data
    $.ajax({
      type: 'POST',
      url: url,
      data: data,
      success: function(response) {
        // Handle successful form submission
      },
      error: function(xhr, status, error) {
        // Handle form submission error
      }
    });
  });
});
