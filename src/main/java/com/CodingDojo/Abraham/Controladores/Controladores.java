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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String nuevaReceta(@ModelAttribute("receta")Receta newReceta, HttpSession session, Model model) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		List<String> nombreEtiquetas =  Arrays.asList(NombresEtiquetas.NomEtiquetas);
		model.addAttribute("etiquetas", nombreEtiquetas);
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
	public String crearReceta(@Valid @ModelAttribute("receta")Receta newReceta, BindingResult result, HttpSession session, @RequestParam("imagen")MultipartFile imagen) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		if(result.hasErrors()) {
			return "nuevaReceta.jsp";
		}
		
		if(!imagen.isEmpty()) {		// <<===== Logica Para añadir Imagenes
			String originalFileName = imagen.getOriginalFilename();
			String extension = "";
			if (originalFileName != null && originalFileName.contains(".")) {
			    extension = originalFileName.substring(originalFileName.lastIndexOf("."));
			}

			String nombreImagen = UUID.randomUUID().toString() + extension;
		    Path rutaImagen = Paths.get("src/main/resources/static/img", nombreImagen);
		    
		    // RUTA ABSOLUTA (NOSE PARA QUE)
		    String rutaAbsoluta = rutaImagen.toAbsolutePath().toString();
		    
		    // Path rutaCompleta = Paths.get(rutaAbsoluta+"/"+imagen.getOriginalFilename());
		    Imagen newImagen = new Imagen();
		    
		    /*
		     * String nombreImagen = UUID.randomUUID().toString() + "." + imagen.getOriginalFilename().split(".")[1];
		    Path rutaImagen = Paths.get("src/main/resources/static/img", nombreImagen);
		    
		    // RUTA ABSOLUTA (NOSE PARA QUE)
		    String rutaAbsoluta = rutaImagen.toAbsolutePath().toString();
		    
		    Path rutaCompleta = Paths.get(rutaAbsoluta+"/"+imagen.getOriginalFilename());
		    Imagen newImagen = new Imagen();
		     * */
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
		        /*
		         * if (!imagenesDeLaReceta.isEmpty()) {
		        	  imagenesDeLaReceta.add(newImagen);
		        	  newReceta.setImagenesRec(imagenesDeLaReceta);
		        	}
		        else {
		        	List<Imagen> imagenesDeLaReceta1 = new ArrayList<>();
		        	imagenesDeLaReceta1.add(new Imagen());
		        	newReceta.setImagenesRec(imagenesDeLaReceta1);
		        }
		         * */
		      } catch (IOException e) {
		        e.printStackTrace();
		      }
		}

		serv.guardarReceta(newReceta);
		return "redirect:/misRecetas/"+userTemp.getId();
	}
}
