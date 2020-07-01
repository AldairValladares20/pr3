package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.Reparto;
import com.redsocial.servicio.RepartoServicio;

@Controller
public class RepartoCrudController {

	@Autowired
	private RepartoServicio servicio;
	@RequestMapping("/verCrudReparto")
	public String ver() {
		return "crudReparto";
	}
	
	@RequestMapping("/consultaCrudReparto")
	public String lista(String filtro, Model m) {
		List<Reparto> lista =  servicio.listaRepartoPorNombre(filtro+"%");
		m.addAttribute("modalidades", lista);
		return "crudReparto";
	}
	
	@RequestMapping("/registraActualizaCrudReparto")
	public String registraActualiza(Reparto obj, Model m) {
		servicio.insertaActualizaReparto(obj);
		List<Reparto> lista =  servicio.listaReparto();
		m.addAttribute("modalidades", lista);
		return "crudReparto";
	}
	
	@RequestMapping("/eliminaCrudReparto")
	public String elimina(int id, Model m) {
		servicio.eliminaReparto(id);
		List<Reparto> lista =  servicio.listaReparto();
		m.addAttribute("modalidades", lista);
		return "crudReparto";
	}
}
