package Servlets;

import Modelo.GestionarProductos;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ListarProductosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setAttribute("productos", GestionarProductos.listar(req.getSession()));
        req.getRequestDispatcher("/listarProductos.jsp").forward(req, res);
    }
}
