<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/style/index.css" />
<meta charset="ISO-8859-1">
<title>Mis Productos</title>
</head>
<body>
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
          <div class="d-flex flex-column flex-lg-row justify-content-center align-items-center gap-3">
            <a href="/login" class="text-white text-decoration-none">Login</a>
            <a href="/registro" class="text-black text-decoration-none px-3 py-1 rounded-4" style="background-color: #eefb03"> Sign Up </a>
          </div>
        </div>
      </div>
    </nav>

	<div class="contenido">
        <header class="d-flex justify-content-between align-items-center">
            <h1>Mis Productos</h1>
        </header>
        <p>Aquí podrás encontrar todos los productos que haz publicado</p>    
        <form action="/busqueda" method="post" class="row">
            <div class="col-7">
                <input type="text" name="palabra" class="form-control" placeholder="busca entre tus productos">
                </div>	
                <input type="submit" value="Buscar" class="btn btn-primary col-1">
        </form>
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
            
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Valoración</th>
                    <th>fotos</th>
                    <th>Etiqueta</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${productos}" var="producto">
                    <tr>
                        <td><a href="/producto/${producto.id}">${producto.nombre}</a></td>
                        <td>${producto.valoracionFinal}</td>
                        <td>
                        	<c:if test="${not empty producto.imagenesRec}">
								<c:forEach items="${producto.imagenesRec}" var="ima">
                        			<img alt="..." src="${ima.url}">
                        		</c:forEach>
							</c:if>
                        </td>
                        <td>
                        	<ul>
	                        	<c:if test="${not empty producto.etiquetas}">
	                        		<c:forEach items="${producto.etiquetas}" var="eti">
	                        			<li>${eti.nombre}</li>
	                        		</c:forEach>
	                        	</c:if>
                        	</ul>
                        </td>
                        <td>
                            <!--Editar y eliminar un producto solo si es el autor-->
							<c:if test="${producto.creador.id == usuarioEnSesion.id}">
							<!-- si es autor entonces se muestran los botones -->
								<a href="/editar/producto/${producto.id}" class="btn btn-warning">Editar</a>
							
								<form action="/borrar/producto/${producto.id}" method="post">
									<input type="hidden" name="_method" value="delete">
									<input class="btn btn-danger" type="submit" value="Delete Receta">
								</form>
								<form action="/borrar/producto/imagenes/${producto.id}" method="post">
									<input type="hidden" name="_method" value="delete">
									<input class="btn btn-danger" type="submit" value="Delete Imagenes">
								</form>
								
							</c:if>
						</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
	</div>
</body>
</html>
</body>
</html>