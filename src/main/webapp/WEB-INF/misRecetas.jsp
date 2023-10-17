<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/style/index.css" />
<link rel="stylesheet" href="/style/recetas.css">
<meta charset="ISO-8859-1">
<title>Mis Recetas</title>
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
                            <li><a class="dropdown-item" href="/productos">Todos los productos</a></li>
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
        <header class="d-flex justify-content-between align-items-center">
            <h1>Mis Recetas</h1>
        </header>
        <p>Aquí podrás encontrar todas las recetas que haz publicado</p>
        <form action="/busqueda" method="post" class="row" id="buscador">
            <div class="col-7">
                <input type="text" name="palabra" class="form-control" placeholder="busca entre tus recetas">
            </div>	
            <input type="submit" value="Buscar" class="btn btn-primary col-1">
            <!-- verificar si el usuario está logeado --> 
		    <a href="/nuevaReceta" class="btn btn-primary col-2">Crear Receta</a>
        </form>
    
	<!-- BOTONES DE TESTEO -->	
        <div>
			<p>Botones de testeo no borrar hasta el final</p>
			<form action="/borrar/imagen/all" method="post">
				<input type="hidden" name="_method" value="delete">
				<input class="btn btn-danger" type="submit" value="Delete All imagenes">
			</form>
		</div>
		<div>
			<form action="/borrar/recetas/all" method="post">
				<input type="hidden" name="_method" value="delete">
				<input class="btn btn-danger" type="submit" value="Delete All recetas">
			</form>
		</div>
            
		 <div class="card mb-3">
		 	
		 	<div class="row g-0">
            	<c:forEach items="${recetas}" var="miReceta">
	                <div class="col-md-4">
	                	<div id="imagen-portada">
		                    <c:if test="${not empty miReceta.imagenesRec}">
								<c:forEach items="${miReceta.imagenesRec}" var="ima">
	                        		<img alt="..." src="${ima.url}">
	                        	</c:forEach>
							</c:if>
							<c:if test="${not empty miReceta.etiquetas}">
	                        	<c:forEach items="${miReceta.etiquetas}" var="eti">
	                        		<li>${eti.nombre}</li>
	                        	</c:forEach>
	                        </c:if>
	                        <c:if test="${receta.creador.id == usuarioEnSesion.id}">
							<!-- si es autor entonces se muestran los botones -->
								<a href="/editar/receta/${receta.id}" class="btn btn-warning">Editar</a>
							
								<form action="/borrar/receta/${receta.id}" method="post">
									<input type="hidden" name="_method" value="delete">
									<input class="btn btn-danger" type="submit" value="Delete Receta">
								</form>
								<form action="/borrar/receta/imagenes/${receta.id}" method="post">
									<input type="hidden" name="_method" value="delete">
									<input class="btn btn-danger" type="submit" value="Delete Imagenes">
								</form>
								
							</c:if>
							<a href="/editar/receta/${receta.id}" class="btn btn-warning">Editar</a>
							
								<form action="/borrar/receta/${receta.id}" method="post">
									<input type="hidden" name="_method" value="delete">
									<input class="btn btn-danger" type="submit" value="Delete Receta">
								</form>
								<form action="/borrar/receta/imagenes/${receta.id}" method="post">
									<input type="hidden" name="_method" value="delete">
									<input class="btn btn-danger" type="submit" value="Delete Imagenes">
								</form>
						</div>
							
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title"><a href="/receta/{id}">${receta.nombre}</a></h5>
								<p class="card-text"><small class="text-body-secondary">Porciones: ${receta.porciones}</small></p>
								<p class="card-text"><small class="text-body-secondary">Valoración: <meter class="average-rating" min="0" max="5" value="4.3" title="4.3 out of 5 stars">4.3 de 5</meter></small></p>
			                        <!-- cambiar value="${receta.valoracionFinal}" title="${receta.valoracionFinal}..." ${receta.valoracionFinal} de 5 -->
								
								<p class="card-text">${receta.descripcion}</p>
					      </div>
		               </div>
	                </div>
                </c:forEach>
            </div>
           </div>
</body>
</html>
</body>
</html>