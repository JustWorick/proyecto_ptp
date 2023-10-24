<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
     integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>

    <script src="https://kit.fontawesome.com/c6f3fdb2bb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/style/index.css" />
    <link rel="stylesheet" href="/style/sidebar.css" />
   	<link rel="stylesheet" href="/style/footer.css" />
   	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gabarito&display=swap" rel="stylesheet">

    <title>Life</title>
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
    
	<div id="carouselExampleIndicators" class="carousel">
	    <div class="carousel-inner">
	        <div class="carousel-item active">
	            <img class="d-block w-100" src="public/img/airelibre.png" alt="First slide">
	        </div>
	        <div class="carousel-item">
	            <img class="d-block w-100" src="public/img/fuego.png" alt="Second slide">
	        </div>
	        <div class="carousel-item">
	            <img class="d-block w-100" src="public/img/prote.png" alt="Third slide">
	        </div>
	    </div>
		<a class="carousel-control-prev" href="#" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		</a>
	</div>
	
	<section class="texto-eslogan">
	    <h1>.Life</h1>
	    <h4>Cocina Inclusiva: Recetas y Productos para todos</h4>
	    <p class="primer-parrafo">
	        ¿Te gustaría disfrutar de la cocina sin preocuparte por las restricciones alimentarias? ¿Quieres encontrar recetas y productos que se adapten a tus necesidades y preferencias?</p>
			
		<h3>¡Te invitamos a conocer .Life! Un espacio creado para ti</h3>
			        
	    <p>En .Life podrás acceder a una gran variedad de opciones gastronómicas que respetan tu estilo de vida, ya sea gluten free, sin lactosa, vegano, o cualquier otro. Además, podrás compartir tus propias recetas, productos y experiencias con una comunidad de personas que te comprenden y apoyan. No esperes más y únete a .Life, el lugar donde la cocina es para todos.
	    </p>
	</section>
	
    <!-- SEGUNDO CARRUSEL -->
	<section class="segundo-carrusel">
	    <h2>Recetas Destacadas</h2>
	    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" data-bs-theme="dark">
	        <div class="carousel-inner">
	            <!-- Conjunto 1 -->
				<div class="carousel-item active">
				    <div class="cards-wrapper">
				        <!-- Tarjeta 1 -->
				        <div class="card" style="width: 30%;">
				            <img src="public/img/chocolate-bonbons.jpg" class="card-img-top" alt="Chocolate Bonbons">
				            <div class="card-body">
				                <h5 class="card-title">Bombones Veganos</h5>
				                <p class="card-text">Deliciosos bombones de chocolate con aceite de coco y cacao en polvo.</p>
				                <a href="#" class="btn bg-custom text-white">Ver Receta</a>
				            </div>
				        </div>
				        
				        <!-- Tarjeta 2 -->
				        <div class="card" style="width: 30%;">
				            <img src="public/img/mini-tartas.jpg" class="card-img-top" alt="Mini Tartas">
				            <div class="card-body">
				                <h5 class="card-title">Mini Tartas Sin Gluten</h5>
				                <p class="card-text">Deliciosas mini tartas para disfrutar sin gluten con harina de arroz.</p>
				                <a href="#" class="btn bg-custom text-white">Ver Receta</a>
				            </div>
				        </div>
				        
				        <!-- Tarjeta 3 -->
				        <div class="card" style="width: 30%;">
				            <img src="public/img/cheesecake.jpg" class="card-img-top" alt="Cheesecake Frutos Rojos">
				            <div class="card-body">
				                <h5 class="card-title">Cheesecake Vegano de Frutos Rojos</h5>
				                <p class="card-text">Un cheesecake vegano suave y cremoso, sin lácteos ni ingredientes de origen animal.</p>
				                <a href="#" class="btn bg-custom text-white">Ver Receta</a>
				            </div>
				        </div>
				    </div>
				</div>
	            
	            <!-- Conjunto 2 -->
	            <div class="carousel-item">
	                <div class="cards-wrapper">
	                    <!-- Tarjeta 4 -->
	                    <div class="card" style="width: 30%;">
	                        <img src="public/img/ensalada.jpg" class="card-img-top" alt="Ensalada Caprese">
	                        <div class="card-body">
	                            <h5 class="card-title">Ensalada Caprese</h5>
	                            <p class="card-text">Tomates, mozzarella fresca y albahaca se combinan en esta ensalada clásica.</p>
	                            <a href="#" class="btn bg-custom text-white">Ver Receta</a>
	                        </div>
	                    </div>
	                    
	                    <!-- Tarjeta 5 -->
	                    <div class="card" style="width: 30%;">
	                        <img src="public/img/sopa.jpg" class="card-img-top" alt="Sopa Calabaza">
	                        <div class="card-body">
	                            <h5 class="card-title">Sopa de Calabaza</h5>
	                            <p class="card-text">Calabaza asada, caldo de verduras y crema se unen en esta reconfortante sopa.</p>
	                            <a href="#" class="btn bg-custom text-white">Ver Receta</a>
	                        </div>
	                    </div>
	                    
	                    <!-- Tarjeta 6 -->
	                    <div class="card" style="width: 30%;">
	                        <img src="public/img/rollitos.jpg" class="card-img-top" alt="Rollitos Primavera">
	                        <div class="card-body">
	                            <h5 class="card-title">Rollitos de Primavera</h5>
	                            <p class="card-text">Vegetales frescos envueltos en papel de arroz y servidos con una salsa de cacahuate y jengibre.</p>
	                            <a href="#" class="btn bg-custom text-white">Ver Receta</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
	            <!-- Conjunto 3 -->
	            <div class="carousel-item">
	                <div class="cards-wrapper">
	                    <!-- Tarjeta 7 -->
	                    <div class="card" style="width: 30%;">
	                        <img src="public/img/bowlbatata.jpg" class="card-img-top" alt="Bowl Batata">
	                        <div class="card-body">
	                            <h5 class="card-title">Bowl de Batata y Garbanzos</h5>
	                            <p class="card-text">Batatas asadas, garbanzos crujientes y espinacas frescas se combinan en este bowl nutritivo.</p>
	                            <a href="#" class="btn bg-custom text-white">Ver Receta</a>
	                        </div>
	                    </div>
	                    
	                    <!-- Tarjeta 8 -->
	                    <div class="card" style="width: 30%;">
	                        <img src="public/img/currylentejas.jpg" class="card-img-top" alt="Curry Lentejas">
	                        <div class="card-body">
	                            <h5 class="card-title">Curry de Lentejas</h5>
	                            <p class="card-text">Lentejas cocinadas a fuego lento en una mezcla de especias aromáticas y leche de coco cremosa.</p>
	                            <a href="#" class="btn bg-custom text-white">Ver Receta</a>
	                        </div>
	                    </div>
	                    
	                    <!-- Tarjeta 9 -->
	                    <div class="card" style="width: 30%;">
	                        <img src="public/img/hamburguesaporotos.jpg" class="card-img-top" alt="Hanburguesa Porotos">
	                        <div class="card-body">
	                            <h5 class="card-title">Hamburguesas de Frijoles Negros</h5>
	                            <p class="card-text">Hamburguesas hechas con frijoles negros, maíz y avena, sazonadas con especias.</p>
	                            <a href="#" class="btn bg-custom text-white">Ver Receta</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        
	        <button class="carousel-control-prev" type="button">
	            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	            <span class="visually-hidden">Previous</span>
	        </button>
	        
	        <button class="carousel-control-next" type="button">
	            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	            <span class="visually-hidden">Next</span>
	        </button>
	    </div>
	</section>

	
 	<!-- Footer -->
	<footer class="bg-dark text-white py-5">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-4 mb-4 text-center text-md-left justify-content-between">
	                <h5>Contacto</h5>
	                <p>Teléfono: +56 123 456 789</p>
	                <p>Email: info@lifediet.com</p>
	                <p>Dirección: Caupolicán #263, Concepción, Región del Biobío, Chile</p>
	                <p>Horario de atención: Lunes a Viernes, 9am - 5pm</p>
	            </div>
	            <div class="col-md-4 mb-4 text-center text-md-left justify-content-between">
	                <h5>Quiénes Somos</h5>
	                <p>Descubre más sobre <a href="/quienes_somos" class="text-white">quiénes somos</a>.</p>
	                <p>Explora nuestra <a href="/vision" class="text-white">visión</a> y <a href="/mision" class="text-white">misión</a>.</p>
	            </div>
	            <div class="col-md-4 mb-4 text-center text-md-left justify-content-between">
	                <h5>Redes Sociales</h5>
	                <p>
	                    <a href="https://facebook.com/tuempresa" target="_blank" class="text-white">
	                        <img src="public/img/facebook_logo.png" alt="Facebook" width="30" height="30"> BETTERLIFECHILE
	                    </a>
	                </p>
	                <p>
	                    <a href="https://twitter.com/tuempresa" target="_blank" class="text-white">
	                        <img src="public/img/twitter_logo.png" alt="Twitter" width="30" height="30"> BETTERLIFECHILE
	                    </a>
	                </p>
	                <p>
	                    <a href="https://instagram.com/clubbetterlifetv" target="_blank" class="text-white">
	                        <img src="public/img/instagram_logo.png" alt="Instagram" width="30" height="30"> BETTERLIFECHILE
	                    </a>
	                </p>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col text-center">
	                <a href="/quienes_somos" class="text-white mx-2">Quiénes Somos</a> |
	                <a href="/ubicacion" class="text-white mx-2">Ubicación</a> |
	                <a href="/equipo" class="text-white mx-2">Nuestro Equipo</a>
	            </div>
	        </div>
	    </div>
	</footer>
 	<script src="js/sidebar.js"></script>
    <script src="js/index.js"></script>
</body>
</html>
