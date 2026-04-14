package Servlets;

import Modelo.GestionarProductos;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class EditarProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/editarProducto.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String categoria   = req.getParameter("categoria");
        String nuevoNombre = req.getParameter("nuevoNombre");
        double nuevoPrecio;
        try { nuevoPrecio = Double.parseDouble(req.getParameter("nuevoPrecio")); }
        catch (NumberFormatException e) { nuevoPrecio = 0; }

        boolean ok = GestionarProductos.editar(req.getSession(), categoria, nuevoNombre, nuevoPrecio);
        req.setAttribute("mensaje", ok
            ? "Producto actualizado correctamente."
            : "No se encontró ningún producto en esa categoría.");
        req.setAttribute("tipo", ok ? "exito" : "error");
        req.getRequestDispatcher("/editarProducto.jsp").forward(req, res);
    }
}
