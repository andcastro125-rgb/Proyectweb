<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Consultar Cliente</title>
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
        <h1>CONSULTAR CLIENTE</h1>
        <p>Consulta información del cliente con su cédula</p>
      </div>
      <%
        Usuario u = (Usuario) request.getAttribute("clienteEncontrado");
        String cedulaBuscada = (String) request.getAttribute("cedulaBuscada");
        String nombreResult = "(NOMBRE DE CLIENTE)";
        if (u != null) nombreResult = u.getNombre();
        else if (cedulaBuscada != null) nombreResult = "No encontrado";
      %>
      <form method="post" action="consultarCliente">
        <div class="crud-field fade-up fade-up-delay-1">
          <label for="cedula">Cédula:</label>
          <input type="text" id="cedula" name="cedula" required autocomplete="off"
                 value="<%= cedulaBuscada != null ? cedulaBuscada : "" %>"/>
        </div>
        <div class="crud-field fade-up fade-up-delay-2">
          <label>Cliente:</label>
          <span class="crud-display"><%= nombreResult %></span>
        </div>
        <div class="crud-action fade-up fade-up-delay-3">
          <button type="submit">Consultar</button>
        </div>
      </form>
    </div>
  </section>
</main>
<footer class="site-footer"><p>Proyecto JavaWeb &mdash; <span>JuanCruz-Andrés Castro</span></p></footer>
<a href="adminClientes" class="admin-back">Volver</a>
<script>(function(){var n=document.getElementById('mainNavbar');window.addEventListener('scroll',function(){n.classList.toggle('scrolled',window.scrollY>40);});})();</script>
</body></html>
