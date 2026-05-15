<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, Modelo.Producto"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Mi Pedido</title>
  <link rel="stylesheet" href="stiles/Styles.css"/>
  <style>
    .productos-pedido {
      max-width: 740px;
      margin: 0 auto;
      padding: 30px 20px 60px;
    }
    .pedido-titulo {
      text-align: center;
      color: #d4af37;
      letter-spacing: 4px;
      font-size: 1.6rem;
      margin-bottom: 6px;
    }
    .pedido-subtitulo {
      text-align: center;
      color: #888;
      font-size: 0.9rem;
      margin-bottom: 36px;
    }
    .seccion-titulo {
      color: #d4af37;
      letter-spacing: 3px;
      font-size: 0.75rem;
      text-transform: uppercase;
      border-bottom: 1px solid rgba(212,175,55,0.35);
      padding-bottom: 6px;
      margin: 28px 0 14px;
    }
    .producto-item {
      display: flex;
      align-items: center;
      gap: 16px;
      background: rgba(255,255,255,0.04);
      border: 1px solid rgba(212,175,55,0.2);
      border-radius: 8px;
      padding: 14px 18px;
      margin-bottom: 10px;
      cursor: pointer;
      transition: background 0.2s, border-color 0.2s;
    }
    .producto-item:hover {
      background: rgba(212,175,55,0.08);
      border-color: rgba(212,175,55,0.5);
    }
    .producto-item input[type="checkbox"] {
      width: 20px;
      height: 20px;
      accent-color: #d4af37;
      cursor: pointer;
      flex-shrink: 0;
    }
    .producto-item label {
      flex: 1;
      cursor: pointer;
    }
    .prod-nombre {
      font-size: 1rem;
      font-weight: 600;
      color: #f0e6c8;
    }
    .prod-cat {
      font-size: 0.75rem;
      color: #777;
      text-transform: uppercase;
      margin-top: 2px;
    }
    .prod-precio {
      font-size: 1.05rem;
      color: #d4af37;
      font-weight: 700;
      min-width: 90px;
      text-align: right;
      flex-shrink: 0;
    }
    .sin-productos {
      text-align: center;
      color: #666;
      padding: 50px 20px;
    }
    .sin-productos p { margin-bottom: 8px; }
    .aviso-error {
      background: rgba(231,76,60,0.12);
      border: 1px solid #e74c3c;
      color: #e74c3c;
      padding: 10px 18px;
      border-radius: 6px;
      text-align: center;
      margin-bottom: 20px;
      font-size: 0.9rem;
    }
    .barra-confirmar {
      position: sticky;
      bottom: 0;
      background: rgba(14,10,5,0.95);
      border-top: 1px solid rgba(212,175,55,0.3);
      padding: 16px 20px;
      text-align: center;
      margin: 0 -20px -60px;
    }
  </style>
</head>
<body>


<nav class="navbar scrolled" id="mainNavbar">
  <a href="index.jsp" class="navbar__logo">
    <span class="navbar__logo-name">OPTIC<span>A</span>FÉ</span>
    <span class="navbar__logo-sub">Café rápido, gestión inteligente</span>
  </a>
  <ul class="navbar__links">
    <li><a href="index.jsp">INICIO</a></li>
    <li><a href="registroCliente">REGISTRO</a></li>
    <li><a href="pedido" class="active">MI PEDIDO</a></li>
  </ul>
</nav>

<main class="page-content" style="padding-top: 100px;">
  <div class="productos-pedido">

    
    <%
      String clienteNombre = (String) request.getAttribute("clienteNombre");
      if (clienteNombre == null) clienteNombre = "Cliente";
    %>
    <h1 class="pedido-titulo fade-up">HOLA, <%= clienteNombre.toUpperCase() %></h1>
    <p class="pedido-subtitulo fade-up fade-up-delay-1">
     
    </p>

    <%-- Aviso por si no seleccionó nada --%>
    <%
      String mensaje = (String) request.getAttribute("mensaje");
      if (mensaje != null) {
    %>
      <div class="aviso-error"><%= mensaje %></div>
    <% } %>

    <%-- Lista de productos actuales --%>
    <%
      @SuppressWarnings("unchecked")
      List<Producto> productos = (List<Producto>) request.getAttribute("productos");

      if (productos == null || productos.isEmpty()) {
    %>
      <div class="sin-productos">
        <p>&#9749; Aún no hay productos en el menú.</p>
        <p style="font-size:0.85rem;">El administrador debe registrar los productos primero.</p>
      </div>

    <% } else { %>

      <form method="post" action="pedido">

        <%
          String catActual = "";
          for (Producto p : productos) {

        
            if (!p.getCategoria().equalsIgnoreCase(catActual)) {
              catActual = p.getCategoria();
        %>
              <div class="seccion-titulo"><%= catActual.toUpperCase() %></div>
        <%  } 

            
            String prodId = "prod_" + p.getNombre().replaceAll("[^a-zA-Z0-9]", "_");
        %>

        <div class="producto-item fade-up">
          <input type="checkbox"
                 name="productoSel"
                 value="<%= p.getNombre() %>"
                 id="<%= prodId %>"/>
          <label for="<%= prodId %>">
            <div class="prod-nombre"><%= p.getNombre() %></div>
            <div class="prod-cat"><%= p.getCategoria() %></div>
          </label>
          <div class="prod-precio">$<%= String.format("%,.0f", p.getPrecio()) %></div>
        </div>

   
        <% } %>

        <div class="barra-confirmar">
          <button type="submit" class="btn btn-gold"
                  style="border:none; cursor:pointer; padding:13px 48px; font-size:1rem; letter-spacing:2px;">
            CONFIRMAR PEDIDO &rarr;
          </button>
        </div>

      </form>

    <% } %>

  </div>
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
