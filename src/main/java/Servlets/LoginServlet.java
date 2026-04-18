package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    // Usuario y contraseña definidos correctamente
    private static final String USUARIO_VALIDO   = "JuanCastro";
    private static final String PASSWORD_VALIDA  = "proyectoservlet";
    // 

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String usuario  = req.getParameter("nombre");
        String password = req.getParameter("cedula");

        if (USUARIO_VALIDO.equals(usuario) && PASSWORD_VALIDA.equals(password)) {
            // Credenciales correctas hace crear sesión y redirigir a bienvenida
            HttpSession session = req.getSession(true);
            session.setAttribute("usuarioLogueado", usuario);
            res.sendRedirect(req.getContextPath() + "/bienvenida.jsp");
        } else {
            // Credenciales incorrectas hace volver al login con mensaje de error
            req.setAttribute("errorLogin", "Usuario o contraseña incorrectos.");
            req.getRequestDispatcher("/acceder.jsp").forward(req, res);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // Acceder directamente por URL amostrar el formulario
        req.getRequestDispatcher("/acceder.jsp").forward(req, res);
    }
}
