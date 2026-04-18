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


<nav class="navbar scrolled" id="mainNavbar">
  <a href="index.jsp" class="navbar__logo">
    <span class="navbar__logo-name">OPTIC<span>A</span>FÉ</span>
    <span class="navbar__logo-sub">Café rápido, gestión inteligente</span>
  </a>
  <ul class="navbar__links">
    <li><a href="acceder.jsp"    class="active">ACCEDER</a></li>
    <li><a href="bienvenida.jsp">BIENVENIDA</a></li>
    <li><a href="servicios.jsp">SERVICIOS</a></li>
    <li><a href="categorias.jsp">CATEGORÍAS</a></li>
  </ul>
</nav>

 
<main class="page-content">
  <section class="login-page">

    <div class="login-page__image"></div>

    <div class="login-page__form-area">
      <h1 class="fade-up">INICIO DE SESIÓN</h1>

      
      <% String errorLogin = (String) request.getAttribute("errorLogin");
         if (errorLogin != null) { %>
        <p class="fade-up" style="color:#e74c3c; font-weight:bold; margin-bottom:10px;">
          &#9888; <%= errorLogin %>
        </p>
      <% } %>

      
      <form method="post" action="login" style="width:100%;">

        <div class="form-group fade-up fade-up-delay-1">
          <input type="text"     id="nombre" name="nombre"
                 placeholder="USUARIO" autocomplete="off" required/>
        </div>

        <div class="form-group fade-up fade-up-delay-2">
          <input type="password" id="cedula" name="cedula"
                 placeholder="CONTRASEÑA" autocomplete="off" required/>
        </div>

        <button type="submit"
                class="btn btn-gold fade-up fade-up-delay-3"
                style="border:none; cursor:pointer; width:100%; margin-top:8px;">
          INICIAR
        </button>

      </form>

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


<footer class="site-footer">
  <p>Proyecto JavaWeb &mdash; <span>JuanCruz - Andrés Castro</span></p>
   <p>Proyecto Final<span>Hicimos esta página tomando café :)</span></p>
  <p>Proyecto Final<span>Universidad Mariana</span></p>
  <p>Proyecto Final<span>APO III</span></p>
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
