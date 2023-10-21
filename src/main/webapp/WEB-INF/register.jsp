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
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@300;600&display=swap" rel="stylesheet"/>
    <script src="https://kit.fontawesome.com/c6f3fdb2bb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/style/login.css" />
    <title>Life | Registro</title>
  </head>
  <body class="bg-dark">
    <section>
      <div class="row g-0">
        <div class="col-lg-7 d-none d-lg-block">
          <div id="carouselExampleCaptions" class="carousel slide">
            <!--Carrusel-->
            <div class="carousel-indicators">
              <button
                type="button"
                data-bs-target="#carouselExampleCaptions"
                data-bs-slide-to="0"
                class="active"
                aria-current="true"
                aria-label="Slide 1"
              ></button>
              <button
                type="button"
                data-bs-target="#carouselExampleCaptions"
                data-bs-slide-to="1"
                aria-label="Slide 2"
              ></button>
              <button
                type="button"
                data-bs-target="#carouselExampleCaptions"
                data-bs-slide-to="2"
                aria-label="Slide 3"
              ></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active img-1 min-vh-100">
                <img
                  src="/public/img/fotoCarruselLogin3.jpg"
                  class="d-block w-100"
                  alt="..."
                />
                <div class="carousel-caption d-none d-md-block">
                  <h5></h5>
                  <p></p>
                </div>
              </div>
              <div class="carousel-item img-2">
                <img
                  src="/public/img/fotoCarruselLogin2"
                  class="d-block w-100"
                  alt="..."
                />
                <div class="carousel-caption d-none d-md-block">
                  <h5></h5>
                  <p></p>
                </div>
              </div>
              <div class="carousel-item img-3">
                <img
                  src="/public/img/fotoCarruselLogin1"
                  class="d-block w-100"
                  alt="..."
                />
                <div class="carousel-caption d-none d-md-block">
                  <h5></h5>
                  <p></p>
                </div>
              </div>
            </div>
            <button
              class="carousel-control-prev"
              type="button"
              data-bs-target="#carouselExampleCaptions"
              data-bs-slide="prev"
            >
              <span
                class="carousel-control-prev-icon"
                aria-hidden="true"
              ></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button
              class="carousel-control-next"
              type="button"
              data-bs-target="#carouselExampleCaptions"
              data-bs-slide="next"
            >
              <span
                class="carousel-control-next-icon"
                aria-hidden="true"
              ></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        </div>
        <div class="col-lg-5 d-flex flex-column justify-content-around">
          <div class="px-lg-5 pt-lg-4 pb-lg-3 p-4 mb-0">
            
            <a class="navbar-brand" href="/">
                <img src="/public/img/logo2.png" alt="logoLife" width="200px" />
                <!--Cambiar Logo-->
            </a>
            
            <!--Cambiar Logo-->
          </div>
          <div class="px-lg-5 py-lg-4 p-4">
            <h1 class="fw-bold mb-1">Regístrate en .Life</h1>
            
            
            
            <!--								Register												-->
            
            <div class="registro">
	            <form:form action="/registro" method="post" modelAttribute="usuario" class="mb-5">
				<div class="mb-4">
					<form:label path="nickname" class="form-label fw-bold">Elige un Nickname</form:label>
					<form:input path="nickname" class="form-control bg-dark-x border-0" placeholder="Ingresa tu nombre de usuario"/>
					<form:errors path="nickname" class="text-danger"/>
				</div>
				<div class="mb-4">
					<form:label path="nombre" class="form-label fw-bold">Nombre</form:label>
					<form:input path="nombre" class="form-control bg-dark-x border-0" placeholder="Ingresa tu nombre"/>
					<form:errors path="nombre" class="text-danger"/>
				</div>
				<div class="mb-4">
					<form:label path="apellido" class="form-label fw-bold">Apellido</form:label>
					<form:input path="apellido" class="form-control bg-dark-x border-0"/>
					<form:errors path="apellido" class="text-danger"/>
				</div>
				<div class="mb-4">
					<form:label path="email" class="form-label fw-bold">Email</form:label>
					<form:input path="email" class="form-control bg-dark-x border-0" aria-describedby="emailHelp"/>
					<form:errors path="email" class="text-danger"/>
				</div>
				<div class="mb-4">
					<form:label path="password" class="form-label fw-bold">Contraseña</form:label>
					<form:password path="password" class="form-control bg-dark-x border-0"/>
					<form:errors path="password" class="text-danger"/>
				</div>
				<div class="mb-4">
					<form:label path="confirmacion" class="form-label fw-bold">Confirma la Contraseña</form:label>
					<form:password path="confirmacion" class="form-control bg-dark-x border-0"/>
					<form:errors path="confirmacion" class="text-danger"/>
				</div>
				<input type="submit" value="Registrarme" class="btn btn-warning w-100 mb-0">
			</form:form>
		</div>
		
		<!-- 
            <form class="mb-5">
              <div class="mb-4">
                <label for="exampleInputNick" class="form-label fw-bold"
                  >Nombre de usuario</label
                >
                <input
                  type="text"
                  class="form-control bg-dark-x border-0"
                  placeholder="Ingresa tu nombre de usuario"
                  id="exampleInputNick"
                />
              </div>
              <div class="mb-4">
                <label for="exampleInputName" class="form-label fw-bold"
                  >Nombre</label
                >
                <input
                  type="text"
                  class="form-control bg-dark-x border-0"
                  placeholder="Ingresa tu nombre"
                  id="exampleInputName"
                />
              </div>
              <div class="mb-4">
                <label for="exampleInputLastName" class="form-label fw-bold"
                  >Apellido</label
                >
                <input
                  type="text"
                  class="form-control bg-dark-x border-0"
                  placeholder="Ingresa tu apellido"
                  id="exampleInputLastName"
                />
              </div>
              <div class="mb-4">
                <label for="exampleInputEmail1" class="form-label fw-bold"
                  >Correo Electronico</label
                >
                <input
                  type="email"
                  class="form-control bg-dark-x border-0"
                  placeholder="Ingresa tu email"
                  id="exampleInputEmail1"
                  aria-describedby="emailHelp"
                />
              </div>
              <div class="mb-4">
                <label for="exampleInputPassword" class="form-label fw-bold"
                  >Contraseña</label
                >
                <input
                  type="password"
                  class="form-control bg-dark-x border-0 mb-2"
                  placeholder="Ingresa tu contraseña"
                  id="exampleInputPassword"
                />
              </div>
              <div class="mb-4">
                <label for="exampleInputConfPassword" class="form-label fw-bold"
                  >Confirmar contraseña</label
                >
                <input
                  type="password"
                  class="form-control bg-dark-x border-0 mb-2"
                  placeholder="Ingresa tu contraseña"
                  id="exampleInputConfPassword"
                />
              </div>
              <button type="submit" class="btn btn-primary w-100 mb-0">
                Registrarme
              </button>
            </form>
          </div>
           -->
          <div class="text-center px-lg-5 pt-lg-3 pb-lg-4 p-4">
            <p class="d-inline-block mb-0">¿Ya tienes una cuenta creada?</p>
            <a href="/login" class="text-light fw-bold text-decoration-none">Ingresa Aqui</a>
          </div>
        </div>
      </div>
    </section>
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
      integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
      integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
