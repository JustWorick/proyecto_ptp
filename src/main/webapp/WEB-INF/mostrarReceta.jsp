<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receta</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
        <div class="col-md-4" id="imagen-principal">
            <img src="https://cdn.pixabay.com/photo/2015/09/16/20/10/dough-943245_1280.jpg" class="img-fluid rounded-start" alt="imagen_receta">
        </div>
        <header class="d-flex justify-content-between align-items-center">
            <h1>${receta.nombre}</h1>
        </header>
        <div class="porciones-tiempo">
            <p>Porciones ${receta.porciones}</p>
            <p>Tiempo de preparación</p>
        </div>
        <p>${receta.descripcion}</p>
        <div>
            <!--Número de valoraciones y volaración final-->
            <div id="valoraciones">
                <p>${receta.numeroValoraciones}</p>
                <p>${receta.valoracionFinal} <meter class="average-rating" min="0" max="5" value="4.3" title="4.3 out of 5 stars">4.3 out of 5</meter></p>

                
            </div>
        </div>
        <!--solo si el usuario esta logeado-->
        <div class="calificar-estrellas">
            <p>Califica esta receta: </p>
            <form class="star-rating">
                <input class="radio-input" type="radio" id="star5" name="star-input" value="5" />
                <label class="radio-label" class for="star5" title="5 stars">5 stars</label>
            
                <input class="radio-input" type="radio" id="star4" name="star-input" value="4" />
                <label class="radio-label" for="star4" title="4 stars">4 stars</label>
            
                <input class="radio-input" type="radio" id="star3" name="star-input" value="3" />
                <label class="radio-label" for="star3" title="3 stars">3 stars</label>
            
                <input class="radio-input" type="radio" id="star2" name="star-input" value="2" />
                <label class="radio-label" for="star2" title="2 stars">2 stars</label>
            
                <input class="radio-input" type="radio" id="star1" name="star-input" value="1" />
                <label class="radio-label" for="star1" title="1 star">1 star</label>
            </form>
        </div>
        <!--Ingredientes-->
        <h3>Ingredientes</h3>
        <ul>
            <c:forEach items="ingredientes" var="ingrediente">
                <li>${ingrediente}</li>
            </c:forEach>
        </ul>
        <!--Video-->
        <p>Mira este video de la receta paso a paso</p>
        <!--Preparación con fotos (opcional)-->
        <h3>Preparación</h3>
        <!--Comentarios-->
        <h5>Comentarios</h5>
        <!---->
	</div>
</body>
</html>