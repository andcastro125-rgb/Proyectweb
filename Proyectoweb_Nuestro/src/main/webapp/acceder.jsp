<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Acceder</title>
  <link rel="stylesheet" href="stiles/Styles.css"/>
</head>
<body>

<!-- ══════════ NAVBAR ══════════ -->
<nav class="navbar scrolled" id="mainNavbar">
  <a href="index.jsp" class="navbar__logo">
    <span class="navbar__logo-name">OPTIC<span>A</span>FÉ</span>
    <span class="navbar__logo-sub">Café rápido, gestión inteligente</span>
  </a>
  <ul class="navbar__links">
    <li><a href="acceder.jsp"    class="active">ACCEDER</a></li>
    <li><a href="inicio.jsp">INICIO DE SESIÓN</a></li>
    <li><a href="bienvenida.jsp">BIENVENIDA</a></li>
    <li><a href="servicios.jsp">SERVICIOS</a></li>
    <li><a href="categorias.jsp">CATEGORÍAS</a></li>
  </ul>
</nav>

<!-- ══════════ CONTENIDO ══════════ -->
<main class="page-content">
  <section class="login-page">

    <%-- Imagen lateral izquierda
         Coloca login-bg.jpg en web/images/ (900x1080px)
         Tema: portafiltros de espresso / granos de café --%>
    <div class="login-page__image"></div>

    <div class="login-page__form-area">
      <h1 class="fade-up">INICIO DE SESIÓN</h1>

      <div class="form-group fade-up fade-up-delay-1">
        <input type="text" id="nombre" name="nombre"
               placeholder="NOMBRE" autocomplete="off"/>
      </div>

      <div class="form-group fade-up fade-up-delay-2">
        <input type="password" id="cedula" name="cedula"
               placeholder="CÉDULA" autocomplete="off"/>
      </div>

      <a href="bienvenida.jsp"
         class="btn btn-gold fade-up fade-up-delay-3"
         onclick="guardarNombre()">
        INICIAR
      </a>

      <div class="slide-dots fade-up fade-up-delay-4">
        <span class="dot active"></span>
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
      </div>
    </div>

  </section>
</main>

<!-- ══════════ FOOTER ══════════ -->
<footer class="site-footer">
  <p>Proyecto JavaWeb &mdash; <span>JuanCruz - AndresCastro</span></p>
</footer>

<script>
  function guardarNombre(){
    var n = document.getElementById('nombre').value;
    if(n.trim()) sessionStorage.setItem('opticafe_usuario', n.trim());
  }
  (function(){
    var nav = document.getElementById('mainNavbar');
    window.addEventListener('scroll', function(){
      nav.classList.toggle('scrolled', window.scrollY > 40);
    });
  })();
</script>

</body>
</html>
