package com.redsocial.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redsocial.entidad.Reparto;
import com.redsocial.repositorio.RepartoRepositorio;

@Service
public class RepartoServicioImpl implements RepartoServicio{

	@Autowired
	private RepartoRepositorio repositorio;

	@Override
	public Reparto insertaActualizaReparto(Reparto obj) {
		return repositorio.insertaActualizaReparto(obj);
	}

	@Override
	public void eliminaReparto(int idReparto) {
		repositorio.eliminaReparto(idReparto);
	}

	@Override
	public List<Reparto> listaReparto() {
		return repositorio.listaReparto();
	}

	@Override
	public List<Reparto> listaRepartoPorNombre(String nom) {
		return repositorio.listaRepartoPorNombre(nom);
	}

	@Override
	public List<Reparto> listaReparto(int idDeporte, String nombre, int precio) {
		return repositorio.listaReparto(idDeporte, nombre, precio);
	} 
	
}
