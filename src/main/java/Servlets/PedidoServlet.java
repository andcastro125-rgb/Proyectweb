package Servlets;

import Modelo.GestionarProductosTXT;
import Modelo.Producto;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 */
public class PedidoServlet extends HttpServlet {

 
    private boolean requireCliente(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("clienteRegistrado") == null) {
            res.sendRedirect(req.getContextPath() + "/registroCliente");
            return false;
        }
        return true;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (!requireCliente(req, res)) return;

        List<Producto> productos = GestionarProductosTXT.listar(getServletContext());
        req.setAttribute("productos", productos);

        
        HttpSession session = req.getSession(false);
        req.setAttribute("clienteNombre", session.getAttribute("clienteRegistrado"));

        req.getRequestDispatcher("/pedido.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (!requireCliente(req, res)) return;

        req.setCharacterEncoding("UTF-8");

        
        String[] seleccionados = req.getParameterValues("productoSel");

        List<Producto> todosProductos = GestionarProductosTXT.listar(getServletContext());
        List<Producto> pedido = new ArrayList<>();

        if (seleccionados != null) {
            for (String nombreSel : seleccionados) {
                for (Producto p : todosProductos) {
                    if (p.getNombre().equalsIgnoreCase(nombreSel)) {
                        pedido.add(p);
                        break;
                    }
                }
            }
        }

        if (pedido.isEmpty()) {
            
            req.setAttribute("productos", todosProductos);
            req.setAttribute("mensaje", "Debes seleccionar al menos un producto.");
            req.setAttribute("tipo", "error");
            HttpSession session = req.getSession(false);
            req.setAttribute("clienteNombre", session.getAttribute("clienteRegistrado"));
            req.getRequestDispatcher("/pedido.jsp").forward(req, res);
            return;
        }

        // Guardmos el pedido en sesión y redirigimos a la factura
        HttpSession session = req.getSession(false);
        session.setAttribute("productosPedido", pedido);
        res.sendRedirect(req.getContextPath() + "/factura");
    }
}
