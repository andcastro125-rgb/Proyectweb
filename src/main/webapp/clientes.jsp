<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Registro de Cliente</title>
  <link rel="stylesheet" href="stiles/Styles.css"/>
</head>
<body>

<nav class="navbar scrolled" id="mainNavbar">
  <a href="index.jsp" class="navbar__logo">
    <span class="navbar__logo-name">OPTIC<span>A</span>FÉ</span>
    <span class="navbar__logo-sub">Café rápido, gestión inteligente</span>
  </a>
  <ul class="navbar__links">
    <li><a href="index.jsp">INICIO</a></li>
    <li><a href="clientes.jsp" class="active">REGISTRO</a></li>
    <li><a href="servicios.jsp">SERVICIOS</a></li>
    <li><a href="acceder.jsp">ACCEDER</a></li>
  </ul>
</nav>

<main class="page-content">
  <section class="login-page">
    <div class="login-page__image"></div>

    <div class="login-page__form-area">
      <h1 class="fade-up">REGÍSTRATE</h1>
      <p class="fade-up fade-up-delay-1" style="color:#aaa; margin-bottom:20px; font-size:0.9rem;">
        Sin iniciar sesión puedes registrarte como cliente y hacer tu pedido.
      </p>

   
      <%
        String mensaje = (String) request.getAttribute("mensaje");
        String tipo    = (String) request.getAttribute("tipo");
        Boolean registrado = (Boolean) request.getAttribute("registrado");
        if (mensaje != null) {
      %>
        <p class="fade-up" style="color:<%= "exito".equals(tipo) ? "#2ecc71" : "#e74c3c" %>;
           font-weight:bold; margin-bottom:14px;">
          <%= mensaje %>
          <a href="eliminarCliente.jsp"></a>
        </p>
      <% } %>

   
      <% if (registrado == null || !registrado) { %>
      <form method="post" action="registroCliente" style="width:100%;">

        <div class="form-group fade-up fade-up-delay-1">
          <input type="text" name="nombre" placeholder="TU NOMBRE COMPLETO"
                 autocomplete="off" required/>
        </div>

        <div class="form-group fade-up fade-up-delay-2">
          <input type="text" name="cedula" placeholder="NÚMERO DE CÉDULA"
                 autocomplete="off" required/>
        </div>

        <button type="submit"
                class="btn btn-gold fade-up fade-up-delay-3"
                style="border:none; cursor:pointer; width:100%; margin-top:8px;">
          REGISTRARME
        </button>

      </form>
      <% } else { %>
        
        <div class="fade-up fade-up-delay-2" style="margin-top:20px; text-align:center;">
          <a href="pedido" class="btn btn-gold" style="display:inline-block; margin-top:10px;">
            IR A MI PEDIDO →
          </a>
        </div>
      <% } %>

    </div>
  </section>
</main>

<footer class="site-footer">
  <p>Proyecto JavaWeb &mdash; <span>JuanCruz - Andrés Castro</span></p>
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
