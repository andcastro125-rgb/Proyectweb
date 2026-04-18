<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, Modelo.Usuario"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Listado de Clientes</title>
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
        <h1>LISTADO DE CLIENTES</h1>
        <p>Clientes registrados</p>
      </div>
      <%
        List<Usuario> clientes = (List<Usuario>) request.getAttribute("clientes");
        if (clientes == null) clientes = new java.util.ArrayList<>();
      %>
      <div class="crud-table-wrap fade-up fade-up-delay-1">
        <div class="crud-table-header cols-2">
          <span>Nombre</span>
          <span>Cédula</span>
        </div>
        <% if (clientes.isEmpty()) { %>
          <p style="color:#999;font-size:0.8rem;text-align:center;padding:20px 0;">
            No hay clientes registrados aún.
          </p>
        <% }
           int i = 1;
           for (Usuario u : clientes) { %>
          <div class="crud-table-row cols-2">
            <span class="row-label">C<%= i++ %>:</span>
            <span class="row-cell"><%= u.getNombre() %></span>
            <span class="row-cell"><%= u.getCedula() %></span>
          </div>
        <% } %>
      </div>
    </div>
  </section>
</main>
<footer class="site-footer"><p>Proyecto JavaWeb &mdash; <span>JuanCruz_Andrés Castro</span></p></footer>
<a href="adminClientes" class="admin-back">Volver</a>
<script>(function(){var n=document.getElementById('mainNavbar');window.addEventListener('scroll',function(){n.classList.toggle('scrolled',window.scrollY>40);});})();</script>
</body></html>
