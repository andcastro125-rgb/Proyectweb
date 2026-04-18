package Servlets;

import Modelo.GestionarUsuarios;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class EditarClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/editarCliente.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String cedula = req.getParameter("cedula");
        String nuevoNombre = req.getParameter("nuevoNombre");

        boolean ok = GestionarUsuarios.editar(req.getSession(), cedula, nuevoNombre);
        req.setAttribute("mensaje", ok
            ? "Cliente actualizado correctamente."
            : "No se encontró ningún cliente con esa cédula.");
        req.setAttribute("tipo", ok ? "exito" : "error");
        req.getRequestDispatcher("/editarCliente.jsp").forward(req, res);
    }
}
