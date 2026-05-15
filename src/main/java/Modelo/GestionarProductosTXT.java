package Modelo;

import jakarta.servlet.ServletContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 */
public class GestionarProductosTXT {

    private static final String ARCHIVO = "/WEB-INF/data/productos.txt";

    private static String getRuta(ServletContext ctx) {
        return ctx.getRealPath(ARCHIVO);
    }

    public static List<Producto> listar(ServletContext ctx) {
        List<Producto> lista = new ArrayList<>();
        File archivo = new File(getRuta(ctx));
        if (!archivo.exists()) return lista;

        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                linea = linea.trim();
                if (linea.isEmpty()) continue;
                String[] p = linea.split("\\|", 3);
                if (p.length == 3) {
                    try {
                        lista.add(new Producto(p[0], p[1], Double.parseDouble(p[2])));
                    } catch (NumberFormatException ignored) {}
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lista;
    }

    private static void guardar(ServletContext ctx, List<Producto> lista) throws IOException {
        File archivo = new File(getRuta(ctx));
        archivo.getParentFile().mkdirs();
        try (PrintWriter pw = new PrintWriter(new FileWriter(archivo, false))) {
            for (Producto p : lista) {
                pw.println(p.getNombre() + "|" + p.getCategoria() + "|" + p.getPrecio());
            }
        }
    }

    // Agregamos un producto Devuelve false si ya existe nombre+categoría. 
    public static boolean agregar(ServletContext ctx, String nombre, String categoria, double precio) {
        List<Producto> lista = listar(ctx);
        for (Producto p : lista) {
            if (p.getNombre().equalsIgnoreCase(nombre) &&
                p.getCategoria().equalsIgnoreCase(categoria)) return false;
        }
        lista.add(new Producto(nombre, categoria, precio));
        try { guardar(ctx, lista); return true; }
        catch (IOException e) { e.printStackTrace(); return false; }
    }

    // Eliminamos por nombre+categoría. 
    public static boolean eliminar(ServletContext ctx, String nombre, String categoria) {
        List<Producto> lista = listar(ctx);
        boolean removido = lista.removeIf(p ->
            p.getNombre().equalsIgnoreCase(nombre) &&
            p.getCategoria().equalsIgnoreCase(categoria));
        if (removido) {
            try { guardar(ctx, lista); }
            catch (IOException e) { e.printStackTrace(); return false; }
        }
        return removido;
    }

    // Edita nombre, categoría y precio identificado por nombre actual. 
    public static boolean editar(ServletContext ctx, String nombreActual,
                                  String nuevoNombre, String nuevaCategoria, double nuevoPrecio) {
        List<Producto> lista = listar(ctx);
        for (Producto p : lista) {
            if (p.getNombre().equalsIgnoreCase(nombreActual)) {
                p.setNombre(nuevoNombre);
                p.setCategoria(nuevaCategoria);
                p.setPrecio(nuevoPrecio);
                try { guardar(ctx, lista); return true; }
                catch (IOException e) { e.printStackTrace(); return false; }
            }
        }
        return false;
    }

    // Buscamos un producto por nombre. 
    public static Producto consultar(ServletContext ctx, String nombre) {
        for (Producto p : listar(ctx)) {
            if (p.getNombre().equalsIgnoreCase(nombre)) return p;
        }
        return null;
    }
}
    

