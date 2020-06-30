package com.redsocial.entidad;

public class Reparto {

	private int idreparto;
	private String codrepartidor;
	private String direccion;
	private String nombreTienda;
	private int precioMaxima;
	private int precioMinima;
	private double total;
	private Turno turno;
	public int getIdreparto() {
		return idreparto;
	}
	public void setIdreparto(int idreparto) {
		this.idreparto = idreparto;
	}
	public String getCodrepartidor() {
		return codrepartidor;
	}
	public void setCodrepartidor(String codrepartidor) {
		this.codrepartidor = codrepartidor;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getNombreTienda() {
		return nombreTienda;
	}
	public void setNombreTienda(String nombreTienda) {
		this.nombreTienda = nombreTienda;
	}
	public int getPrecioMaxima() {
		return precioMaxima;
	}
	public void setPrecioMaxima(int precioMaxima) {
		this.precioMaxima = precioMaxima;
	}
	public int getPrecioMinima() {
		return precioMinima;
	}
	public void setPrecioMinima(int precioMinima) {
		this.precioMinima = precioMinima;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public Turno getTurno() {
		return turno;
	}
	public void setTurno(Turno turno) {
		this.turno = turno;
	}
	
	
	
}
