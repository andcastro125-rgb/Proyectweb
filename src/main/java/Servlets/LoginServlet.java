package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

/**
 */
public class LoginServlet extends HttpServlet {

    private static final String USUARIO_VALIDO  = "admin";
    private static final String PASSWORD_VALIDA = "1234";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String usuario  = req.getParameter("nombre");
        String password = req.getParameter("cedula");

        if (USUARIO_VALIDO.equals(usuario) && PASSWORD_VALIDA.equals(password)) {
            HttpSession session = req.getSession(true);
            session.setAttribute("usuarioLogueado", usuario);
            res.sendRedirect(req.getContextPath() + "/bienvenida.jsp");
        } else {
            req.setAttribute("errorLogin", "Usuario o contraseña incorrectos.");
            req.getRequestDispatcher("/acceder.jsp").forward(req, res);
        }
    }

    @Override       
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/acceder.jsp").forward(req, res);
    }
}
