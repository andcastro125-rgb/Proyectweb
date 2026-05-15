<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, Modelo.Producto"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>OptiCafé — Factura</title>
        <link rel="stylesheet" href="stiles/Styles.css"/>
        <style>
            .factura-container {
                max-width: 640px;
                margin: 40px auto;
                padding: 40px;
                background: rgba(20,14,8,0.92);
                border: 1px solid rgba(212,175,55,0.4);
                border-radius: 10px;
            }
            .factura-header {
                text-align: center;
                margin-bottom: 30px;
            }
            .factura-header h2 {
                color: #d4af37;
                letter-spacing: 4px;
                font-size: 1.5rem;
                margin-bottom: 4px;
            }
            .factura-header p  {
                color: #888;
                font-size: 0.85rem;
            }
            .factura-cliente {
                border-top: 1px solid rgba(212,175,55,0.25);
                border-bottom: 1px solid rgba(212,175,55,0.25);
                padding: 14px 0;
                margin-bottom: 24px;
                color: #ccc;
                font-size: 0.9rem;
            }
            .factura-cliente strong {
                color: #d4af37;
            }
            .factura-tabla {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            .factura-tabla th {
                text-align: left;
                color: #d4af37;
                font-size: 0.75rem;
                letter-spacing: 2px;
                text-transform: uppercase;
                border-bottom: 1px solid rgba(212,175,55,0.4);
                padding: 8px 4px;
            }
            .factura-tabla td {
                padding: 10px 4px;
                color: #e0d8cc;
                border-bottom: 1px solid rgba(255,255,255,0.06);
            }
            .factura-tabla td.precio {
                text-align: right;
                color: #f0e6c8;
                font-weight: 600;
            }
            .factura-tabla td.cat    {
                font-size: 0.8rem;
                color: #777;
            }
            .total-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-top: 2px solid #d4af37;
                padding-top: 16px;
                margin-top: 8px;
            }
            .total-label {
                color: #d4af37;
                font-size: 1rem;
                letter-spacing: 2px;
                font-weight: 700;
            }
            .total-valor {
                color: #fff;
                font-size: 1.4rem;
                font-weight: 800;
            }
            .acciones {
                text-align: center;
                margin-top: 34px;
                display: flex;
                gap: 16px;
                justify-content: center;
                flex-wrap: wrap;
            }
            .btn-outline {
                border: 1px solid #d4af37;
                color: #d4af37;
                background: transparent;
                padding: 10px 28px;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;
                font-size: 0.9rem;
                letter-spacing: 1px;
                transition: all 0.2s;
            }
            .btn-outline:hover {
                background: #d4af37;
                color: #1a1008;
            }
            @media print {
                nav, footer, .acciones {
                    display: none !important;
                }
                body {
                    background: white !important;
                    color: black !important;
                }
                .factura-container {
                    border: 1px solid #ccc;
                }
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
            </ul>
        </nav>

        <main class="page-content" style="padding-top: 100px;">
            <div class="factura-container fade-up">

                <%
                    String clienteNombre = (String) request.getAttribute("clienteNombre");
                    String clienteCedula = (String) request.getAttribute("clienteCedula");
                    if (clienteNombre == null) {
                        clienteNombre = "Cliente";
                    }
                    if (clienteCedula == null) {
                        clienteCedula = "-";
                    }

                    @SuppressWarnings(
        
                    "unchecked")
                  List<Modelo.Producto> pedido = (List<Modelo.Producto>) request.getAttribute("pedido");
                    Double total = (Double) request.getAttribute("total");
                    if (total == null) {
                        total = 0.0;
                    }

                    // Número de factura 
                    java.time.LocalDateTime ahora = java.time.LocalDateTime.now();
                    String fecha = String.format("%02d/%02d/%04d %02d:%02d",
                            ahora.getDayOfMonth(), ahora.getMonthValue(), ahora.getYear(),
                            ahora.getHour(), ahora.getMinute());
                %>

                <div class="factura-header">
                    <h2>&#9749; OPTICAFÉ</h2>
                    <p>Café rápido, gestión inteligente</p>
                    <p style="margin-top:8px; color:#555;">Fecha: <%= fecha%></p>
                </div>

                <div class="factura-cliente">
                    <strong>Cliente:</strong> <%= clienteNombre%><br/>
                    <strong>Cédula:</strong>  <%= clienteCedula%>
                </div>

                <table class="factura-tabla">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Producto</th>
                            <th>Categoría</th>
                            <th style="text-align:right;">Precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (pedido != null) {
                                int num = 1;
                                for (Modelo.Producto p : pedido) {
                        %>
                        <tr>
                            <td><%= num++%></td>
                            <td><%= p.getNombre()%></td>
                            <td class="cat"><%= p.getCategoria()%></td>
                            <td class="precio">$<%= String.format("%,.0f", p.getPrecio())%></td>
                        </tr>
                        <%  }
            }%>
                    </tbody>
                </table>

                <div class="total-row">
                    <span class="total-label">TOTAL</span>
                    <span class="total-valor">$<%= String.format("%,.0f", total)%></span>
                </div>

                <div class="acciones">
                    <button onclick="window.print()" class="btn-outline">&#128438; IMPRIMIR</button>
                    <a href="pedido" class="btn btn-gold" style="padding:10px 28px;">&#8592; NUEVO PEDIDO</a>
                    <a href="registroCliente" class="btn-outline">SALIR</a>
                </div>

            </div>
        </main>

        <footer class="site-footer">
            <p>Proyecto JavaWeb &mdash; <span>JuanCruz - Andrés Castro</span></p>
        </footer>

        <script>
            (function () {
                var nav = document.getElementById('mainNavbar');
                window.addEventListener('scroll', function () {
                    nav.classList.toggle('scrolled', window.scrollY > 40);
                });
            })();
        </script>

    </body>
</html>