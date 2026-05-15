package Servlets;

import Modelo.GestionarProductosTXT;
import Modelo.Producto;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 */
public class GestionProductosServlet extends HttpServlet {

    private boolean requireAdmin(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("usuarioLogueado") == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return false;
        }
        return true;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (!requireAdmin(req, res)) return;

        String accion = req.getParameter("accion");

        if ("editar".equals(accion)) {
            String nombre = req.getParameter("nombre");
           
            Producto p = GestionarProductosTXT.consultar(getServletContext(), nombre);
            if (p != null) {
                req.setAttribute("productoEditar", p);
            }
            req.getRequestDispatcher("/editarProducto.jsp").forward(req, res);
            return;
        }

        // Panel principal con la lista
        List<Producto> productos = GestionarProductosTXT.listar(getServletContext());
        req.setAttribute("productos", productos);
        req.getRequestDispatcher("/adminProductos.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (!requireAdmin(req, res)) return;

        req.setCharacterEncoding("UTF-8");
        String accion = req.getParameter("accion");

        if ("agregar".equals(accion)) {
            String nombre    = req.getParameter("nombre");
            String categoria = req.getParameter("categoria");
            double precio;
            try { precio = Double.parseDouble(req.getParameter("precio")); }
            catch (NumberFormatException e) { precio = 0.0; }

            boolean ok = GestionarProductosTXT.agregar(getServletContext(), nombre, categoria, precio);
            req.setAttribute("mensaje", ok
                ? "Producto '" + nombre + "' agregado correctamente."
                : "Ya existe un producto con ese nombre en esa categoría.");
            req.setAttribute("tipo", ok ? "exito" : "error");

        } else if ("editar".equals(accion)) {
            String nombreActual = req.getParameter("nombreActual");
            String nuevoNombre  = req.getParameter("nombre");
            String categoria    = req.getParameter("categoria");
            double nuevoPrecio;
            try { nuevoPrecio = Double.parseDouble(req.getParameter("precio")); }
            catch (NumberFormatException e) { nuevoPrecio = 0.0; }

            boolean ok = GestionarProductosTXT.editar(getServletContext(),
                nombreActual, nuevoNombre, categoria, nuevoPrecio);
            req.setAttribute("mensaje", ok
                ? "Producto actualizado correctamente."
                : "No se encontró el producto a editar.");
            req.setAttribute("tipo", ok ? "exito" : "error");

        } else if ("eliminar".equals(accion)) {
            String nombre    = req.getParameter("nombre");
            String categoria = req.getParameter("categoria");
            boolean ok = GestionarProductosTXT.eliminar(getServletContext(), nombre, categoria);
            req.setAttribute("mensaje", ok
                ? "Producto eliminado correctamente."
                : "No se encontró el producto a eliminar.");
            req.setAttribute("tipo", ok ? "exito" : "error");
        }

        List<Producto> productos = GestionarProductosTXT.listar(getServletContext());
        req.setAttribute("productos", productos);
        req.getRequestDispatcher("/adminProductos.jsp").forward(req, res);
    }
}
