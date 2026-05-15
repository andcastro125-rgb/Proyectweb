package Servlets;

import Modelo.GestionarUsuariosTXT;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class RegistroClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/clientes.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String nombre = req.getParameter("nombre");
        String cedula = req.getParameter("cedula");

        boolean ok = GestionarUsuariosTXT.agregar(getServletContext(), nombre, cedula);

        if (ok) {
            // Guarda en sesión para saber qué cliente va a hacer el pedido
            HttpSession session = req.getSession(true);
            session.setAttribute("clienteRegistrado", nombre);
            session.setAttribute("clienteCedula", cedula);

            
            res.sendRedirect(req.getContextPath() + "/pedido");

        } else {
            req.setAttribute("mensaje", "Ya existe un cliente con esa cédula. Intenta con otra.");
            req.setAttribute("tipo", "error");
            req.setAttribute("registrado", false);
            req.getRequestDispatcher("/clientes.jsp").forward(req, res);
        }
    }
}
