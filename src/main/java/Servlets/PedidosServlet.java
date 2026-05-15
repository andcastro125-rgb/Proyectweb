package Servlets;

import Modelo.GestionarPedidosTXT;
import Modelo.GestionarPedidosTXT.Pedido;
import Modelo.Producto;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 */
public class PedidosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // Verifica que haya un cliente o admin en sesión
        if (session == null ||
           (session.getAttribute("clienteRegistrado") == null &&
            session.getAttribute("adminLogueado") == null)) {
            res.sendRedirect(req.getContextPath() + "/registroCliente");
            return;
        }

        String esAdmin = (String) session.getAttribute("adminLogueado");
        List<Pedido> pedidos;

        if (esAdmin != null) {
            // Aqui el admin ve todos los pedidos actuales
            pedidos = GestionarPedidosTXT.listar(getServletContext());
        } else {
            // El cliente solo ve sus pedidos
            String cliente = (String) session.getAttribute("clienteRegistrado");
            pedidos = GestionarPedidosTXT.listarPorCliente(getServletContext(), cliente);
            req.setAttribute("clienteNombre", cliente);
        }

        req.setAttribute("pedidos", pedidos);
        req.setAttribute("esAdmin", esAdmin != null);
        req.getRequestDispatcher("/misPedidos.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("clienteRegistrado") == null) {
            res.sendRedirect(req.getContextPath() + "/registroCliente");
            return;
        }

        @SuppressWarnings("unchecked")
        List<Producto> pedido = (List<Producto>) session.getAttribute("productosPedido");
        String cliente = (String) session.getAttribute("clienteRegistrado");

        if (pedido != null && !pedido.isEmpty() && cliente != null) {
            GestionarPedidosTXT.guardar(getServletContext(), cliente, pedido);
        }

        // Redirigimos a la factura 
        res.sendRedirect(req.getContextPath() + "/factura");
    }
}
