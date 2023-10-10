<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recetas</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/style/index.css" />
</head>
<body>
    <!--Nav-->
    <nav class="navbar navbar-expand-lg navbar-dark p-md-3 bg-transparent">
      <div class="container">
        <a class="navbar-brand" href="#">
          <img src="/public/img/logo.png" alt="logoLife" width="120px" />
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
              <a class="nav-link active" aria-current="page" href="#">Inicio</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contacto</a>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Productos
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li>
                  <a class="dropdown-item" href="#">Something else here</a>
                </li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Recetas
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li>
                  <a class="dropdown-item" href="#">Something else here</a>
                </li>
              </ul>
            </li>
          </ul>
          <!--Login/SignUp-->
          <div class="d-flex flex-column flex-lg-row justify-content-center align-items-center gap-3">
            <a href="/login" class="text-white text-decoration-none">Login</a>
            <a href="/registro" class="text-black text-decoration-none px-3 py-1 rounded-4" style="background-color: #eefb03"> Sign Up </a>
          </div>
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
    </div>

    <!-- Elemento con la clase sidebar-toggle que sirve para mostrar u ocultar la barra lateral -->
    <div class="sidebar-toggle">☰</div>

    <!-- Etiqueta script que enlaza el archivo js que contiene el código JavaScript -->
    <script src="js/recetas.js"></script>


	<div class="contenido">
        <header class="d-flex justify-content-between align-items-center">
            <h1>Recetas</h1>
        </header>
        <p>Aquí podrás encontrar miles de recetas sin gluten, sin lactosa, veganas y muchas otras opciones que se adapten a tu estilo de vida y alimentación</p>
        <form action="/busqueda" method="post" class="row">
            <div class="col-7">
                <input type="text" name="palabra" class="form-control" placeholder="Hotcakes sin gluten">
            </div>	
            <input type="submit" value="Buscar" class="btn btn-primary col-1">
            <!-- verificar si el usuario está logeado --> 
		    <a href="/nuevaReceta" class="btn btn-primary">Crear Receta</a>
        </form>
            
        <div class="card mb-3">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="https://cdn.pixabay.com/photo/2015/09/16/20/10/dough-943245_1280.jpg" class="img-fluid rounded-start" alt="imagen_receta">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title"><a href="/show/${receta.id}">${receta.nombre}</a></h5>
                        <p class="card-text">${receta.descripcion} This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer. Lorem ipsum, dolor sit amet consectetur adipisicing elit. Optio corrupti dolores deserunt exercitationem provident, cumque laborum tenetur mollitia, assumenda deleniti aut reprehenderit, tempora dicta! Corporis odio dolor rerum earum quae.</p>
                        Valoración: <meter class="average-rating" min="0" max="5" value="4.3" title="4.3 out of 5 stars">4.3 de 5</meter> 
                        <!-- cambiar value="${receta.valoracionFinal}" title="${receta.valoracionFinal}..." ${receta.valoracionFinal} de 5 -->
                        <div class="porciones-tiempo"> 
                            <p class="card-text"><small class="text-body-secondary">${receta.porciones}</small></p>
                            <p class="card-text"><small class="text-body-secondary">${receta.tiempoDePreparacion}</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
	</div>
</body>
</html>