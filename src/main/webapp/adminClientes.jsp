<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("usuarioLogueado") == null) {
        response.sendRedirect(request.getContextPath() + "/acceder.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Administración de Clientes</title>
  <link rel="stylesheet" href="stiles/Styles.css"/>
</head>
<body>
<nav class="navbar scrolled" id="mainNavbar">
  <a href="index.jsp" class="navbar__logo">
    <span class="navbar__logo-name">OPTIC<span>A</span>FÉ</span>
    <span class="navbar__logo-sub">Café rápido, gestión inteligente</span>
  </a>
  <ul class="navbar__links">
    <li><a href="acceder.jsp">ACCEDER</a></li>
    <li><a href="inicio.jsp">INICIO DE SESIÓN</a></li>
    <li><a href="bienvenida.jsp">BIENVENIDA</a></li>
    <li><a href="servicios.jsp">SERVICIOS</a></li>
    <li><a href="categorias.jsp">CATEGORÍAS</a></li>
    <li><a href="logout" style="color:#e74c3c;">CERRAR SESIÓN</a></li>
  </ul>
</nav>

<main class="page-content">
  <div class="admin-menu-page">

    <div class="admin-menu-header fade-up">
      <div class="admin-menu-header__icon">
        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path d="M12 12c2.7 0 4.8-2.1 4.8-4.8S14.7 2.4 12 2.4 7.2 4.5 7.2 7.2 9.3 12 12 12zm0 2.4c-3.2 0-9.6 1.6-9.6 4.8v2.4h19.2v-2.4c0-3.2-6.4-4.8-9.6-4.8z"/>
        </svg>
      </div>
      <div class="admin-menu-header__divider"></div>
      <div class="admin-menu-header__info">
        <h2>ADMINISTRACIÓN DE CLIENTES</h2>
        <p>Esta área es solo para personal autorizado</p>
      </div>
    </div>

    <nav class="admin-menu-nav fade-up fade-up-delay-1">
      <a href="agregarCliente">Agregar Cliente</a>
      <a href="eliminarCliente">Eliminar Cliente</a>
      <a href="editarCliente">Editar Cliente</a>
      <a href="listarClientes">Listar Clientes</a>
      <a href="consultarCliente">Filtrar/Consultar</a>
    </nav>

  </div>
</main>

<footer class="site-footer">
  <p>Proyecto JavaWeb &mdash; <span>JuanCruz - Andrés Castro</span></p>
   <p>Proyecto Final<span>Hicimos esta página tomando café :)</span></p>
  <p>Proyecto Final<span>Universidad Mariana</span></p>
  <p>Proyecto Final<span>APO III</span></p>
</footer>
<a href="servicios.jsp" class="admin-back">Volver</a>

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
