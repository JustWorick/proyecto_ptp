<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.CodingDojo.Abraham.Modelos.Producto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nuevo Producto</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/style/index.css" />
<link rel="stylesheet" type="text/css" href="style/nuevaReceta.css">

<!-- 


    Producto producto = (Producto) request.getAttribute("producto");
    double precio = producto.getPrecio();

    NumberFormat formatoDolar = NumberFormat.getCurrencyInstance(Locale.US);

    String precioFormateado = formatoDolar.format(new BigDecimal(precio));

    request.setAttribute("precioFormateado", precioFormateado);

 -->


</head>
<body>
    <!--Nav-->
    <nav class="navbar navbar-expand-lg navbar-dark p-md-3 bg-transparent">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="/public/img/logo.png" alt="logoLife" width="120px" />
            </a>
            <button class="navbar-toggler shadow-none border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-flex flex-column p-4 flex-lg-row p-lg-0" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contacto</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Productos</a>
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
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Recetas</a>
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
        <h1>Nuevo Producto</h1>
        <form:form action="/nuevoProducto" method="post" modelAttribute="producto" enctype="multipart/form-data">
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
			    <form:label path="precio">Precio</form:label>
			    <form:input path="precio" class="form-control" type="number" step="0.01"/>
			    <form:errors path="precio" class="text-danger"/>   
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
            <div>
			    <form:label path="informacionNutricional">Información Nutricional</form:label>
			    <form:textarea path="informacionNutricional" class="form-control" type="text"/>
			    <form:errors path="informacionNutricional" class="text-danger"/>   
			</div>

            
            <!-- 
                AQUÍ HAY QUE AÑADIR LOS ATRIBUTOS ESPECÍFICOS DEL PRODUCTO
             -->
            
            <form:hidden path="creadorProducto" value="${usuarioEnSesion.id}"/>
            <input type="submit" class="btn btn-success mt-3" value="Publicar"/>
        </form:form>
    </div>
    <script src="js/nuevoProducto.js"></script>
</body>
</html>


