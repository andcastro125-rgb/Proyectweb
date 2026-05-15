package Modelo;

import jakarta.servlet.ServletContext;
import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 */
public class GestionarPedidosTXT {

    private static final String ARCHIVO = "/WEB-INF/data/pedidos.txt";
    private static final DateTimeFormatter FMT =
            DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

    // Clase en la estructura interna Pedido

    public static class Pedido {
        private final String clienteNombre;
        private final String fecha;
        private final List<Producto> productos;
        private final double total;

        public Pedido(String clienteNombre, String fecha, List<Producto> productos) {
            this.clienteNombre = clienteNombre;
            this.fecha         = fecha;
            this.productos     = productos;
            double t = 0;
            for (Producto p : productos) t += p.getPrecio();
            this.total = t;
        }

        public String getClienteNombre() { return clienteNombre; }
        public String getFecha()         { return fecha; }
        public List<Producto> getProductos() { return productos; }
        public double getTotal()         { return total; }
    }

    // Métodos de la clase

    private static String getRuta(ServletContext ctx) {
        return ctx.getRealPath(ARCHIVO);
    }

    // Lee todos los pedidos del archivo
    public static List<Pedido> listar(ServletContext ctx) {
        List<Pedido> lista = new ArrayList<>();
        File archivo = new File(getRuta(ctx));
        if (!archivo.exists()) return lista;

        try (BufferedReader br = new BufferedReader(
                new InputStreamReader(new FileInputStream(archivo), "UTF-8"))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                linea = linea.trim();
                if (linea.isEmpty()) continue;
               
                String[] partes = linea.split("\\|", 3);
                if (partes.length < 3) continue;

                String nombre = partes[0];
                String fecha  = partes[1];
                List<Producto> prods = new ArrayList<>();

                for (String entry : partes[2].split(";")) {
                    String[] campos = entry.split(":", 3);
                    if (campos.length == 3) {
                        try {
                            prods.add(new Producto(
                                campos[0],
                                campos[1],
                                Double.parseDouble(campos[2])
                            ));
                        } catch (NumberFormatException ignored) {}
                    }
                }
                if (!prods.isEmpty()) {
                    lista.add(new Pedido(nombre, fecha, prods));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lista;
    }

    
    public static List<Pedido> listarPorCliente(ServletContext ctx, String clienteNombre) {
        List<Pedido> todos = listar(ctx);
        List<Pedido> resultado = new ArrayList<>();
        for (Pedido p : todos) {
            if (p.getClienteNombre().equalsIgnoreCase(clienteNombre)) {
                resultado.add(p);
            }
        }
        return resultado;
    }

    public static boolean guardar(ServletContext ctx, String cliente, List<Producto> productos) {
        File archivo = new File(getRuta(ctx));
        archivo.getParentFile().mkdirs();

        String fecha = LocalDateTime.now().format(FMT);

   
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < productos.size(); i++) {
            Producto p = productos.get(i);
            sb.append(p.getNombre())
              .append(":").append(p.getCategoria())
              .append(":").append(p.getPrecio());
            if (i < productos.size() - 1) sb.append(";");
        }

        String linea = cliente + "|" + fecha + "|" + sb.toString();

        try (PrintWriter pw = new PrintWriter(
                new OutputStreamWriter(
                    new FileOutputStream(archivo, true), "UTF-8"))) {
            pw.println(linea);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}
