<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Bienvenida</title>
  <link rel="stylesheet" href="stiles/Styles.css"/>
</head>
<body>

    
<nav class="navbar" id="mainNavbar">
  <a href="index.jsp" class="navbar__logo">
    <span class="navbar__logo-name">OPTIC<span>A</span>FÉ</span>
    <span class="navbar__logo-sub">Café rápido, gestión inteligente</span>
  </a>
  <ul class="navbar__links">
    <li><a href="acceder.jsp">ACCEDER</a></li>
    <li><a href="inicio.jsp">INICIO DE SESIÓN</a></li>
    <li><a href="bienvenida.jsp" class="active">BIENVENIDA</a></li>
    <li><a href="servicios.jsp">SERVICIOS</a></li>
    <li><a href="categorias.jsp">CATEGORÍAS</a></li>
  </ul>
</nav>


<main class="page-content">
  <section class="welcome-page">

    <%-- Fondo: coloca welcome-bg.jpg en web/images/ (1920x1080px)
         Tema: múltiples tazas de café vista superior sobre madera oscura --%>
    <div class="welcome-page__bg"></div>

    <div class="welcome-page__content">
      <div class="welcome-logo fade-up">
        <span class="letter-outline">O</span>PTICAF&#201;
      </div>
      <p class="welcome-subtitle fade-up fade-up-delay-1">
        Café rápido, gestión inteligente
      </p>
      <p class="welcome-user fade-up fade-up-delay-2" id="welcomeUser">
        BIENVENIDO
      </p>
      <div style="margin-top:40px;" class="fade-up fade-up-delay-3">
        <a href="servicios.jsp" class="btn btn-gold">VER SERVICIOS</a>
      </div>
    </div>

  </section>
</main>


<footer class="site-footer">
  <p>Proyecto JavaWeb &mdash; <span>JuanCruz - Andrés Castro</span></p>
</footer>

<script>
  (function(){
    var u = sessionStorage.getItem('opticafe_usuario');
    var el = document.getElementById('welcomeUser');
    if(u && el) el.textContent = 'BIENVENIDO ' + u.toUpperCase();

    var nav = document.getElementById('mainNavbar');
    window.addEventListener('scroll', function(){
      nav.classList.toggle('scrolled', window.scrollY > 40);
    });
  })();
</script>

</body>
</html>
