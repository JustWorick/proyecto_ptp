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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.CodingDojo.Abraham.Modelos.Comentario;
import com.CodingDojo.Abraham.Modelos.Etiqueta;
import com.CodingDojo.Abraham.Modelos.Imagen;
import com.CodingDojo.Abraham.Modelos.Ingrediente;
import com.CodingDojo.Abraham.Modelos.NombresEtiquetas;
import com.CodingDojo.Abraham.Modelos.Producto;
import com.CodingDojo.Abraham.Modelos.Receta;
import com.CodingDojo.Abraham.Modelos.Usuario;
import com.CodingDojo.Abraham.Modelos.Video;
import com.CodingDojo.Abraham.Servicio.Servicio;

import jakarta.servlet.http.HttpServletResponse;
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
		
		int numero = 1;
		session.setAttribute("num",numero);
	
		return "index.jsp";
	}
	
	@GetMapping("/recetas")
	public String recetas(Model model, HttpSession session, HttpServletResponse response) {
		
		
		List<String> todasEtiquetas = Arrays.asList(NombresEtiquetas.NomEtiquetas);
		model.addAttribute("todasLasEtiquetas", todasEtiquetas);
		
		List<Receta> todasRecetas = serv.buscarTodasRecetas();
		model.addAttribute("recetas", todasRecetas);
		
		// Deshabilitar la caché para esta página
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);
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
		List<Comentario> comentarios = serv.buscarTodosComentariosPorReceta(id);
		
		model.addAttribute("comentarios", comentarios);
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
	
	@GetMapping("/productos")
	public String productos(Model model, HttpServletResponse response) {
	    List<Producto> productos = serv.buscarTodosProductos();
	    
	    model.addAttribute("productos", productos);
	    
	 // Deshabilitar la caché para esta página
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);
	    
	    return "productos.jsp";
	}

	@GetMapping("/nuevoProducto")
	public String nuevoProducto(@ModelAttribute("producto") Producto newProducto, HttpSession session, Model model) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		List<String> nombreEtiquetas =  Arrays.asList(NombresEtiquetas.NomEtiquetas);
		model.addAttribute("nombreEtiquetas", nombreEtiquetas);
	    return "nuevoProducto.jsp";
	}
	
	@GetMapping("/misProductos/{id}")
	public String misProductos(@PathVariable("id")Long id, HttpSession session, Model model) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		List<Producto> productos = serv.buscarTodosProductosPorCreador(id);
		model.addAttribute("productos", productos);
		return "misProductos.jsp";
	}
	
	@GetMapping("/perfil/{id}")
	public String perfil(@PathVariable("id")Long id, HttpSession session, Model model) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/login";
		}
		model.addAttribute("usuarioEnSesion", userTemp);
		return "mostrarPerfil.jsp";
	}
	
	@GetMapping("perfil/editar/{id}")
	public String editarPerfil(@PathVariable("id") Long id,
						 	   @ModelAttribute("usuario") Usuario usuario,
						 	   Model model, HttpSession session) { 
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/login";
		}
		
		model.addAttribute("usuario", userTemp);
		
		return "editarPerfil.jsp";
	}
	
	@GetMapping("/busqueda/etiqueta/{etiqueta}")
	public String busquedaPorEtiqueta(@PathVariable("etiqueta")String etiqueta, HttpSession session, Model model, HttpServletResponse response) {
		
		List<Receta> recetas = serv.buscarRecetaPorNombreEtiqueta(etiqueta);
		model.addAttribute("recetas", recetas);
		
		List<String> todasEtiquetas = Arrays.asList(NombresEtiquetas.NomEtiquetas);
		model.addAttribute("todasLasEtiquetas", todasEtiquetas);
		
		// Deshabilitar la caché para esta página
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);
		return "busqueda.jsp";
	}
	
	@GetMapping("/busqueda/nombre/{palabra}")
	public String busquedaPorNombre(@PathVariable("palabra")String nombre, HttpSession session, Model model, HttpServletResponse response) {
		
		List<Receta> recetas = serv.buscarTodasRecetasPorNombre(nombre);
		model.addAttribute("recetas", recetas);
		
		List<String> todasEtiquetas = Arrays.asList(NombresEtiquetas.NomEtiquetas);
		model.addAttribute("todasLasEtiquetas", todasEtiquetas);
		
		// Deshabilitar la caché para esta página
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);
		return "busqueda.jsp";
	}
	
	@GetMapping("/busqueda/productos/{palabra}")
	public String busquedaProductos(Model model, @PathVariable("palabra") String nombre, HttpSession session, HttpServletResponse response) {
	    List<Producto> productos = serv.buscarTodosProductosPorNombre(nombre);
	    
	    model.addAttribute("productos", productos);
	    
	    // Deshabilitar la caché para esta página
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);
	    
	    return "busquedaProducto.jsp";
	}
	
	@PostMapping("/busqueda/productos/nombre")
	public String productosPost(Model model, @RequestParam("palabra") String nombre, HttpSession session, HttpServletResponse response) {
	    List<Producto> productos = serv.buscarTodosProductosPorNombre(nombre);
	    
	    model.addAttribute("productos", productos);
	    
	    // Deshabilitar la caché para esta página
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);
	    
	    return "redirect:/busqueda/productos/"+nombre;
	}
	
	
	@PostMapping("/busqueda/nombre")
	public String busquedaPorNombrePost(@RequestParam("palabra")String nombre, HttpSession session, Model model, HttpServletResponse response) {
		List<Receta> recetas = serv.buscarTodasRecetasPorNombre(nombre);
		model.addAttribute("recetas", recetas);
		
		List<String> todasEtiquetas = Arrays.asList(NombresEtiquetas.NomEtiquetas);
		model.addAttribute("todasLasEtiquetas", todasEtiquetas);
		
		// Deshabilitar la caché para esta página
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);
		return "redirect:/busqueda/nombre/"+nombre;
	}


	
	// POSTMAPPING
	
	@PostMapping("/nuevaReceta")
	public String crearReceta(@Valid @ModelAttribute("receta")Receta newReceta, 
								BindingResult result, HttpSession session,
								@RequestParam("imagen")List<MultipartFile> imagenes,
								@RequestParam("video")String video,
								@RequestParam("etiqueta")String[] nombresEti,
								@RequestParam("nombreIng[]")String[] nombreIng, @RequestParam("cantidad[]")String[] cantidad, Model model) {
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
		List<Imagen> nuevasImagenes = new ArrayList<>();
		for(MultipartFile imagen : imagenes) {
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
			    newReceta.setImagenesRec(nuevasImagenes);
			}		
		}
		//  <<================         Logica Para añadir Etiquetas                   ==================>> 
		serv.guardarReceta(newReceta);
		if(nombresEti != null) {
			ArrayList<Etiqueta> etiquetas = new ArrayList<>();
			ArrayList<Receta> recetas = new ArrayList<>();
			recetas.add(newReceta);
			
			for(String etiqueta:nombresEti) {
				Etiqueta eti = new Etiqueta();		
				eti.setNombre(etiqueta);
				
			
				eti.setRecetas(recetas);
				serv.guardarEtiqueta(eti);
			}
		}
		/*
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
		*/
		
		// <<================         Logica Para añadir Ingredientes                  ==================>> 
		
		for(int i = 0; i < nombreIng.length; i++) {
			String nomIng = nombreIng[i];
			String can = cantidad[i];
			
			if(!nomIng.isEmpty() && !can.isEmpty()) {
				Ingrediente ingrediente = new Ingrediente();
				ingrediente.setNombre(nomIng);
				ingrediente.setCantidad(can);
				serv.guardarIngrediente(ingrediente);
				ingrediente.setReceta(newReceta);
				serv.guardarIngrediente(ingrediente);
			}
		}
		
		
		// <<================         Logica Para añadir Video                 ==================>> 
		if(video != "0") {
			Video newVideo = new Video();
			newVideo.setUrl(video);
			newVideo.setRecetasVid(newReceta);
			serv.guardarVideo(newVideo);	
		}
		
		
		
		serv.guardarReceta(newReceta);
		return "redirect:/misRecetas/"+userTemp.getId();
	}
	
	
	
	@PostMapping("/nuevoProducto")
	public String crearProducto(@Valid @ModelAttribute("producto") Producto newProducto, BindingResult result, Model model,
								@RequestParam("imagen")MultipartFile imagen,
								@RequestParam("etiqueta")String nombreEtiqueta,HttpSession session) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		if(result.hasErrors()) {
			List<String> nombreEtiquetas =  Arrays.asList(NombresEtiquetas.NomEtiquetas);
			model.addAttribute("nombreEtiquetas", nombreEtiquetas);
			return "nuevoProducto.jsp";
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

				       ArrayList<Imagen> imagenesDeElProducto = new ArrayList<>(); //<<<==== AÑADIMOS LA IMAGEN A LA RELACION CON LA RECETA
				       imagenesDeElProducto.add(newImagen);
				       newProducto.setImagenesPro(imagenesDeElProducto);
				       
				       serv.guardarProducto(newProducto);
				       newImagen.setProductoImg(newProducto);
				       serv.guardarImagen(newImagen);
				        
				      } catch (IOException e) {
				        e.printStackTrace();
				      }
				}
			//  <<================         Logica Para añadir Etiquetas                   ==================>> 
				serv.guardarProducto(newProducto);
				if(!nombreEtiqueta.isEmpty()) {
					Etiqueta eti = new Etiqueta();		
					eti.setNombre(nombreEtiqueta);
					
					if(eti.getProductos() == null) {
						ArrayList<Producto> productos = new ArrayList<>();
						productos.add(newProducto);
						eti.setProductos(productos);
						serv.guardarEtiqueta(eti);
					}else {
						eti.getProductos().add(newProducto);
						serv.guardarEtiqueta(eti);
					}		
				}
		
	    serv.guardarProducto(newProducto);
	    return "redirect:/misProductos/"+userTemp.getId(); // Redirecciona a la lista de mis productos
	}
	
	
	
	
	
	/*
	 * -------------------------------------------------------------------------------------------------------------
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
	
	@PostMapping("/calificar/receta/{id}")
	public String calificarReceta(@PathVariable("id")Long id, HttpSession session, Model model, @RequestParam("star-input")double stars) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		Receta receta = serv.buscarRecetaPorId(id);
		double val1 = receta.getValoracionTotal();
		int numVal = receta.getNumeroValoraciones();
		
		val1 += stars;
		numVal += 1;
		
		
		double valFinal = val1 /= numVal;
		
		receta.setValoracionTotal(val1);
		receta.setNumeroValoraciones(numVal);
		receta.setValoracionFinal(valFinal);
		serv.guardarReceta(receta);
		
		return "redirect:/receta/"+id;
	}
	
	// PUTMAPPING
	
	@PutMapping("/perfil/actualizar/{id}")
	public String actualizarPerfil(HttpSession session,
						@PathVariable("id") Long id,  
						@Valid  @ModelAttribute("usuario")Usuario usuario,
						BindingResult result, Model model) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/login";
		}	
		
		Usuario user = serv.buscarUsuario(id);
		
		if(result.hasErrors()) {
			model.addAttribute("usuario", user);
			return "editarPerfil.jsp";
		} else {

			serv.guardarUsuario(usuario);
			Usuario userTemp2 = serv.buscarUsuario(id);
			session.setAttribute("usuarioEnSesion", userTemp2);
			return "redirect:/perfil/"+id;
		}
	}

		
	
	// DELETEMAPPING
	@DeleteMapping("/borrar/imagen/{id}")
	public String borrarImagen(@PathVariable("id")Long imagenId, HttpSession session) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		serv.deleteImagen(imagenId);
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
	
	@DeleteMapping("/borrar/producto/{id}")
	public String borrarProducto(@PathVariable("id")Long id, HttpSession session) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		serv.deleteProducto(id);
		return "redirect:/";
	}
	
	@DeleteMapping("/borrar/producto/imagenes/{id}")
	public String borrarImagenProducto(@PathVariable("id")Long id, HttpSession session) {
		Usuario userTemp = (Usuario) session.getAttribute("usuarioEnSesion");
		if(userTemp == null) {
			return "redirect:/";
		}
		return "redirect:/";
	}
}
