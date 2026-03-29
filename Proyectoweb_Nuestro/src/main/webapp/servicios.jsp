<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Servicios</title>
  <link rel="stylesheet" href="stiles/Styles.css"/>
</head>
<body>

<!-- ══════════ NAVBAR ══════════ -->
<nav class="navbar scrolled" id="mainNavbar">
  <a href="index.jsp" class="navbar__logo">
    <span class="navbar__logo-name">OPTIC<span>A</span>FÉ</span>
    <span class="navbar__logo-sub">Café rápido, gestión inteligente</span>
  </a>
  <ul class="navbar__links">
    <li><a href="acceder.jsp">ACCEDER</a></li>
    <li><a href="inicio.jsp">INICIO DE SESIÓN</a></li>
    <li><a href="bienvenida.jsp">BIENVENIDA</a></li>
    <li><a href="servicios.jsp" class="active">SERVICIOS</a></li>
    <li><a href="categorias.jsp">CATEGORÍAS</a></li>
  </ul>
</nav>

<!-- ══════════ CONTENIDO ══════════ -->
<main class="page-content">
  <section class="services-page">

    <div class="services-page__info">
      <span class="tag fade-up">OptiCafé · Servicios</span>

      <h1 class="fade-up fade-up-delay-1">NUESTROS SERVICIOS</h1>
      <h2 class="fade-up fade-up-delay-1">
        SABEMOS QUE NO SOLO ES CAF&#201; &mdash; &#161;ES TU CAF&#201;!
      </h2>

      <p class="fade-up fade-up-delay-2">
        Por favor elige uno de los siguientes servicios de la cafeter&#237;a
        y te brindaremos la mejor experiencia posible.
      </p>

      <div class="service-cards fade-up fade-up-delay-3">

        <div class="service-card" onclick="location.href='categorias.jsp'">
          <div class="service-card__title">CATEGORÍAS</div>
          <p class="service-card__text">
            Te ofrecemos los mejores y m&#225;s finos productos de la cafeter&#237;a
            preparados con amor para ti; llegar&#225;n s&#250;per r&#225;pido a tu mesa.
          </p>
        </div>

        <div class="service-card" onclick="location.href='categorias.jsp'">
          <div class="service-card__title">COMPRA</div>
          <p class="service-card__text">
            Una vez seleccionados los productos que deseas consumir,
            puedes confirmar tu pedido y recibirlo en tu lugar.
          </p>
        </div>

        <div class="service-card">
          <div class="service-card__title">FACTURACIÓN</div>
          <p class="service-card__text">
            Consulta y descarga tu comprobante de pago de forma f&#225;cil
            y r&#225;pida desde cualquier dispositivo.
          </p>
        </div>

      </div>

      <div class="slide-dots fade-up fade-up-delay-4">
        <span class="dot active"></span>
        <span class="dot active"></span>
        <span class="dot"></span>
        <span class="dot active"></span>
        <span class="dot"></span>
      </div>
    </div>

    <%-- Imagen derecha: coloca services-bg.jpg en web/images/ (960x1080px)
         Tema: taza de café con latte art + granos esparcidos, fondo blanco --%>
    <div class="services-page__image"></div>

  </section>
</main>

<!-- ══════════ FOOTER ══════════ -->
<footer class="site-footer">
  <p>Proyecto JavaWeb &mdash; <span>JuanCruz - AndresCastro</span></p>
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
