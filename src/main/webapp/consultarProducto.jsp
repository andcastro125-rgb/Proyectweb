<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Producto"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Consultar Producto</title>
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
        <h1>CONSULTAR PRODUCTO</h1>
        <p>Consulta información del producto con su nombre</p>
      </div>
      <%
        Producto p = (Producto) request.getAttribute("productoEncontrado");
        String nombreBuscado = (String) request.getAttribute("nombreBuscado");
        String catResult    = "(CATEGORIA DE PRODUCTO)";
        String precioResult = "(PRECIO DE PRODUCTO)";
        if (p != null) {
            catResult    = p.getCategoria();
            precioResult = "$" + String.format("%.2f", p.getPrecio());
        } else if (nombreBuscado != null) {
            catResult    = "No encontrado";
            precioResult = "—";
        }
      %>
      <form method="post" action="consultarProducto">
        <div class="crud-field fade-up fade-up-delay-1">
          <label for="nombre">Nombre:</label>
          <input type="text" id="nombre" name="nombre" required autocomplete="off"
                 value="<%= nombreBuscado != null ? nombreBuscado : "" %>"/>
        </div>
        <div class="crud-field fade-up fade-up-delay-2">
          <label>Categoría:</label>
          <span class="crud-display"><%= catResult %></span>
        </div>
        <div class="crud-field fade-up fade-up-delay-3">
          <label>Precio:</label>
          <span class="crud-display"><%= precioResult %></span>
        </div>
        <div class="crud-action fade-up fade-up-delay-4">
          <button type="submit">Consultar</button>
        </div>
      </form>
    </div>
  </section>
</main>
<footer class="site-footer"><p>Proyecto JavaWeb &mdash; <span>JuanCruz-Andrés Castro</span></p></footer>
<a href="adminProductos" class="admin-back">Volver</a>
<script>(function(){var n=document.getElementById('mainNavbar');window.addEventListener('scroll',function(){n.classList.toggle('scrolled',window.scrollY>40);});})();</script>
</body></html>
