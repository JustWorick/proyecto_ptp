package com.CodingDojo.Abraham.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.CodingDojo.Abraham.Modelos.Receta;
import com.CodingDojo.Abraham.Modelos.Usuario;
import com.CodingDojo.Abraham.Servicio.Servicio;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class Controladores {

	@Autowired
	private Servicio serv;
	
	
	// GETMAPPING
	
	@GetMapping()
	public String index(HttpSession session, Model model) {
		List<Receta> top5Recetas = serv.buscarTop5Recetas();
		model.addAttribute("top5Recetas", top5Recetas);
		return "index.jsp";
	}
	
	@GetMapping("/recetas")
	public String recetas(Model model, HttpSession session) {
		List<Receta> todasRecetas = serv.buscarTodasRecetas();
		model.addAttribute("todasRecetas", todasRecetas);
		return "recetas.jsp";
	}
	
	@GetMapping("/nuevaReceta")
	public String nuevaReceta(@ModelAttribute("receta")Receta newReceta, HttpSession session) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		return "nuevaReceta.jsp";
	}
	
	@GetMapping("/receta/{id}")
	public String mostrarReceta(@PathVariable("id")Long id, Model model) {
		Receta receta = serv.buscarRecetaPorId(id);
		model.addAttribute("receta", receta);
		return "mostrarReceta.jsp";
	}
	
	@GetMapping("/misRecetas/{id}")
	public String misRecetas(@PathVariable("id")Long id, HttpSession session, Model model) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		List<Receta> misRecetas = serv.buscarRecetasPorCreadorId(id);
		model.addAttribute("misRecetas", misRecetas);
		return "misRecetas.jsp";
	}
	
	@GetMapping("/editar/receta/{id}")
	public String editarReceta(@PathVariable("id")Long id, @ModelAttribute("receta")Receta newReceta, HttpSession session, Model model) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		Receta recetaPorEditar = serv.buscarRecetaPorId(id);
		model.addAttribute("recetaPorEditar", recetaPorEditar);
		return "editarReceta.jsp";
	}
	
	
	
	
	// POSTMAPPING
	
	@PostMapping("/nuevaReceta")
	public String crearReceta(@Valid @ModelAttribute("receta")Receta newReceta, BindingResult result, HttpSession session) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		if(result.hasErrors()) {
			return "nuevaReceta.jsp";
		}
		serv.guardarReceta(newReceta);
		return "redirect:/misRecetas/"+userTemp.getId();
	}
}
