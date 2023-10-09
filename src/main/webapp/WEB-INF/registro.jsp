<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Registro</title>
</head>
<body>
	<div class="container">
		<a href="/" class="btn btn-primary">Volver</a>
	
		<form:form action="/registro" method="post" modelAttribute="usuario">
			<div>
				<form:label path="nickname">Elige un Nickname</form:label>
				<form:input path="nickname" class="form-control"/>
				<form:errors path="nickname" class="text-danger"/>
			</div>
			<div>
				<form:label path="nombre">Nombre</form:label>
				<form:input path="nombre" class="form-control"/>
				<form:errors path="nombre" class="text-danger"/>
			</div>
			<div>
				<form:label path="apellido">Apellido</form:label>
				<form:input path="apellido" class="form-control"/>
				<form:errors path="apellido" class="text-danger"/>
			</div>
			<div>
				<form:label path="email">Email</form:label>
				<form:input path="email" class="form-control"/>
				<form:errors path="email" class="text-danger"/>
			</div>
			<div>
				<form:label path="password">Contraseña</form:label>
				<form:password path="password" class="form-control"/>
				<form:errors path="password" class="text-danger"/>
			</div>
			<div>
				<form:label path="confirmacion">Confirma la Contraseña</form:label>
				<form:password path="confirmacion" class="form-control"/>
				<form:errors path="confirmacion" class="text-danger"/>
			</div>
			<input type="submit" value="Registrarme" class="btn btn-success">
		</form:form>
		
		<div>
			<p>¿Ya tienes una cuenta? <a href="/login">Inicia Sesion aqui!</a></p>
		</div>
	</div>
</body>
</html>