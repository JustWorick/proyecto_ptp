<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Receta</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/style/index.css" />
<link rel="stylesheet" href="/style/sidebar.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gabarito&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/style/nuevaReceta.css">
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
                </ul>
                <!--Login/SignUp-->
	          <c:if test="${usuarioEnSesion == null}">
		          <div
		            class="d-flex flex-column flex-lg-row justify-content-center align-items-center gap-3"
		          >
		            <a href="/login" class="text-white text-decoration-none">Inicia Sesión</a>
		            <a
		              href="/registro"
		              class="text-black text-decoration-none px-3 py-1 rounded-4"
		              style="background-color: #eefb03"
		            >
		              Regístrate
		            </a>
		          </div>
	          </c:if>
	          <c:if test="${usuarioEnSesion != null}">
	          	<div class="d-flex flex-column flex-lg-row justify-content-center align-items-center gap-3">

                	<a href="/perfil/${usuarioEnSesion.id}" class="text-white text-decoration-none" id="perfil" style=" margin-right: 35px; ">

                	<a href="/perfil/${usuarioEnSesion.id}" class="text-white text-decoration-none" id="perfil" style=" margin-right:5px; ">

                	<i class="fa-regular fa-user fa-2xl" style="color: #e0901f;margin-right: 10px;">
                	</i>${usuarioEnSesion.nickname}</a>
                	<a href="/logout" id="cerrarSesion">
		              <i class="fa-solid fa-right-from-bracket fa-xl" style="color: #ec4646;margin-right: 10px;"></i>
		            </a>
		     	 </div>
		      </c:if>
            </div>
        </div>
    </nav>
	<!--SIDEBAR--> 
    <!-- Elemento con la clase sidebar que contiene el contenido de la barra lateral -->
	<div class="sidebar">
		
		<c:if test="${usuarioEnSesion == null}">
			<h4>¡Hola!</h4>
			<h5>Bienvenid@ a .Life</h5>
			<div class="botones-inicio-sesion">
				<a href="/login" class="btn btn-success">Inicia Sesión</a>
				<a href="/registro" class="btn btn-warning">Regístrate</a>
			</div>
		</c:if>
	        
	    <c:if test="${usuarioEnSesion != null}">
	    	<h5>¡Hola ${usuarioEnSesion.nickname}!</h5>
			<ul>
				<li><a href="perfil/${usuarioEnSesion.id}">Perfil</a></li>
				<li><a href="/misRecetas/${usuarioEnSesion.id}">Mis recetas</a></li>
				<li><a href="/misProductos/${usuarioEnSesion.id}">Productos publicados</a></li>
				<li><a href="/nuevaReceta">Crear Receta</a></li>
				<li><a href="/nuevoProducto">Publicar Producto</a></li>
			</ul>
	        		
	    </c:if>
	    
	    <div class="close-button">X</div>
	</div>
	
	<div class="sidebar-toggle">☰</div>

	<div class="contenido">
		<h1>Editar Receta</h1>
		<form:form action="/crear" method="post" modelAttribute="receta">
			<div>
				<form:label path="nombre">Nombre</form:label>
				<form:input path="nombre" class="form-control"/>
				<form:errors path="nombre" class="text-danger"/>	
			</div>
			<div>
				<form:label path="descripcion">Descripción</form:label>
				<form:textarea path="descripcion" class="form-control"/>
				<form:errors path="descripcion" class="text-danger"/>	
			</div>
			<div>
				<form:label path="porciones">Porciones</form:label>
				<form:input path="porciones" class="form-control" type="number"/>
				<form:errors path="porciones" class="text-danger"/>	
			</div>
            <div>
				<form:label path="tiempo">Tiempo de preparación</form:label>
				<form:input path="tiempo" class="form-control" type="time" step="60"/>
				<form:errors path="tiempo" class="text-danger"/>	
			</div>
            <div>
				<form:label path="ingredientes">Ingredientes</form:label>
				<form:input path="ingredientes" class="form-control"/>
				<form:errors path="ingredientes" class="text-danger"/>	
			</div>
            <div>
				<form:label path="preparacion">Preparación</form:label>
				<form:input path="preparacion" class="form-control"/>
				<form:errors path="preparacion" class="text-danger"/>	
			</div>
			<form:hidden path="autor" value="${usuarioEnSesion.id}"/>
            <form:hidden path="id" value="${receta.id}"/>
			<input type="hidden" value="put" name="_method"/>
			<input type="submit" class="btn btn-success mt-3" value="Guardar"/>
		</form:form>
	
	</div>
	<!-- Footer -->
	<footer class="bg-dark text-white py-5">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-4">
	                <h5>Contacto</h5>
	                <p>Teléfono: +56 123 456 789</p>
	                <p>Email: info@lifediet.com</p>
	                <p>Dirección: Caupolicán #263, Concepción, Región del Biobío, Chile</p> <!-- Dirección Falsa -->
	            </div>
	            <div class="col-md-4">
	                <h5>Quiénes Somos</h5>
	                <p>Descubre más sobre <a href="/quienes_somos">quiénes somos</a>.</p>
	                <p>Explora nuestra <a href="/vision">visión</a> y <a href="/mision">misión</a>.</p>
	            </div>
	            <div class="col-md-4">
	                <h5>Redes Sociales</h5>
	                <a href="https://facebook.com/tuempresa" target="_blank">
	                    <img src="public/img/facebook_logo.png" alt="Facebook" width="30" height="30">
	                </a>
	                <a href="https://twitter.com/tuempresa" target="_blank">
	                    <img src="public/img/twitter_logo.png" alt="Twitter" width="30" height="30">
	                </a>
	                <a href="https://instagram.com/tuempresa" target="_blank">
	                    <img src="public/img/instagram_logo.png" alt="Instagram" width="30" height="30">
	                </a>
	            </div>
	        </div>
	        <div class="row mt-3">
	            <div class="col">
	                <a href="/quienes_somos">Quiénes Somos</a> |
	                <a href="/ubicacion">Ubicación</a> |
	                <a href="/equipo">Nuestro Equipo</a>
	            </div>
	        </div>
	    </div>
	</footer>
	<script src="js/sidebar.js"></script>
</body>
</html>