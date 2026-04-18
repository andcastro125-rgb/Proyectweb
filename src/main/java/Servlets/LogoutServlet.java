package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // Invalidar la sesión activa
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        // Redirigir al login
        res.sendRedirect(req.getContextPath() + "/acceder.jsp");
    }
}
