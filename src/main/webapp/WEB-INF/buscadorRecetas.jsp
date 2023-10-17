<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix = "c" uri =
"http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/style/index.css" />
    <link rel="stylesheet" type="text/css" href="style/recetas.css">
    <title>Life</title>
  </head>

  <body class="vh-100 overflow-hidden">
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
    <div class="container">
      <form action="/busqueda" method="post" class="row">
        <div class="col-7">
          <input
            type="text"
            name="palabra"
            class="form-control"
            placeholder=""
          />
        </div>
        <input type="submit" value="Buscar" class="btn btn-primary col-1" />
      </form>
      <ul>
        <c:forEach items="${todasLasEtiquetas}" var="eti">
          <li><a href="/recetas/etiquetas/${eti.id}">${eti.nombre}</a></li>
        </c:forEach>
      </ul>
      <ul>
        <c:forEach items="${todasRecetas}" var="rec">
        	<c:forEach items="${rec.imagenesRec}" var="img">
        		<li><img alt="..." src="${img.url}"></li>
        	</c:forEach>
          <li><a href="/receta/${rec.id}">${rec.nombre}</a></li>
        </c:forEach>
      </ul>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
  </body>
</html>