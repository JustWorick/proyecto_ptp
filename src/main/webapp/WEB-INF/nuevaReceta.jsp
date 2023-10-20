<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix = "c" uri =
"http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crear Receta</title>
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
	        <li><a href="perfil/${usuarioEnSesion.id}">Perfil</a></li>
	        <li><a href="#">Mis recetas</a></li>
	        <li><a href="#">Recetas Favoritas</a></li>
	        <li><a href="#">Productos Favoritos</a></li>
	    </ul>
	    <div class="close-button">X</div>
	</div>
	
	<div class="sidebar-toggle">☰</div>

	<div class="contenido">
		<h1>Nueva Receta</h1>
		<form:form action="/nuevaReceta" method="post" modelAttribute="receta" enctype="multipart/form-data">
			<div>
				<form:label path="nombre">Nombre</form:label>
				<form:input path="nombre" class="form-control" type="text"/>
				<form:errors path="nombre" class="text-danger"/>	
			</div>
			<div>
				<form:label path="descripcion">Descripción</form:label>
				<form:textarea path="descripcion" class="form-control" type="text"/>
				<form:errors path="descripcion" class="text-danger"/>	
			</div>
			<div>
				<form:label path="porciones">Porciones</form:label>
				<form:input path="porciones" class="form-control" type="number"/>
				<form:errors path="porciones" class="text-danger"/>	
			</div>
			
			<div>
				<input type="file" name="imagen" class="form-control" multiple>     
			</div>
			<div>
				<select name="etiqueta">
					<c:forEach items="${nombreEtiquetas}" var="etiName">
						<option value="${etiName}">${etiName}</option>
					</c:forEach>
				</select>
			</div>
			
			<div id="ingredientes">
				<p>Ingredientes:</p>
            	<div class="nombre-cantidad-ingrediente">
	            	<input type="text" name="nombreIng[]"  placeholder="Ingrediente" class="form-control">
	            	<input type="text" name="cantidad[]" placeholder="Cantidad" class="form-control">
            	</div>
            	<div class="añadir-quitar-ingrediente">
					<button class="btn btn-warning" onclick="add()" id="add">Añadir Ingrediente</button>
					<button class="btn btn-warning"  onclick="remove()" id="remove">Quitar Ingrediente</button>
				</div>
            </div>
			
            <div>
				<form:label path="preparacion">Preparación</form:label>
				<form:textarea path="preparacion" class="form-control" id="preparacion" style="white-space: pre-line;"/>
				<form:errors path="preparacion" class="text-danger"/>	
			</div>
			<form:hidden path="creador" value="${usuarioEnSesion.id}"/>
			
			
			
            <input type="submit" class="btn btn-success mt-3" value="Publicar"/>
		</form:form>
		
		
		<!--  
		
		<form action="/subir-imagen" method="post" enctype="multipart/form-data">
		  <input type="file" name="imagen" class="form-control">
		  <input type="submit" value="Añadir imagen">
		</form>
		-->
		
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
	<script src="js/nuevaReceta.js"></script>
	<script src="js/sidebar.js"></script>
</body>
</html>