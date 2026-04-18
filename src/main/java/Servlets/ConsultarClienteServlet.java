package Servlets;

import Modelo.GestionarUsuarios;
import Modelo.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ConsultarClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/consultarCliente.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String cedula = req.getParameter("cedula");
        Usuario u = GestionarUsuarios.consultar(req.getSession(), cedula);
        req.setAttribute("clienteEncontrado", u);
        req.setAttribute("cedulaBuscada", cedula);
        req.getRequestDispatcher("/consultarCliente.jsp").forward(req, res);
    }
}
