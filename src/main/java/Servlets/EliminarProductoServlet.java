package Servlets;

import Modelo.GestionarProductos;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class EliminarProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/eliminarProducto.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String nombre    = req.getParameter("nombre");
        String categoria = req.getParameter("categoria");

        boolean ok = GestionarProductos.eliminar(req.getSession(), nombre, categoria);
        req.setAttribute("mensaje", ok
            ? "Producto eliminado correctamente."
            : "No se encontró ningún producto con esos datos.");
        req.setAttribute("tipo", ok ? "exito" : "error");
        req.getRequestDispatcher("/eliminarProducto.jsp").forward(req, res);
    }
}
