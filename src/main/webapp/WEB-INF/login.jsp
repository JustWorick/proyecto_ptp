<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@300;600&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/c6f3fdb2bb.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="/src/main/resources/static/style/login.css" />
    <title>Life | Login</title>
  </head>
  <body class="bg-dark">
    <section>
      <div class="row g-0">
        <div class="col-lg-7 d-none d-lg-block">
          <div id="carouselExampleCaptions" class="carousel slide"> <!--Carrusel-->
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
                  src="/src/main/resources/static/public/img/fotoCarruselLogin3.jpg"
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
                  src="/src/main/resources/static/public/img/fotoCarruselLogin2"
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
                  src="/src/main/resources/static/public/img/fotoCarruselLogin1"
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
            <img
              src="/src/main/resources/static/public/img/logo.png" 
              alt="logoLife"
              class="img- mb-0"
              width="100px"
            /> <!--Cambiar Logo-->
          </div>
          <div class="px-lg-5 py-lg-4 p-4">
            <h1 class="fw-bold mb-1">Inicia Sesion en Life</h1> <!--Login-->
            <form class="mb-5">
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
                <label for="exampleInputPassword1" class="form-label fw-bold"
                  >Contraseña</label
                >
                <input
                  type="password"
                  class="form-control bg-dark-x border-0 mb-2"
                  placeholder="Ingresa tu contraseña"
                  id="exampleInputPassword1"
                />
                <a
                  id="emailHelp"
                  class="form-text text-muted text-decoration-none"
                  href="#"
                  >¿Olvidaste tu contraseña?</a
                >
              </div>
              <button type="submit" class="btn btn-primary w-100 mb-0">
                Ingresar
              </button>
            </form>

            <p class="fw-bold text-center text-muted mb-3">
              O inicia sesion con
            </p>
            <div class="d-flex justify-content-around">
              <button
                type="submit"
                class="btn btn-outline-light flex-grow-1 me-2"
              >
                <i class="fa-brands fa-google lead me-2"></i>Google
              </button>
              <button
                type="submit"
                class="btn btn-outline-light flex-grow-1 ms-2"
              >
                <i class="fa-brands fa-facebook lead me-2"></i>Facebook
              </button>
            </div>
          </div>
          <div class="text-center px-lg-5 pt-lg-3 pb-lg-4 p-4">
            <p class="d-inline-block mb-0">¿No te has creado una cuenta aun?</p>
            <a href="#" class="text-light fw-bold text-decoration-none">
              Crea tu cuenta</a
            >
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
