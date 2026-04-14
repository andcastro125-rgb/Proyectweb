package Servlets;

import Modelo.GestionarUsuarios;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ListarClientesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setAttribute("clientes", GestionarUsuarios.listar(req.getSession()));
        req.getRequestDispatcher("/listarClientes.jsp").forward(req, res);
    }
}
