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
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark p-md-3 bg-transparent">
        <div class="container">
            <a class="navbar-brand" href="#">
            <img src="img/logo.png" alt="logoLife" width="120px" />
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
                    <a href="#" class="text-white text-decoration-none">Login</a>
                    <a
                    href="#"
                    class="text-black text-decoration-none px-3 py-1 rounded-4"
                    style="background-color: #eefb03;"
                    >Sign Up</a>
                </div>
            </div>
        </div>
    </nav>

	<div class="contenido">
        <header class="d-flex justify-content-between align-items-center">
            <h1>Recetas</h1>
        </header>
        <p>Aquí podrás encontrar miles de recetas sin gluten, sin lactosa, veganas y muchas otras opciones que se adapten a tu estilo de vida y alimentación</p>
        <form action="/busqueda" method="post" class="row">
            <div class="col-7">
                <input type="text" name="palabra" class="form-control" placeholder="por ejemplo, hotcakes sin gluten">
            </div>	
            <input type="submit" value="Buscar" class="btn btn-primary col-1">
        </form>
        
        <!-- verificar si el usuario está logeado --> 
		    <a href="/nuevaReceta" class="btn btn-primary">Crear Receta</a>
            
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Valoración</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${recetas}" var="receta">
                    <tr>
                        <td><a href="/show/${receta.id}">${receta.nombre}</a></td>
                        <td>${receta.valoracionFinal}</td>
                        <td><!-- opcion para guardar recetas en favoritas --></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
	</div>
</body>
</html>