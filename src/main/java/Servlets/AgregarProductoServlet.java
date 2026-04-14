package Servlets;

import Modelo.GestionarProductos;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AgregarProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/agregarProducto.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String nombre    = req.getParameter("nombre");
        String categoria = req.getParameter("categoria");
        double precio;
        try { precio = Double.parseDouble(req.getParameter("precio")); }
        catch (NumberFormatException e) { precio = 0; }

        boolean ok = GestionarProductos.agregar(req.getSession(), nombre, categoria, precio);
        req.setAttribute("mensaje", ok
            ? "Producto '" + nombre + "' agregado correctamente."
            : "Ya existe un producto con ese nombre en esa categoría.");
        req.setAttribute("tipo", ok ? "exito" : "error");
        req.getRequestDispatcher("/agregarProducto.jsp").forward(req, res);
    }
}
