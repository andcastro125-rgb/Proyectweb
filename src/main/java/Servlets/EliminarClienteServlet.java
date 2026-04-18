package Servlets;

import Modelo.GestionarUsuarios;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class EliminarClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/eliminarCliente.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String cedula = req.getParameter("cedula");

        boolean ok = GestionarUsuarios.eliminar(req.getSession(), cedula);
        req.setAttribute("mensaje", ok
            ? "Cliente eliminado correctamente."
            : "No se encontró ningún cliente con esa cédula.");
        req.setAttribute("tipo", ok ? "exito" : "error");
        req.getRequestDispatcher("/eliminarCliente.jsp").forward(req, res);
    }
}
