<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Bienvenidos</title>
  <link rel="stylesheet" href="stiles/Styles.css"/>
</head>
<body>


<nav class="navbar" id="mainNavbar">
  <a href="index.jsp" class="navbar__logo">
    <span class="navbar__logo-name">OPTIC<span>A</span>FÉ</span>
    <span class="navbar__logo-sub">Café rápido, gestión inteligente</span>
  </a>
  <ul class="navbar__links">
    <li><a href="acceder.jsp"    id="nav-acceder"    class="active">ACCEDER</a></li>
    <li><a href="inicio.jsp"     id="nav-inicio">INICIO DE SESIÓN</a></li>
    <li><a href="bienvenida.jsp" id="nav-bienvenida">BIENVENIDA</a></li>
    <li><a href="servicios.jsp"  id="nav-servicios">SERVICIOS</a></li>
    <li><a href="categorias.jsp" id="nav-categorias">CATEGORÍAS</a></li>
  </ul>
</nav>


<main class="page-content">

  <section class="hero">

    <%-- Fondo: coloca hero-bg.jpg en web/images/ (1920x1080px recomendado) --%>
    <div class="hero__bg"></div>

    <div class="hero__content">

      <div class="hero__icon fade-up">
        <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"
             fill="none" stroke="white" stroke-width="2.5">
          <circle cx="50" cy="50" r="46"/>
          <circle cx="50" cy="50" r="38"/>
          <circle cx="50" cy="50" r="30"/>
          <circle cx="50" cy="50" r="22"/>
          <circle cx="50" cy="50" r="14"/>
          <circle cx="50" cy="50" r="6"/>
        </svg>
      </div>

      <h1 class="hero__title fade-up fade-up-delay-1">
        &#161; Bienvenidos a <strong>OptiCaf&#233;</strong> !
      </h1>

      <a href="acceder.jsp" class="btn btn-gold fade-up fade-up-delay-2">ACCEDER</a>

      <div class="slide-dots fade-up fade-up-delay-3">
        <span class="dot active"></span>
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
      </div>

    </div>
  </section>
</main>


<footer class="site-footer">
  <p>Proyecto JavaWeb &mdash; <span>JuanCruz-Andrés Castro</span></p>
</footer>

<script>
  (function(){
    var nav = document.getElementById('mainNavbar');
    window.addEventListener('scroll', function(){
      nav.classList.toggle('scrolled', window.scrollY > 40);
    });
  })();
</script>

</body>
</html>
