/**
 * 
 
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
*/


let padre = document.getElementById("ingredientes");
const addButton = document.getElementById("add");
const removeButton = document.getElementById("remove");

function add(){
	let div = document.createElement("div");
	let input1 = document.createElement("input");
	let input2 = document.createElement("input");
	
	div.setAttribute("class","divs");
	
	input1.setAttribute("type","text");
	input1.setAttribute("name","nombreIng[]");	
	input1.setAttribute("class","form-control ");
	input1.setAttribute("placeholder","Ingrediente");
	
	input2.setAttribute("type","text");
	input2.setAttribute("name","cantidad[]");
	input2.setAttribute("class","form-control");
	input2.setAttribute("placeholder","Cantidad");
	
	div.appendChild(input1);
	div.appendChild(input2);
	
	padre.appendChild(div);
}

function remove(){
	let divs = padre.getElementsByTagName("div");
	if(divs.length > 2){
        padre.removeChild(divs[divs.length - 1]);
	}
}

document.getElementById("add").addEventListener("click", function (e) {
  e.preventDefault();
  add();
});

document.getElementById("remove").addEventListener("click", function (e) {
  e.preventDefault();
  remove();
});


//addButton.addEventListener("click",add());
//removeButton.addEventListener("click",remove());
