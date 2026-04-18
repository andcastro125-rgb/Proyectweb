package Modelo;

import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * //Los datos viven en HttpSession bajo la clave "productos"
 */
public class GestionarProductos {

    @SuppressWarnings("unchecked")
    private static List<Producto> getLista(HttpSession session) {
        List<Producto> lista = (List<Producto>) session.getAttribute("productos");
        if (lista == null) {
            lista = new ArrayList<>();
            session.setAttribute("productos", lista);
        }
        return lista;
    }

    // Devuelve false si el nombre ya existe en esa categoría
    public static boolean agregar(HttpSession session, String nombre, String categoria, double precio) {
        List<Producto> lista = getLista(session);
        for (Producto p : lista) {
            if (p.getNombre().equalsIgnoreCase(nombre) &&
                p.getCategoria().equalsIgnoreCase(categoria)) return false;
        }
        lista.add(new Producto(nombre, categoria, precio));
        return true;
    }

    //Elimina por nombre+categoría
    public static boolean eliminar(HttpSession session, String nombre, String categoria) {
        return getLista(session).removeIf(p ->
            p.getNombre().equalsIgnoreCase(nombre) &&
            p.getCategoria().equalsIgnoreCase(categoria));
    }

    // Edita nombre y precio de un producto identificado por nombre+categoría
    public static boolean editar(HttpSession session, String categoria,
                                  String nuevoNombre, double nuevoPrecio) {
        for (Producto p : getLista(session)) {
            if (p.getCategoria().equalsIgnoreCase(categoria)) {
                p.setNombre(nuevoNombre);
                p.setPrecio(nuevoPrecio);
                return true;
            }
        }
        return false;
    }

    // Busca un producto por nombre
    public static Producto consultar(HttpSession session, String nombre) {
        for (Producto p : getLista(session)) {
            if (p.getNombre().equalsIgnoreCase(nombre)) return p;
        }
        return null;
    }

    // Devuelve todos los productos/
    public static List<Producto> listar(HttpSession session) {
        return getLista(session);
    }
}
