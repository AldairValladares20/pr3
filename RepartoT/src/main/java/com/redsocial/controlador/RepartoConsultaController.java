package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.Reparto;
import com.redsocial.servicio.RepartoServicio;

public class RepartoConsultaController {

	@Autowired
	private RepartoServicio servicio;
	
	@RequestMapping("/verConsultaReparto")
	public String ver() {
		return "consultaReparto";
	}
	
	@RequestMapping("/consultaReparto")
	public String lista(int idDeporte, String nombre, int precio, Model m) {
		List<Reparto> lista =  servicio.listaReparto(idDeporte, nombre+"%", precio);
		m.addAttribute("modalidades", lista);
		return "consultaReparto";
	}
}
