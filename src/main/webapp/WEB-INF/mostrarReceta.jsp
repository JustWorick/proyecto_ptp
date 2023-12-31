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
<link rel="stylesheet" href="/style/sidebar.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gabarito&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/style/recetas.css">
<link rel="stylesheet" href="/style/mostrarReceta.css">
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
		<div id="containerTitulo">
			<div class="divTitulo">
				<h1>${receta.nombre}</h1>
			</div>
			<div class="bajo-titulo">
				<div class="porciones-valoraciones">
				   	<div class="porciones-tiempo">
				        <p>Porciones: ${receta.porciones}</p>
				    </div>
	        	
		        	<!--Número de valoraciones y volaración final-->
		            <div id="valoraciones">
		                <p>${receta.numeroValoraciones}</p>
		                <p>${receta.valoracionFinal} <meter class="average-rating" min="0" max="5" value="${receta.valoracionFinal}" title="${receta.valoracionFinal} out of 5 stars">${receta.valoracionFinal} out of 5</meter></p>
		            </div>
		        </div>
	            
	            <div class="etiquetas">
					<c:if test="${not empty receta.etiquetas}">
				        <c:forEach items="${receta.etiquetas}" var="eti">
				        	<span>${eti.nombre}</span>
				        </c:forEach>
			        </c:if>
				</div>
		</div>
		
		<div id="subTitulo">
			<p>${receta.descripcion}</p>
	    </div>
	    <div class="creador">
	    	<span>Por ${receta.creador.nombre}</span>
	    </div>
	       
	        <!--solo si el usuario esta logeado-->
	        <c:if test="${usuarioEnSesion != null && usuarioEnSesion.id != receta.creador.id}">
	        	<div class="calificar-estrellas">
		        																
		            <p>Califica esta receta: </p>
		            <form class="star-rating" action="/calificar/receta/${receta.id}" method="post">			<!-- <<<============= FALTA AÑADIR LOGICA -->
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
		                
		                <input type="submit" value= "Enviar calificación" id="enviar-estrellas" class="btn btn-success"/>
		                
		            </form>
	        	</div>
	        </c:if>	
		</div>
		
		
        <div class="col-md-4" id="imagen-principal">
               <!-- imagen -->
			<div id="imagen-portada-mostrar">
				<c:if test="${not empty receta.imagenesRec}">
					<c:forEach items="${receta.imagenesRec}" var="ima">
						<div class="img">
							<img alt="..." src="${ima.url}">
						</div>
	                </c:forEach>
				</c:if>
			</div>
        </div>
        
       	
		<div id="divBajoImagen">
				 <!--Ingredientes-->
	        <div id="divIngredientes">
	        	<h3>Ingredientes</h3>
		        <ul id="ingredientes">
		            <c:forEach items="${receta.ingredientes}" var="ingr">
		                <li><span>${ingr.nombre} ${ingr.cantidad}</span></li>
		            </c:forEach>
		        </ul>
	        </div>
	        
	        <!--Video-->
	        <div class="video-receta">
		        <h3>Mira este video de la receta paso a paso</h3>
		        <c:if test="${not empty receta.videoRec}">
		        	<div id="cuadro-video">
		        		${receta.videoRec.url}
		        	</div>
		        </c:if>
	        </div>
	        <div>
	        	<h3>Preparación</h3>
	        	<p id="mostrarPreparacion">${receta.preparacion}</p>
	        </div>
	        
	        <!--Comentarios-->
	        
		</div>
		
		<div id="divComentarios">
			<h5>Comentarios</h5>
	        
	        <c:if test="${usuarioEnSesion == null}"><p>Inicia Sesion para añadir tu comentario</p></c:if>
	        <div>
	        	<c:if test="${usuarioEnSesion != null && receta.creador.id != usuarioEnSesion.id}">
	        			<p>Añade tu comentario aqui</p>
	        		<div>
	        			<form action="/receta/${receta.id}/comentario" method="post">
	        				<textarea name="contenido" rows="4" cols="50" class="form-control"></textarea>
	        				<input type="hidden" value="${usuarioEnSesion.id}" name="redactor">
	        				<input type="hidden" value="${receta.id}" name="recipe">
	        				<input type="submit" value="Crear Comentario" class="btn btn-success">
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
		</div>
       </div>
        <!---->
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