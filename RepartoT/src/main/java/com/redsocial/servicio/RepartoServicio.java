package com.redsocial.servicio;

import java.util.List;

import com.redsocial.entidad.Reparto;

public interface RepartoServicio {

	public Reparto insertaActualizaReparto(Reparto obj);
	public void eliminaReparto(int idReparto);
	public List<Reparto> listaReparto();
	public List<Reparto> listaRepartoPorNombre(String nom);
	public List<Reparto> listaReparto(int idDeporte, String nombre,int precio);
}
