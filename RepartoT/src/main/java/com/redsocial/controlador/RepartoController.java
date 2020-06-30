package com.redsocial.controlador;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.redsocial.entidad.Turno;
import com.redsocial.entidad.Reparto;
import com.redsocial.servicio.TurnoServicio;
import com.redsocial.servicio.RepartoServicio;

@Controller
public class RepartoController {

	@Autowired
	private RepartoServicio RepartoServicio;
	
	@Autowired
	private TurnoServicio TurnoServicio;

	@RequestMapping("/verReparto")
	public String ver() {
		return "registraReparto";
	}
	
	@RequestMapping("/cargaTurno")
	@ResponseBody
	public List<Turno> listaTurno() {
		return TurnoServicio.listaTurno();
	}
	
	@RequestMapping("/registraReparto")
	public String metRegistra(Reparto obj,HttpSession session) {
		Reparto aux = RepartoServicio.insertaActualizaReparto(obj);
		if(aux == null) {
			session.setAttribute("MENSAJE", "Registro errÃ³neo");
		}else {
			session.setAttribute("MENSAJE", "Registro exitos");
		}
		return "redirect:verReparto";
	}
}
