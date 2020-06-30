package com.redsocial.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redsocial.entidad.Turno;
import com.redsocial.repositorio.TurnoRepositorio;

@Service
public class TurnoServicioImpl implements TurnoServicio {
	@Autowired
	private TurnoRepositorio repositorio;

	@Override
	public List<Turno> listaTurno() {
		return repositorio.listaTurno();
	}

}
