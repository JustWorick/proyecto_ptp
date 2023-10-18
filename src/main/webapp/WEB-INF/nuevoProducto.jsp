<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix = "c" uri =
"http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ page isErrorPage="true" %>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gabarito&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style/nuevaReceta.css">
<script src="https://kit.fontawesome.com/c6f3fdb2bb.js" crossorigin="anonymous"></script>

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
                	<a href="#" class="text-white text-decoration-none" id="perfil" style=" margin-right: 35px; ">
                	<i class="fa-regular fa-user fa-2xl" style="color: #e0901f;margin-right: 10px;">
                	</i>${usuarioEnSesion.nickname}</a>
		     	 </div>
		      </c:if>
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



