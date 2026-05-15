package Servlets;

import Modelo.GestionarUsuariosTXT;
import Modelo.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 */
public class GestionClientesServlet extends HttpServlet {

    /** Verifica sesión activa de admin. Redirige y devuelve false si no hay. */
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
           
            String cedula = req.getParameter("cedula");
            req.setAttribute("cedula", cedula);
            req.getRequestDispatcher("/editarCliente.jsp").forward(req, res);
            return;
        }


        List<Usuario> clientes = GestionarUsuariosTXT.listar(getServletContext());
        req.setAttribute("clientes", clientes);
        req.getRequestDispatcher("/adminClientes.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (!requireAdmin(req, res)) return;

        req.setCharacterEncoding("UTF-8");
        String accion = req.getParameter("accion");

        if ("agregar".equals(accion)) {
            String nombre = req.getParameter("nombre");
            String cedula = req.getParameter("cedula");
            boolean ok = GestionarUsuariosTXT.agregar(getServletContext(), nombre, cedula);
            req.setAttribute("mensaje", ok
                ? "Cliente '" + nombre + "' agregado correctamente."
                : "Ya existe un cliente con esa cédula.");
            req.setAttribute("tipo", ok ? "exito" : "error");

        } else if ("editar".equals(accion)) {
            String cedula      = req.getParameter("cedula");
            String nuevoNombre = req.getParameter("nuevoNombre");
            boolean ok = GestionarUsuariosTXT.editar(getServletContext(), cedula, nuevoNombre);
            req.setAttribute("mensaje", ok
                ? "Cliente actualizado correctamente."
                : "No se encontró ningún cliente con esa cédula.");
            req.setAttribute("tipo", ok ? "exito" : "error");
            req.setAttribute("cedula", cedula);
            
            List<Usuario> clientes = GestionarUsuariosTXT.listar(getServletContext());
            req.setAttribute("clientes", clientes);
            req.getRequestDispatcher("/adminClientes.jsp").forward(req, res);
            return;

        } else if ("eliminar".equals(accion)) {
            String cedula = req.getParameter("cedula");
            boolean ok = GestionarUsuariosTXT.eliminar(getServletContext(), cedula);
            req.setAttribute("mensaje", ok
                ? "Cliente eliminado correctamente."
                : "No se encontró ningún cliente con esa cédula.");
            req.setAttribute("tipo", ok ? "exito" : "error");
        }

     
        List<Usuario> clientes = GestionarUsuariosTXT.listar(getServletContext());
        req.setAttribute("clientes", clientes);
        req.getRequestDispatcher("/adminClientes.jsp").forward(req, res);
    }
}
