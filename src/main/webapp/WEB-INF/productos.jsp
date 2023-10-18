<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix = "c" uri =
"http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Productos</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/style/index.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gabarito&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style/productos.css">
<script src="https://kit.fontawesome.com/c6f3fdb2bb.js" crossorigin="anonymous"></script>
</head>
<body>
    <!--Nav-->
    <nav class="navbar navbar-expand-lg navbar-dark p-md-3 bg-transparent">
        <div class="container">
            <a class="navbar-brand" href="/">
                <img src="/public/img/logo2.png" alt="logoLife" width="120px" />
                <!--Cambiar Logo-->
            </a>
            <button
                class="navbar-toggler shadow-none border-0"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div
                class="collapse navbar-collapse d-flex flex-column p-4 flex-lg-row p-lg-0"
                id="navbarSupportedContent"
            >
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contacto</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/productos">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/recetas">Recetas</a>
                    </li>
                    </li>
                </ul>
                <!--Login/SignUp-->
	          <c:if test="${usuarioEnSesion == null}">
		          <div
		            class="d-flex flex-column flex-lg-row justify-content-center align-items-center gap-3"
		          >
		            <a href="/login" class="text-white text-decoration-none">Login</a>
		            <a
		              href="/registro"
		              class="text-black text-decoration-none px-3 py-1 rounded-4"
		              style="background-color: #eefb03"
		            >
		              Sign Up
		            </a>
		          </div>
	          </c:if>
	          <c:if test="${usuarioEnSesion != null}">
	          	<div class="d-flex flex-column flex-lg-row justify-content-center align-items-center gap-3">
                	<a href="/perfil/${id}" class="text-white text-decoration-none" id="perfil" style=" margin-right: 35px; ">
                	<i class="fa-regular fa-user fa-2xl" style="color: #e0901f;margin-right: 10px;">
                	</i>${usuarioEnSesion.nickname}</a>
		     	 </div>
		      </c:if>
            </div>
        </div>
    </nav>
    
    <!--SIDEBAR--> 
    <!-- Elemento con la clase sidebar que contiene el contenido de la barra lateral -->
	<div class="sidebar">
	    <h5>¡Hola ${usuarioEnSesion.nombre}!</h5>
	    <ul>
	        <li><a href="#">Perfil</a></li>
	        <li><a href="#">Mis recetas</a></li>
	        <li><a href="#">Recetas Favoritas</a></li>
	        <li><a href="#">Productos Favoritos</a></li>
	    </ul>
	    <div class="close-button">X</div>
	</div>
	
	<div class="sidebar-toggle">☰</div>
	
	<!-- Barra de búsqueda -->
	<form action="/busquedaProductos" method="post" class="row mt-4 justify-content-center text-center">
	    <div class="col-12 col-md-7 mx-auto mb-2">
	        <input type="text" name="palabra" class="form-control" placeholder="Buscar productos">
	    </div>  
	    <div class="col-12 col-md-1 mx-auto mb-2">
	        <input type="submit" value="Buscar" class="btn btn-primary">
	    </div>
	    <div class="col-12 mx-auto">
	        <a href="/nuevoProducto" class="btn btn-primary">Crear Producto</a>
	    </div>
	</form>

	<!-- Contenido de los productos como tarjetas -->
	<div class="container mt-4">
	    <div class="row">
	        <!-- Primera Tarjeta -->
			<div class="col-md-4">
			    <div class="card mb-3">
			        <img src="public/img/lechealmendra.jpg" class="card-img-top" alt="Producto 1">
			        <div class="card-body">
			            <h5 class="card-title">Leche de Almendras</h5>
			            <p class="card-text">Información nutricional</p>
						<div class="calificar-estrellas">
						    <p class="star" data-value="1">★</p>
						    <p class="star" data-value="2">★</p>
						    <p class="star" data-value="3">★</p>
						    <p class="star" data-value="4">★</p>
						    <p class="star" data-value="5">★</p>
						</div>
			        </div>
			    </div>
			</div>
	
	        <!-- Segunda Tarjeta -->
	        <div class="col-md-4">
	            <div class="card mb-3">
	            	<img src="public/img/lechealmendra.jpg" class="card-img-top" alt="Producto 2">
	                <div class="card-body">
	                    <h5 class="card-title">Producto 2</h5>
	                    <p class="card-text">Información nutricional</p>
	                </div>
	            </div>
	        </div>
	
	        <!-- Otras tarjetas se pueden agregar según sea necesario -->
	    </div>
	</div>

    <script src="js/productos.js"></script>
</body>
</html>


