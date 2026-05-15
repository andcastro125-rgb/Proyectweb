package Modelo;

import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 */
public class GestionarUsuarios {

    @SuppressWarnings("unchecked")
    private static List<Usuario> getLista(HttpSession session) {
        List<Usuario> lista = (List<Usuario>) session.getAttribute("clientes");
        if (lista == null) {
            lista = new ArrayList<>();
            session.setAttribute("clientes", lista);
        }
        return lista;
    }

    // Aqui agregamos a un cliente nuevo. Devuelve false si la cédula ya existe. 
    public static boolean agregar(HttpSession session, String nombre, String cedula) {
        List<Usuario> lista = getLista(session);
        for (Usuario u : lista) {
            if (u.getCedula().equals(cedula)) return false;
        }
        lista.add(new Usuario(nombre, cedula));
        return true;
    }

    // EliminamoS por cédula. Devuelve false si no existe.
    public static boolean eliminar(HttpSession session, String cedula) {
        List<Usuario> lista = getLista(session);
        return lista.removeIf(u -> u.getCedula().equals(cedula));
    }

    // Editamos el nombre de un cliente identificado por cédula.
    public static boolean editar(HttpSession session, String cedula, String nuevoNombre) {
        for (Usuario u : getLista(session)) {
            if (u.getCedula().equals(cedula)) {
                u.setNombre(nuevoNombre);
                return true;
            }
        }
        return false;
    }

    // Devuelve null si no existe. 
    public static Usuario consultar(HttpSession session, String cedula) {
        for (Usuario u : getLista(session)) {
            if (u.getCedula().equals(cedula)) return u;
        }
        return null;
    }

    // Mostramos todos los clientes .
    public static List<Usuario> listar(HttpSession session) {
        return getLista(session);
    }
}
