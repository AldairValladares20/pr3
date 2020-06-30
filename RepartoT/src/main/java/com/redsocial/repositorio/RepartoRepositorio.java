package com.redsocial.repositorio;

import java.util.List;

import com.redsocial.entidad.Reparto;

public interface RepartoRepositorio {

	public Reparto insertaActualizaReparto(Reparto obj);
	public void eliminaReparto(int idReparto);
	public List<Reparto> listaReparto();
	public List<Reparto> listaRepartoPorNombre(String nom);
	public List<Reparto> listaReparto(int idTurno, String nombre, int precio);
}
