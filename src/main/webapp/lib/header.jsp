<%-- header.jsp - Fragmento de cabecera reutilizable --%>
<header>
  <nav class="navbar" id="mainNavbar">
    <a href="index.jsp" class="navbar__logo">
      <span class="navbar__logo-name">OPTIC<span>A</span>FÉ</span>
      <span class="navbar__logo-sub">Café rápido, gestión inteligente</span>
    </a>
    <ul class="navbar__links">
      <li><a href="acceder.jsp"    id="nav-acceder">ACCEDER</a></li>
      <li><a href="inicio.jsp"     id="nav-inicio">INICIO DE SESIÓN</a></li>
      <li><a href="bienvenida.jsp" id="nav-bienvenida">BIENVENIDA</a></li>
      <li><a href="servicios.jsp"  id="nav-servicios">SERVICIOS</a></li>
      <li><a href="categorias.jsp" id="nav-categorias">CATEGORÍAS</a></li>
    </ul>
  </nav>
</header>

<script>
  /* Navbar scroll effect */
  (function() {
    var nav = document.getElementById('mainNavbar');
    window.addEventListener('scroll', function() {
      nav.classList.toggle('scrolled', window.scrollY > 40);
    });

    /* Active link highlight */
    var page = window.location.pathname.split('/').pop() || 'index.jsp';
    var map = {
      'acceder.jsp':    'nav-acceder',
      'inicio.jsp':     'nav-inicio',
      'bienvenida.jsp': 'nav-bienvenida',
      'servicios.jsp':  'nav-servicios',
      'categorias.jsp': 'nav-categorias',
      'index.jsp':      'nav-acceder'
    };
    var activeId = map[page];
    if (activeId) {
      var el = document.getElementById(activeId);
      if (el) el.classList.add('active');
    }
  })();
</script>
