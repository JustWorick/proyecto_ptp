package com.CodingDojo.Abraham.Controladores;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.CodingDojo.Abraham.Modelos.Comentario;
import com.CodingDojo.Abraham.Modelos.Etiqueta;
import com.CodingDojo.Abraham.Modelos.Imagen;
import com.CodingDojo.Abraham.Modelos.NombresEtiquetas;
import com.CodingDojo.Abraham.Modelos.Receta;
import com.CodingDojo.Abraham.Modelos.Usuario;
import com.CodingDojo.Abraham.Servicio.Servicio;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class Controladores {

	@Autowired
	private Servicio serv;
	
// <<<<<<< HEAD
// =======
	
	/*
	 * --------------------------------------------------------------------------
	 * CONTROLADOR DE PRUEBA
	 * 
	 * 
	 * 
	 * */
	@GetMapping("/prueba")
	public String prueba(Model model, HttpSession session) {
		
		
		List<Etiqueta> todasEtiquetas = serv.buscarTodasEtiquetas();
		model.addAttribute("todasLasEtiquetas", todasEtiquetas);
		
		List<Receta> todasRecetas = serv.buscarTodasRecetas();
		model.addAttribute("todasRecetas", todasRecetas);
		return "buscadorRecetas.jsp";
	}
	
	
	// yarni nacho =>> necesito una lista de etiquetas, una lista de productos
	
	
	
	
	
	
	// -----------------------------------------------------------
// >>>>>>> dd28a21aa0be0e03c33bd901ccaa69a8e580242c
	// GETMAPPING
	
	@GetMapping()
	public String index(HttpSession session, Model model) {
		List<Receta> top5Recetas = serv.buscarTop5Recetas();
		model.addAttribute("top5Recetas", top5Recetas);
		return "index.jsp";
	}
	
	@GetMapping("/recetas")
	public String recetas(Model model, HttpSession session) {
		
		
		List<Etiqueta> todasEtiquetas = serv.buscarTodasEtiquetas();
		model.addAttribute("todasLasEtiquetas", todasEtiquetas);
		
		List<Receta> todasRecetas = serv.buscarTodasRecetas();
		model.addAttribute("todasRecetas", todasRecetas);
		return "recetas.jsp";
	}
	
	@GetMapping("/nuevaReceta")
	public String nuevaReceta(@ModelAttribute("receta")Receta newReceta, HttpSession session, Model model) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		List<String> nombreEtiquetas =  Arrays.asList(NombresEtiquetas.NomEtiquetas);
		model.addAttribute("nombreEtiquetas", nombreEtiquetas);
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
		
		
		model.addAttribute("recetas", misRecetas);
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
	public String crearReceta(@Valid @ModelAttribute("receta")Receta newReceta, 
								BindingResult result, HttpSession session,
								@RequestParam("imagen")MultipartFile imagen,
								@RequestParam("etiqueta")String nombreEtiqueta, Model model) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		if(result.hasErrors()) {
			List<String> nombreEtiquetas =  Arrays.asList(NombresEtiquetas.NomEtiquetas);
			model.addAttribute("nombreEtiquetas", nombreEtiquetas);
			return "nuevaReceta.jsp";
		}
		
		
		// <<=========== Logica Para añadir Imagenes ================>>
		
		if(!imagen.isEmpty()) {		
			String originalFileName = imagen.getOriginalFilename();
			String extension = "";
			if (originalFileName != null && originalFileName.contains(".")) {
			    extension = originalFileName.substring(originalFileName.lastIndexOf("."));
			}

			String nombreImagen = UUID.randomUUID().toString() + extension;
		    // Path rutaImagen = Paths.get("src/main/resources/static/img", nombreImagen);
		    Path rutaImagen = Paths.get("target/classes/static/img", nombreImagen);
		    
		    // RUTA ABSOLUTA (NOSE PARA QUE)
		    String rutaAbsoluta = rutaImagen.toAbsolutePath().toString();
		    
		    // Path rutaCompleta = Paths.get(rutaAbsoluta+"/"+imagen.getOriginalFilename());
		    Imagen newImagen = new Imagen();
		    
		
		    try {
		        Files.write(rutaImagen, imagen.getBytes());
		        newImagen.setNombre(imagen.getOriginalFilename());
		        newImagen.setUrl("/img/"+nombreImagen);		
		        
		        serv.guardarImagen(newImagen);		// <<<======== SE GUARDA LA IMAGEN
		        

		       ArrayList<Imagen> imagenesDeLaReceta = new ArrayList<>(); //<<<==== AÑADIMOS LA IMAGEN A LA RELACION CON LA RECETA
		       imagenesDeLaReceta.add(newImagen);
		       newReceta.setImagenesRec(imagenesDeLaReceta);
		       
		       serv.guardarReceta(newReceta);
		       newImagen.setRecetaImg(newReceta);
		       serv.guardarImagen(newImagen);
		        
		      } catch (IOException e) {
		        e.printStackTrace();
		      }
		}
		
		//  <<================         Logica Para añadir Etiquetas                   ==================>> 
		serv.guardarReceta(newReceta);
		if(!nombreEtiqueta.isEmpty()) {
			Etiqueta eti = new Etiqueta();		
			eti.setNombre(nombreEtiqueta);
			
			if(eti.getRecetas() == null) {
				ArrayList<Receta> recetas = new ArrayList<>();
				recetas.add(newReceta);
				eti.setRecetas(recetas);
				serv.guardarEtiqueta(eti);
			}else {
				eti.getRecetas().add(newReceta);
				serv.guardarEtiqueta(eti);
			}
			
		}
		
		
		serv.guardarReceta(newReceta);
		return "redirect:/misRecetas/"+userTemp.getId();
	}
	/*
	@PostMapping("/receta/{recetaId}/imagenes")
	public String añadirMasImagenesReceta(@RequestParam("imagen")MultipartFile imagen,
			HttpSession session, @PathVariable("recetaId")Long recetaId) {
		
		return "redirect:/receta/"+recetaId;
	}
	*/
	@PostMapping("/receta/{recetaId}/comentario")
	public String crearComentarioReceta(@Valid @ModelAttribute("comentario")Comentario nuevoComentario, 
										BindingResult result, HttpSession session, @PathVariable("recetaId")Long recetaId, Model model) {
		
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		
		if(result.hasErrors()) {
			Receta receta = serv.buscarRecetaPorId(recetaId);
			model.addAttribute("receta", receta);
			return "mostrarReceta.jsp";
		}
		else {
			serv.guardarComentario(nuevoComentario);
		}
		return "redirect:/receta/"+recetaId;
	}
	
	
	
	
	
	
	
	
	// DELETEMAPPING
	@DeleteMapping("/borrar/imagen/{id}")
	public String borrarImagen(@PathVariable("id")Long id, HttpSession session) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		serv.deleteImagen(id);
		return "redirect:/";
	}
	
	@DeleteMapping("/borrar/receta/imagenes/{id}")
	public String borrarTodasImagenesDeUnaReceta(@PathVariable("id")Long id, HttpSession session) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		Receta receta = serv.buscarRecetaPorId(id);
		List<Imagen> imagenes = receta.getImagenesRec();
		
		for(Imagen ima:imagenes) {
			serv.deleteImagen(ima.getId());
		}
		return "redirect:/";
	}
	
	@DeleteMapping("/borrar/imagen/all")
	public String borrarTodasImagenes(HttpSession session) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		serv.deleteTodasImagenes();
		return "redirect:/";
	}
	
	@DeleteMapping("/borrar/recetas/all")
	public String borrarTodasRecetas(HttpSession session) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		serv.deleteTodasRecetas();
		return "redirect:/";
	}
	
	@DeleteMapping("/borrar/receta/{id}")
	public String borrarReceta(@PathVariable("id")Long id, HttpSession session) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		serv.deleteReceta(id);
		return "redirect:/";
	}
}
