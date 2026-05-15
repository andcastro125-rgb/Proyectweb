package Servlets;

import Modelo.GestionarPedidosTXT;
import Modelo.Producto;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 */
public class FacturaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // si no hay pedido ni cliente se regresa al inicio
        if (session == null || session.getAttribute("productosPedido") == null) {
            res.sendRedirect(req.getContextPath() + "/registroCliente");
            return;
        }

        @SuppressWarnings("unchecked")
        List<Producto> pedido = (List<Producto>) session.getAttribute("productosPedido");

        //Guarda el pedido en archivo plano TXT 
        Boolean yaGuardado = (Boolean) session.getAttribute("pedidoGuardado");
        if (yaGuardado == null || !yaGuardado) {
            String cliente = (String) session.getAttribute("clienteRegistrado");
            if (cliente != null && pedido != null && !pedido.isEmpty()) {
                GestionarPedidosTXT.guardar(getServletContext(), cliente, pedido);
                session.setAttribute("pedidoGuardado", true);
            }
        }

        // Calculamos total
        double total = 0.0;
        for (Producto p : pedido) {
            total += p.getPrecio();
        }

        // Pasa datos al jsp o vista por metodo request
        req.setAttribute("pedido",        pedido);
        req.setAttribute("total",         total);
        req.setAttribute("clienteNombre", session.getAttribute("clienteRegistrado"));
        req.setAttribute("clienteCedula", session.getAttribute("clienteCedula"));

        req.getRequestDispatcher("/factura.jsp").forward(req, res);
    }
}
