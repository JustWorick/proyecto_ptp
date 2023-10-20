<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix = "c" uri =
"http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
     integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
     <script src="https://kit.fontawesome.com/c6f3fdb2bb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/style/index.css" />
   	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gabarito&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/c6f3fdb2bb.js" crossorigin="anonymous"></script>
    <title>Calculadora de IMC</title>
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
    
    <h1>Calculadora de IMC</h1>
    <form action="result.jsp" method="post">
		Género:
		<select name="genero">
		    <option value="masculino">Masculino</option>
		    <option value="femenino">Femenino</option>
		    <option value="otro">Otro/a</option>
		    <option value="no_especificado">No quiero decirlo</option>
		</select><br>
        Edad: <input type="text" name="edad"><br>
        Peso (kg): <input type="text" name="peso"><br>
        Estatura (cm): <input type="text" name="estatura"><br>
        
        <h2>Condiciones Especiales:</h2>
        <input type="checkbox" name="condiciones[]" value="veganos"> Veganos<br>
        <input type="checkbox" name="condiciones[]" value="vegetarianos"> Vegetarianos<br>
        <input type="checkbox" name="condiciones[]" value="lactosa"> Intolerantes a la lactosa<br>
        <input type="checkbox" name="condiciones[]" value="celiacos"> Celíacos<br>
        <input type="checkbox" name="condiciones[]" value="alergias"> Alergias alimentarias<br>
        <input type="checkbox" name="condiciones[]" value="diabeticos"> Diabéticos<br>
        <input type="checkbox" name="condiciones[]" value="hipertensos"> Hipertensos<br>
        <input type="checkbox" name="condiciones[]" value="enfermedad_renal"> Enfermedad renal<br>
        <input type="checkbox" name="condiciones[]" value="alergias_mariscos"> Alergias a los mariscos<br>
        <input type="checkbox" name="condiciones[]" value="fenilcetonuria"> Fenilcetonuria (PKU)<br>
        <input type="checkbox" name="condiciones[]" value="trastornos_alimentacion"> Trastornos de la alimentación<br>
        <input type="checkbox" name="condiciones[]" value="enfermedades_intestino"> Enfermedades inflamatorias del intestino (EII)<br>
        
        <br>
        <input type="submit" value="Calcular">
    </form>
</body>
</html>
