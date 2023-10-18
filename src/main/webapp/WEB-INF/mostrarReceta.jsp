<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receta</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/style/index.css" />
<link rel="stylesheet" href="/style/recetas.css">
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
                            <li><a class="dropdown-item" href="/">Todos los productos</a></li>
                            <li><a class="dropdown-item" href="/">Another action</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li>
                                <a class="dropdown-item" href="/">Something else here</a>
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
                            <li><a class="dropdown-item" href="/recetas">Todas las recetas</a></li>
                            <li><a class="dropdown-item" href="/">Another action</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li>
                                <a class="dropdown-item" href="/">Something else here</a>
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
               <!-- imagen -->
			<div id="imagen-portada">
				<c:if test="${not empty receta.imagenesRec}">
					<c:forEach items="${receta.imagenesRec}" var="ima">
	                 	<img alt="..." src="${ima.url}" id="portada">
	                </c:forEach>
				</c:if>
				<c:if test="${not empty receta.etiquetas}">
	                <c:forEach items="${receta.etiquetas}" var="eti">
	                	<li>${eti.nombre}</li>
	            	</c:forEach>
	            </c:if>
			</div>
        </div>
       	<div class="row"> 
	        <header class="d-flex justify-content-between align-items-center">
	            <h1>${receta.nombre}</h1>
	        </header>
	        <div class="porciones-tiempo">
	            <p>Porciones: ${receta.porciones}</p>
	        </div>
	     
	        <p>${receta.descripcion}</p>
        </div>
        <div>
            <!--Número de valoraciones y volaración final-->
            <div id="valoraciones">
                <p>${receta.numeroValoraciones}</p>
                <p>${receta.valoracionFinal} <meter class="average-rating" min="0" max="5" value="${receta.valoracionFinal}" title="${receta.valoracionFinal} out of 5 stars">${receta.valoracionFinal} out of 5</meter></p>
            </div>
            </div>
       
        <!--solo si el usuario esta logeado-->
        <c:if test="${usuarioEnSesion != null && usuarioEnSesion.id != receta.creador.id}">
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
        </c:if>
        
        <!--Ingredientes-->
        <h3>Ingredientes</h3>
        <ul>
            <c:forEach items="${receta.ingredientes}" var="ingr">
                <li><span>${ingr.nombre} ${ingr.cantidad}</span></li>
            </c:forEach>
        </ul>
        <!--Video-->
        <p>Mira este video de la receta paso a paso</p>
        <!--Preparación con fotos (opcional)-->
        <h3>Preparación</h3>
        <p id="mostrarPreparacion">${receta.preparacion}</p>
        <!--Comentarios-->
        <h5>Comentarios</h5>
        <c:if test="${usuarioEnSesion == null}"><p>Inicio Sesion para añadir tu comentario</p></c:if>
        <div>
        	<c:if test="${usuarioEnSesion != null && receta.creador.id != usuarioEnSesion.id}">
        			<p>Añade tu comentario aqui</p>
        		<div>
        			<form action="/receta/${receta.id}/comentario" method="post">
        				<textarea name="contenido" rows="4" cols="50" class="form-control"></textarea>
        				<input type="hidden" value="${usuarioEnSesion.id}" name="redactor">
        				<input type="hidden" value="${receta.id}" name="recipe">
        				<input type="submit" value="Crear Comentario">
        			</form>
        		</div>
        	</c:if>
        	
        	<div>
        		<c:if test="${receta.comentariosDeReceta != null && !receta.comentariosDeReceta.isEmpty()}">
        			<c:forEach items="${receta.comentariosDeReceta}" var="com">
        				<div>
	        				<span>${com.redactor.nombre}</span>
	        				<p>${com.contenido}</p>
        				</div>
        			</c:forEach>
        		</c:if>
        	</div>
        </div>
        <!---->
	</div>
	</div>
</body>
</html>