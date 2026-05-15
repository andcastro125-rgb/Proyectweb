package Modelo;

import jakarta.servlet.ServletContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 */
public class GestionarUsuariosTXT {

    private static final String ARCHIVO = "/WEB-INF/data/clientes.txt"; // ruta

    //En esta parte obtenemos la ruta absoluta del archivo dentro del servidor.
    private static String getRuta(ServletContext ctx) {
        return ctx.getRealPath(ARCHIVO); //
    }

    // Lee todas las líneas del TXT y construye la lista de usuarios. 
    public static List<Usuario> listar(ServletContext ctx) {
        List<Usuario> lista = new ArrayList<>();
        File archivo = new File(getRuta(ctx)); 
        if (!archivo.exists()) return lista;

        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) { // abrimos el 
            String linea;
            while ((linea = br.readLine()) != null) {
                linea = linea.trim();
                if (linea.isEmpty()) continue;
                String[] partes = linea.split("\\|", 2);
                if (partes.length == 2) {
                    lista.add(new Usuario(partes[0], partes[1]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Guardamos la lista completa sobreescribiendo el TXT. 
    private static void guardar(ServletContext ctx, List<Usuario> lista) throws IOException {
        File archivo = new File(getRuta(ctx));
        archivo.getParentFile().mkdirs();           // crea WEB-INF/data si no existe
        try (PrintWriter pw = new PrintWriter(new FileWriter(archivo, false))) {
            for (Usuario u : lista) {
                pw.println(u.getNombre() + "|" + u.getCedula());
            }
        }
    }

    // Agregamos a un cliente. Devuelve false si la cédula ya existe. 
    public static boolean agregar(ServletContext ctx, String nombre, String cedula) {
        List<Usuario> lista = listar(ctx);
        for (Usuario u : lista) {
            if (u.getCedula().equals(cedula)) return false;
        }
        lista.add(new Usuario(nombre, cedula));
        try { guardar(ctx, lista); return true; }
        catch (IOException e) { e.printStackTrace(); return false; }
    }

    // Eliminamos por cédula. Devuelve false si no existe.
    public static boolean eliminar(ServletContext ctx, String cedula) {
        List<Usuario> lista = listar(ctx);
        boolean removido = lista.removeIf(u -> u.getCedula().equals(cedula));
        if (removido) {
            try { guardar(ctx, lista); }
            catch (IOException e) { e.printStackTrace(); return false; }
        }
        return removido;
    }

    // Editamos el nombre de un cliente identificado por cédula. 
    public static boolean editar(ServletContext ctx, String cedula, String nuevoNombre) {
        List<Usuario> lista = listar(ctx);
        for (Usuario u : lista) {
            if (u.getCedula().equals(cedula)) {
                u.setNombre(nuevoNombre);
                try { guardar(ctx, lista); return true; }
                catch (IOException e) { e.printStackTrace(); return false; }
            }
        }
        return false;
    }

    // Buscamos un cliente por cédula y devuelve null si no existe.
    public static Usuario consultar(ServletContext ctx, String cedula) {
        for (Usuario u : listar(ctx)) {
            if (u.getCedula().equals(cedula)) return u;
        }
        return null;
    }
}
