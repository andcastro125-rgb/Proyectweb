<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OptiCafé — Categorías</title>
  <link rel="stylesheet" href="stiles/Styles.css"/>
</head>
<body>

    
<nav class="navbar" id="mainNavbar">
  <a href="index.jsp" class="navbar__logo">
    <span class="navbar__logo-name">OPTIC<span>A</span>FÉ</span>
    <span class="navbar__logo-sub">Café rápido, gestión inteligente</span>
  </a>
  <ul class="navbar__links">
    <li><a href="acceder.jsp">ACCEDER</a></li>
    <li><a href="inicio.jsp">INICIO DE SESIÓN</a></li>
    <li><a href="bienvenida.jsp">BIENVENIDA</a></li>
    <li><a href="servicios.jsp">SERVICIOS</a></li>
    <li><a href="categorias.jsp" class="active">CATEGORÍAS</a></li>
  </ul>
</nav>


<main class="page-content">
  <section class="categories-page">

    <%-- Fondo: coloca categories-bg.jpg en web/images/ (1920x1080px)
         Tema: granos de café esparcidos sobre fondo negro --%>
    <div class="categories-page__bg"></div>

    <div class="categories-page__content">

      <h1 class="fade-up">CATEGORÍAS</h1>
      <p class="subtitle fade-up fade-up-delay-1">
        &#191;QUE DESEAS PEDIR HOY?<br/>
        ELIGE LA CATEGOR&#205;A DE TU PREFERENCIA
      </p>

      <div class="category-grid">

       
        <div class="category-card fade-up fade-up-delay-1">
          <div class="category-card__image">
            <img src="images/cafeteria.jpg" alt="Cafetería"
                 onerror="this.style.display='none';
                          this.parentElement.innerHTML='<div class=\'placeholder-icon\'>&#9749;</div>'"/>
          </div>
          <span class="category-card__name">CAF&#201;TERIA</span>
          <span class="category-card__link">VER MEN&#218;</span>
        </div>

        
        <div class="category-card fade-up fade-up-delay-2">
          <div class="category-card__image">
            <img src="images/panaderia.jpg" alt="Panadería"
                 onerror="this.style.display='none';
                          this.parentElement.innerHTML='<div class=\'placeholder-icon\'>&#127850;</div>'"/>
          </div>
          <span class="category-card__name">PANADER&#205;A</span>
          <span class="category-card__link">VER MEN&#218;</span>
        </div>

     
        <div class="category-card fade-up fade-up-delay-3">
          <div class="category-card__image">
            <img src="images/chocolate.jpg" alt="Chocolate"
                 onerror="this.style.display='none';
                          this.parentElement.innerHTML='<div class=\'placeholder-icon\'>&#127851;</div>'"/>
          </div>
          <span class="category-card__name">CHOCOLATE</span>
          <span class="category-card__link">VER MEN&#218;</span>
        </div>

    
        <div class="category-card fade-up fade-up-delay-4">
          <div class="category-card__image">
            <img src="images/donas.jpg" alt="Donas"
                 onerror="this.style.display='none';
                          this.parentElement.innerHTML='<div class=\'placeholder-icon\'>&#127849;</div>'"/>
          </div>
          <span class="category-card__name">DONAS</span>
          <span class="category-card__link">VER MEN&#218;</span>
        </div>

      </div>
    </div>
  </section>
</main>


<footer class="site-footer">
  <p>Proyecto JavaWeb &mdash; <span>JuanCruz-Andrés Castro</span></p>
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
