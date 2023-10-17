<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crear Receta</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/style/index.css" />
<link rel="stylesheet" href="/style/nuevaReceta.css">
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
				<input type="file" name="imagen" class="form-control">     
			</div>
			<div>
				<select name="etiqueta">
					<c:forEach items="${nombreEtiquetas}" var="etiName">
						<option value="${etiName}">${etiName}</option>
					</c:forEach>
				</select>
			</div>
            <!-- 
            
            	AQUI HAY QUE AÑADIR LOS INGREDIENTES
            
             -->
			
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
	<script src="js/nuevaReceta.js"></script>
</body>
</html>