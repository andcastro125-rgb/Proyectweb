package Modelo;

public class Persona {
    protected String nombre;
    protected String cedula;

    public Persona() {}
    public Persona(String nombre, String cedula) {
        this.nombre = nombre;
        this.cedula = cedula;
    }
    public String getNombre() { return nombre; }
    public void setNombre(String n) { this.nombre = n; }
    public String getCedula() { return cedula; }
    public void setCedula(String c) { this.cedula = c; }
}
