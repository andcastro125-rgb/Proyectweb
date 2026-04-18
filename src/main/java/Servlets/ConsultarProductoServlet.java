package Servlets;

import Modelo.GestionarProductos;
import Modelo.Producto;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ConsultarProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/consultarProducto.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String nombre = req.getParameter("nombre");
        Producto p = GestionarProductos.consultar(req.getSession(), nombre);
        req.setAttribute("productoEncontrado", p);
        req.setAttribute("nombreBuscado", nombre);
        req.getRequestDispatcher("/consultarProducto.jsp").forward(req, res);
    }
}
