package Servlets;

import Modelo.GestionarUsuarios;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AgregarClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/agregarCliente.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String nombre = req.getParameter("nombre");
        String cedula = req.getParameter("cedula");

        boolean ok = GestionarUsuarios.agregar(req.getSession(), nombre, cedula);
        req.setAttribute("mensaje", ok
            ? "Cliente '" + nombre + "' agregado correctamente."
            : "Ya existe un cliente con esa cédula.");
        req.setAttribute("tipo", ok ? "exito" : "error");
        req.getRequestDispatcher("/agregarCliente.jsp").forward(req, res);
    }
}