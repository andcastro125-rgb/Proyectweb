<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, Modelo.Usuario"%>
<%
  // Protección: si no hay sesión de admin, redirige al login
  if (session.getAttribute("usuarioLogueado") == null) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
  }
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Gestión de Clientes</title>
  <link rel="stylesheet" href="stiles/Styles.css"/>
  <style>
    .admin-panel { max-width: 900px; margin: 0 auto; padding: 30px 20px; }
    .admin-title  { color: #d4af37; letter-spacing: 3px; margin-bottom: 30px; }
    .tab-nav { display: flex; gap: 10px; margin-bottom: 28px; flex-wrap: wrap; }
    .tab-btn {
      border: 1px solid rgba(212,175,55,0.4); background: transparent;
      color: #d4af37; padding: 8px 22px; border-radius: 4px;
      cursor: pointer; text-decoration: none; font-size: 0.85rem;
      letter-spacing: 1px; transition: all 0.2s;
    }
    .tab-btn:hover, .tab-btn.active { background: #d4af37; color: #1a1008; }
    .panel-card {
      background: rgba(20,14,8,0.85); border: 1px solid rgba(212,175,55,0.25);
      border-radius: 8px; padding: 24px; margin-bottom: 24px;
    }
    .panel-card h3 { color: #d4af37; margin-bottom: 18px; font-size: 0.9rem; letter-spacing: 2px; }
    .form-row { display: flex; gap: 12px; flex-wrap: wrap; }
    .form-row input { flex: 1; min-width: 180px; }
    table { width: 100%; border-collapse: collapse; }
    th { color: #d4af37; font-size: 0.75rem; letter-spacing: 2px; text-transform: uppercase;
         border-bottom: 1px solid rgba(212,175,55,0.3); padding: 8px 6px; text-align: left; }
    td { padding: 10px 6px; color: #ddd; border-bottom: 1px solid rgba(255,255,255,0.05); font-size: 0.9rem; }
    .accion-btn {
      border: none; padding: 5px 14px; border-radius: 4px;
      cursor: pointer; font-size: 0.8rem; margin-right: 4px;
    }
    .btn-editar   { background: #d4af37; color: #1a1008; }
    .btn-eliminar { background: #e74c3c; color: #fff; }
    .msg { padding: 10px 16px; border-radius: 5px; margin-bottom: 16px; font-size: 0.9rem; }
    .msg.exito  { background: rgba(46,204,113,0.15); color: #2ecc71; border: 1px solid #2ecc71; }
    .msg.error  { background: rgba(231,76,60,0.15);  color: #e74c3c;  border: 1px solid #e74c3c; }
    .inline-edit { display: none; }
  </style>
</head>
<body>

<nav class="navbar scrolled" id="mainNavbar">
  <a href="index.jsp" class="navbar__logo">
    <span class="navbar__logo-name">OPTIC<span>A</span>FÉ</span>
    <span class="navbar__logo-sub">Café rápido, gestión inteligente</span>
  </a>
  <ul class="navbar__links">
    <li><a href="bienvenida.jsp">BIENVENIDA</a></li>
    <li><a href="gestionClientes" class="active">CLIENTES</a></li>
    <li><a href="gestionProductos">PRODUCTOS</a></li>
    <li><a href="logout">CERRAR SESIÓN</a></li>
  </ul>
</nav>

<main class="page-content" style="padding-top:100px;">
  <div class="admin-panel">
    <h1 class="admin-title fade-up">GESTIÓN DE CLIENTES</h1>

    <%-- Mensaje de operación --%>
    <%
      String mensaje = (String) request.getAttribute("mensaje");
      String tipo    = (String) request.getAttribute("tipo");
      if (mensaje != null) {
    %>
      <div class="msg <%= tipo %>"><%= mensaje %></div>
    <% } %>

    <%-- Formulario: Agregar Cliente --%>
    <div class="panel-card fade-up">
      <h3>+ AGREGAR CLIENTE</h3>
      <form method="post" action="gestionClientes">
        <input type="hidden" name="accion" value="agregar"/>
        <div class="form-row">
          <input type="text"  name="nombre" placeholder="Nombre completo" required/>
          <input type="text"  name="cedula" placeholder="Cédula"           required/>
          <button type="submit" class="btn btn-gold" style="border:none; cursor:pointer; padding:10px 24px;">
            AGREGAR
          </button>
        </div>
      </form>
    </div>

    <%-- Tabla de clientes --%>
    <div class="panel-card fade-up fade-up-delay-1">
      <h3>CLIENTES REGISTRADOS</h3>
      <%
        @SuppressWarnings("unchecked")
        List<Usuario> clientes = (List<Usuario>) request.getAttribute("clientes");
        if (clientes == null || clientes.isEmpty()) {
      %>
        <p style="color:#666; font-size:0.9rem;">No hay clientes registrados aún.</p>
      <% } else { %>
      <table>
        <thead><tr><th>#</th><th>Nombre</th><th>Cédula</th><th>Acciones</th></tr></thead>
        <tbody>
        <%
          int i = 1;
          for (Usuario u : clientes) {
        %>
          <tr>
            <td><%= i++ %></td>
            <td><%= u.getNombre() %></td>
            <td><%= u.getCedula() %></td>
            <td>
             
              <button class="accion-btn btn-editar"
                      onclick="toggleEdit('<%= u.getCedula() %>')">Editar</button>

              <form method="post" action="gestionClientes" style="display:inline;"
                    onsubmit="return confirm('¿Eliminar a <%= u.getNombre() %>?');">
                <input type="hidden" name="accion"  value="eliminar"/>
                <input type="hidden" name="cedula"  value="<%= u.getCedula() %>"/>
                <button type="submit" class="accion-btn btn-eliminar">Eliminar</button>
              </form>
            </td>
          </tr>
          <%--Fila de edición --%>
          <tr id="edit_<%= u.getCedula() %>" class="inline-edit">
            <td colspan="4">
              <form method="post" action="gestionClientes" style="display:flex; gap:10px; flex-wrap:wrap; padding:8px 0;">
                <input type="hidden" name="accion"     value="editar"/>
                <input type="hidden" name="cedula"     value="<%= u.getCedula() %>"/>
                <input type="text"   name="nuevoNombre" value="<%= u.getNombre() %>"
                       placeholder="Nuevo nombre" required style="flex:1; min-width:180px;"/>
                <button type="submit" class="btn btn-gold" style="border:none;cursor:pointer;padding:8px 20px;">
                  GUARDAR
                </button>
                <button type="button" onclick="toggleEdit('<%= u.getCedula() %>')"
                        style="background:transparent;border:1px solid #888;color:#888;padding:8px 16px;border-radius:4px;cursor:pointer;">
                  CANCELAR
                </button>
              </form>
            </td>
          </tr>
        <% } %>
        </tbody>
      </table>
      <% } %>
    </div>

  </div>
</main>

<footer class="site-footer">
  <p>Proyecto JavaWeb &mdash; <span>JuanCruz - Andrés Castro</span></p>
</footer>

<script>
  function toggleEdit(cedula) {
    var row = document.getElementById('edit_' + cedula);
    row.style.display = (row.style.display === 'table-row') ? 'none' : 'table-row';
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
