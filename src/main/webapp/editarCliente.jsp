<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Editar Cliente</title>
  <link rel="stylesheet" href="stiles/Styles.css"/>
</head>
<body>
<nav class="navbar scrolled" id="mainNavbar">
  <a href="index.jsp" class="navbar__logo"><span class="navbar__logo-name">OPTIC<span>A</span>FÉ</span><span class="navbar__logo-sub">Café rápido, gestión inteligente</span></a>
  <ul class="navbar__links">
    <li><a href="acceder.jsp">ACCEDER</a></li><li><a href="inicio.jsp">INICIO DE SESIÓN</a></li>
    <li><a href="bienvenida.jsp">BIENVENIDA</a></li><li><a href="servicios.jsp">SERVICIOS</a></li>
    <li><a href="categorias.jsp">CATEGORÍAS</a></li>
  </ul>
</nav>
<main class="page-content">
  <section class="crud-page">
    <div class="crud-page__splash"></div>
    <div class="crud-page__content">
      <div class="crud-page__header fade-up">
        <h1>EDITAR CLIENTE</h1>
        <p>Ingresa datos del cliente para editar su nombre</p>
      </div>
      <%
        String msg = (String) request.getAttribute("mensaje");
        String tipo = (String) request.getAttribute("tipo");
        if (msg != null) {
      %>
        <div class="crud-msg <%= tipo %>"><%= msg %></div>
      <% } %>
      <form method="post" action="editarCliente">
        <div class="crud-field fade-up fade-up-delay-1">
          <label for="cedula">Cédula:</label>
          <input type="text" id="cedula" name="cedula" required autocomplete="off"/>
        </div>
        <div class="crud-field fade-up fade-up-delay-2">
          <label for="nuevoNombre">Nuevo nombre:</label>
          <input type="text" id="nuevoNombre" name="nuevoNombre" required autocomplete="off"/>
        </div>
        <div class="crud-action fade-up fade-up-delay-3">
          <button type="submit">Confirmar edición</button>
        </div>
      </form>
    </div>
  </section>
</main>
<footer class="site-footer"><p>Proyecto JavaWeb &mdash; <span>JuanCruz-Andrés Castro</span></p></footer>
<a href="adminClientes" class="admin-back">Volver</a>
<script>(function(){var n=document.getElementById('mainNavbar');window.addEventListener('scroll',function(){n.classList.toggle('scrolled',window.scrollY>40);});})();</script>
</body></html>
