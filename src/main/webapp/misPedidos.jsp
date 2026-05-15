<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List, Modelo.GestionarPedidosTXT.Pedido, Modelo.Producto"%>

<!DOCTYPE html>

<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>OptiCafé — Mis Pedidos</title>
    <link rel="stylesheet" href="stiles/Styles.css"/>
    <style>

        .pedidos-wrap {
            max-width: 760px;
            margin: 0 auto;
            padding: 30px 20px 80px;
        }
        .pedidos-titulo {
            text-align: center;
            color: #d4af37;
            letter-spacing: 4px;
            font-size: 1.6rem;
            margin-bottom: 6px;

        }

        .pedidos-subtitulo {
            text-align: center;
            color: #888;
            font-size: 0.88rem;
            margin-bottom: 36px;
        }
        .cliente-badge {
            display: inline-block;
            background: rgba(212,175,55,0.12);
            border: 1px solid rgba(212,175,55,0.35);
            color: #d4af37;
            font-size: 0.8rem;
            letter-spacing: 2px;
            padding: 4px 14px;
            border-radius: 20px;
            text-transform: uppercase;
            margin-bottom: 28px;

        }

        .pedido-card {
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(212,175,55,0.2);
            border-radius: 10px;
            margin-bottom: 12px;
            overflow: hidden;
            transition: border-color 0.25s;
        }

        .pedido-card.abierto {
            border-color: rgba(212,175,55,0.55);
        }
        .pedido-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 20px;
            cursor: pointer;
            user-select: none;
            gap: 12px;
            
        }

        .pedido-header:hover {
            background: rgba(212,175,55,0.06);
        }

        .pedido-meta {
            display: flex;
            flex-direction: column;
            gap: 3px;

        }

        .pedido-cliente-nombre {
            font-size: 1rem;
            font-weight: 700;
            color: #f0e6c8;
            letter-spacing: 0.5px;

        }

        .pedido-fecha {
            font-size: 0.78rem;
            color: #777;
        }
        .pedido-resumen {
            display: flex;
            align-items: center;
            gap: 20px;
            flex-shrink: 0;

        }
        .pedido-num-items {
            font-size: 0.8rem;
            color: #888;
            white-space: nowrap;
        }

        .pedido-total-badge {

            background: rgba(212,175,55,0.15);
            color: #d4af37;
            font-weight: 700;
            font-size: 0.95rem;
            padding: 4px 14px;
            border-radius: 20px;
            white-space: nowrap;

        }
        .pedido-chevron {
            color: #d4af37;
            font-size: 1.1rem;
            transition: transform 0.3s;
            flex-shrink: 0;

        }

        .pedido-card.abierto .pedido-chevron {
            transform: rotate(180deg);
        }

        .pedido-detalle {
            display: none;
            border-top: 1px solid rgba(212,175,55,0.18);
            padding: 18px 20px 20px;

        }
        .pedido-card.abierto .pedido-detalle {
            display: block;
        }

        .detalle-tabla {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 14px;

        }

        .detalle-tabla th {
            font-size: 0.72rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #d4af37;
            border-bottom: 1px solid rgba(212,175,55,0.3);
            padding: 6px 8px;
            text-align: left;
        }

        .detalle-tabla td {
            padding: 9px 8px;
            color: #ddd;
            font-size: 0.9rem;
            border-bottom: 1px solid rgba(255,255,255,0.05);

        }

        .detalle-tabla td.td-precio {
            text-align: right;
            color: #f0e6c8;
            font-weight: 600;

        }

        .detalle-tabla td.td-cat {
            color: #777;
            font-size: 0.8rem;

        }
        
        .detalle-total {
            display: flex;
            justify-content: flex-end;
            gap: 16px;
            align-items: center;
            border-top: 1px solid rgba(212,175,55,0.3);
            padding-top: 12px;
            margin-top: 4px;

        }

        .detalle-total-label {
            color: #d4af37;
            font-size: 0.85rem;
            letter-spacing: 2px;
            font-weight: 700;

        }

        .detalle-total-valor {
            color: #fff;
            font-size: 1.2rem;
            font-weight: 800;

        }

        .sin-pedidos {
            text-align: center;
            color: #666;
            padding: 60px 20px;

        }

        .sin-pedidos p {
            margin-bottom: 10px;

        }

        .acciones-abajo {
            text-align: center;
            margin-top: 36px;
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
        <li><a href="pedido">MI PEDIDO</a></li>
        <li><a href="misPedidos" class="active">HISTORIAL</a></li>
    </ul>
</nav>

<main class="page-content" style="padding-top: 100px;">

    <div class="pedidos-wrap">

        <%
            String clienteNombre = (String) request.getAttribute("clienteNombre");
            Boolean esAdmin = (Boolean) request.getAttribute("esAdmin");
            if (esAdmin == null) {
                esAdmin = false;
            }
            @SuppressWarnings("unchecked")
            List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");
        %>

        
        <h1 class="pedidos-titulo fade-up">
            <%= esAdmin ? "TODOS LOS PEDIDOS" : "MIS PEDIDOS" %>
        </h1>
        <p class="pedidos-subtitulo fade-up fade-up-delay-1">
            <%= esAdmin
                    ? "Historial completo de pedidos registrados."
                    : "Aquí encontrarás el historial de todos tus pedidos realizados." %>
        </p>
        <% if (!esAdmin && clienteNombre != null) { %>
            <div style="text-align:center;">
                <span class="cliente-badge">
                    &#128100; <%= clienteNombre.toUpperCase() %>

                </span>

            </div>

        <% } %>

        <%

            if (pedidos == null || pedidos.isEmpty()) {
        %>

            <div class="sin-pedidos">
                <p>&#9749; Aún no hay pedidos registrados.</p>
                <% if (!esAdmin) { %>
                    <p style="font-size:0.85rem;">
                        ¡Realiza tu primer pedido desde la sección
                        <a href="pedido" style="color:#d4af37;">Mi Pedido</a>!
                    </p>
                <% } %>

            </div>

        <%

            } else {
                for (int i = pedidos.size() - 1; i >= 0; i--) {
                    Pedido p = pedidos.get(i);
                    String cardId = "pedido_" + i;
                    int numProductos = p.getProductos().size();

        %>

            <div class="pedido-card fade-up" id="<%= cardId %>">
                <div class="pedido-header" onclick="togglePedido('<%= cardId %>')">
                    <div class="pedido-meta">
                        <span class="pedido-cliente-nombre">
                            &#128100; <%= p.getClienteNombre() %>
                        </span>
                        <span class="pedido-fecha">
                            &#128197; <%= p.getFecha() %>
                        </span>
                    </div>

                    <div class="pedido-resumen">
                        <span class="pedido-num-items">
                            <%= numProductos %> producto<%= numProductos != 1 ? "s" : "" %>
                        </span>
                        <span class="pedido-total-badge">
                            $<%= String.format("%,.0f", p.getTotal()) %>

                        </span>
                        <span class="pedido-chevron">
                            &#9660;
                        </span>
                    </div>
                </div>

                <div class="pedido-detalle">
                    <table class="detalle-tabla">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Producto</th>
                                <th>Categoría</th>
                                <th style="text-align:right;">Precio unitario</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%

                                int num = 1;
                                for (Producto prod : p.getProductos()) {
                            %>
                            <tr>
                                <td><%= num++ %></td>
                                <td><%= prod.getNombre() %></td>
                                <td class="td-cat"><%= prod.getCategoria() %></td>
                                <td class="td-precio">
                                    $<%= String.format("%,.0f", prod.getPrecio()) %>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <div class="detalle-total">
                        <span class="detalle-total-label">TOTAL</span>
                        <span class="detalle-total-valor">
                            $<%= String.format("%,.0f", p.getTotal()) %>
                        </span>
                    </div>
                </div>
            </div>
        <%
                }
            } 
        %>
        
        <div class="acciones-abajo">
            <% if (!esAdmin) { %>
                <a href="pedido"
                   class="btn btn-gold"
                   style="padding:11px 36px; font-size:0.95rem; letter-spacing:2px;">
                    &#43; NUEVO PEDIDO
                </a>

                &nbsp;
            <% } %>

            <a href="<%= esAdmin ? "adminClientes.jsp" : "index.jsp" %>"
               class="btn-outline"
               style="border:1px solid #d4af37;
                      color:#d4af37;
                      background:transparent;
                      padding:10px 28px;
                      border-radius:4px;
                      text-decoration:none;
                      font-size:0.9rem;
                      letter-spacing:1px;">
                &#8592; VOLVER
            </a>
        </div>
    </div>
</main>
<footer class="site-footer">

    <p>
        Proyecto JavaWeb &mdash;
        <span>JuanCruz - Andrés Castro</span>
    </p>
</footer>
<script>

    function togglePedido(id) {
        var card = document.getElementById(id);
        if (card) {
            card.classList.toggle('abierto');
        }
    }

    (function () {
        var nav = document.getElementById('mainNavbar');
        window.addEventListener('scroll', function () {
            nav.classList.toggle('scrolled', window.scrollY > 40);
        });
    })();
    
</script>
</body>
</html>