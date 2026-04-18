<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- ── Protección de sesión: redirige al login si no hay sesión activa ── --%>
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
  <title>OptiCafé — Administración de Productos</title>
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
        <img src="images/cafeteria.jpg" alt="Productos"
             onerror="this.style.display='none'"/>
      </div>
      <div class="admin-menu-header__divider"></div>
      <div class="admin-menu-header__info">
        <h2>ADMINISTRACIÓN DE PRODUCTOS</h2>
        <p>Esta área es solo para personal autorizado</p>
      </div>
    </div>

    <nav class="admin-menu-nav fade-up fade-up-delay-1">
      <a href="agregarProducto">Agregar Producto</a>
      <a href="eliminarProducto">Eliminar Producto</a>
      <a href="editarProducto">Editar Producto</a>
      <a href="listarProductos">Listar Productos</a>
      <a href="consultarProducto">Filtrar/Consultar</a>
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
