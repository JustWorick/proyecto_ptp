package com.CodingDojo.Abraham.Servicio;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.CodingDojo.Abraham.Interfaces.RepoComentario;
import com.CodingDojo.Abraham.Interfaces.RepoEtiqueta;
import com.CodingDojo.Abraham.Interfaces.RepoImagen;
import com.CodingDojo.Abraham.Interfaces.RepoIngrediente;
import com.CodingDojo.Abraham.Interfaces.RepoProducto;
import com.CodingDojo.Abraham.Interfaces.RepoReceta;
import com.CodingDojo.Abraham.Interfaces.RepoUsuario;
import com.CodingDojo.Abraham.Interfaces.RepoVideo;
import com.CodingDojo.Abraham.Modelos.Comentario;
import com.CodingDojo.Abraham.Modelos.Etiqueta;
import com.CodingDojo.Abraham.Modelos.Imagen;
import com.CodingDojo.Abraham.Modelos.Ingrediente;
import com.CodingDojo.Abraham.Modelos.Producto;
import com.CodingDojo.Abraham.Modelos.Receta;
import com.CodingDojo.Abraham.Modelos.Usuario;
import com.CodingDojo.Abraham.Modelos.Video;

@Service
public class Servicio {

	@Autowired
	private RepoComentario rCom;
	
	@Autowired 
	private RepoEtiqueta rEti;
	
	@Autowired
	private RepoImagen rIma;
	
	@Autowired
	private RepoIngrediente rIng;
	
	@Autowired
	private RepoProducto rPro;
	
	@Autowired
	private RepoReceta rRec;
	
	@Autowired
	private RepoUsuario rUsu;
	
	@Autowired
	private RepoVideo rVid;
	
	//USUARIOS
	public Usuario registroUsuario(Usuario nuevoUsuario, BindingResult result) {

		String contrasena = nuevoUsuario.getPassword();
		String confirmacion = nuevoUsuario.getConfirmacion();
		if(!contrasena.equals(confirmacion)) {
	
			result.rejectValue("confirmacion", "Matches", "Las contraseñas no coinciden");
		}
		
		String email = nuevoUsuario.getEmail();
		Usuario existeUsuario = rUsu.findByEmail(email);
		if(existeUsuario != null) {
			result.rejectValue("email", "Unique", "El correo ingresado ya se encuentra registrado.");
		}

		if(result.hasErrors()) {
			return null;
		} else {

			String contra_encriptada = BCrypt.hashpw(contrasena, BCrypt.gensalt());
			nuevoUsuario.setPassword(contra_encriptada);
			return rUsu.save(nuevoUsuario);
		}
		
	}
	
	public Usuario loginUsuario(String email, String password) {

		Usuario usuarioInicioSesion = rUsu.findByEmail(email); 
		if(usuarioInicioSesion == null) {
			return null;
		}
		
		if(BCrypt.checkpw(password, usuarioInicioSesion.getPassword())) {
			return usuarioInicioSesion;
		}
		return null;
	}
	
		public List<Usuario> todosUsuarios() {
			return rUsu.findAll();
		}
	
		public Usuario guardarUsuario(Usuario nuevoUsuario) {
			return rUsu.save(nuevoUsuario);
		}
		
		public Usuario buscarUsuario(Long id) {
			return rUsu.findById(id).orElse(null);
		}
		
		public void borrarUsuario(Long id) {
			rUsu.deleteById(id); 
		}

		public Usuario buscarPorNombre(String palabra) {
			return rUsu.findByNombreContains(palabra);
		}
		
		public Usuario buscarPorEmail(String email) {
			return rUsu.findByEmail(email);
		}
	
	//FIND
	
	public Comentario buscarComentarioPorId(Long id) {
		return rCom.findById(id).orElse(null);
	}
	
	public List<Comentario> buscarTodosComentariosPorReceta(Long id){
		return rCom.findAllByRecipeId(id);
	}
	
	public List<Comentario> buscarTodosComentarios() {
		return rCom.findAll();
	}
	
	public List<Imagen> buscarImagenPorProducto(Long id) {
		return rIma.findByProductoImgContains(id);
	}
	
	public List<Imagen> buscarImagenPorReceta(Long id) {
		return rIma.findByRecetaImgContains(id);
	}
	
	public Optional<Imagen> buscarImagenPorId(Long id) {
		return rIma.findById(id);
	}
	
	public List<Ingrediente> buscarTodosIngredientes() {
		return rIng.findAll();
	}
	
	public List<Producto> buscarTodosProductos()  {
		return rPro.findAll();
	}
	
	public List<Producto> buscarTodosProductosPorNombre(String nombre){
		return rPro.findAllByNombreContains(nombre);
	}
	
	public List<Producto> buscarTodosProductosPorCreador(Long id){
		return rPro.findAllByCreadorProductoId(id);
	}
	
	public Producto buscarProductoPorNombre(String nombre) {
		return rPro.findByNombreContains(nombre);
	}
	
	public List<Etiqueta> buscarTodasEtiquetas(){
		return rEti.findAll();
	}
	
	public List<Receta> buscarTodasRecetas() {
		return rRec.findAll();
	}
	
	public List<Receta> buscarRecetaPorNombreEtiqueta(String palabra) {
		return rRec.findAllByEtiquetasNombreContains(palabra);
	}
	
	public List<Receta> buscarTodasRecetasPorNombre(String palabra){
		return rRec.findAllByNombreContains(palabra);
	}
	
	public List<Receta> buscarRecetaPorNombreIngrediente(String nombre) {
		return rRec.findByIngredientesNombreContains(nombre);
	}
	
	public List<Receta> buscarTop5Recetas() {
		return rRec.findTop5ByOrderByValoracionFinalDesc();
	}
	
	public List<Receta> buscarRecetasPorCreadorId(Long id){
		return rRec.findAllByCreadorId(id);
	}
	
	public Receta buscarRecetaPorId(Long id) {
		return rRec.findById(id).orElse(null);
	}
	
	public Receta buscarRecetaPorNombreCreador(String nombre) {
		return rRec.findByCreadorNombreContains(nombre);
	}
	
	public Receta buscarRecetaPorNombre(String nombre) {
		return rRec.findByNombreContains(nombre);
	}
	
	public Video buscarVideoPorReceta(Long id) {
		return rVid.findByRecetasVidId(id);
	}
	
	//Save
	
	public Comentario guardarComentario(Comentario comentario) {
		return rCom.save(comentario);
	}

	public Etiqueta guardarEtiqueta(Etiqueta etiqueta) {
		return rEti.save(etiqueta);
	}
	
	public Imagen guardarImagen(Imagen imagen) {
		return rIma.save(imagen);
	}
	
	public Ingrediente guardarIngrediente(Ingrediente ingrediente) {
		return rIng.save(ingrediente);
	}
	
	public Producto guardarProducto(Producto producto) {
		return rPro.save(producto);
	}
	
	public Receta guardarReceta(Receta receta) {
		return rRec.save(receta);
	}
	
	public Video guardarVideo(Video video) {
		return rVid.save(video);
	}
	
	
	
	// DELETE
	
	public void deleteTodasImagenes() {          // <<<======= USAR SOLO PARA PRUEBAS
		List<Imagen> imagenes = rIma.findAll();
		for(Imagen img:imagenes) {
			
			img.eliminarRelaciones();
			Path rutaImagen = Paths.get("target/classes/static", img.getUrl());
		    
		    // RUTA ABSOLUTA 
		    String filePath = rutaImagen.toAbsolutePath().toString();
		    
		    System.out.println("Esta es la ruta Absoluta: "+filePath);
		    
			try { 
	            File file = new File(filePath);
	            if(file.delete()) { 
	               System.out.println(file.getName() + " is deleted!");
	            } else {
	               System.out.println("Delete operation is failed.");
	               }
	         }
	           catch(Exception e)
	           {
	               System.out.println("Failed to Delete image !!");
	           }
			
			rIma.delete(img);
		}
	}
	public void deleteImagen(Long id) {
		
		Imagen imagen = rIma.findById(id).orElse(null);
		
		imagen.eliminarRelaciones();
		Path rutaImagen = Paths.get("target/classes/static", imagen.getUrl());
	    
	    // RUTA ABSOLUTA 
	    String filePath = rutaImagen.toAbsolutePath().toString();
	    
	    System.out.println("Esta es la ruta Absoluta: "+filePath);
	    
		try { 
            File file = new File(filePath);
            if(file.delete()) { 
               System.out.println(file.getName() + " is deleted!");
            } else {
               System.out.println("Delete operation is failed.");
               }
         }
           catch(Exception e)
           {
               System.out.println("Failed to Delete image !!");
           }
		
		rIma.deleteById(id);
	}

	public void deleteReceta(Long id) {
		Receta rec = rRec.findById(id).orElse(null);
		List<Imagen> imagenes = rec.getImagenesRec();
		for(Imagen ima:imagenes) {
			deleteImagen(ima.getId());
		}
		rec.getComentariosDeReceta().clear();
		rec.getUsuarios().clear();
		rec.getImagenesRec().clear();
		rec.getEtiquetas().clear();
		rRec.save(rec);
		rRec.delete(rec);
	}
	
	public void deleteTodasRecetas() {
		List<Receta> recetas = rRec.findAll();
		for(Receta rec:recetas) {
			deleteReceta(rec.getId());
		}
	}
	
	public void deleteProducto(Long id) {
		Producto pro = rPro.findById(id).orElse(null);
		List<Imagen> imagenes = pro.getImagenesPro();
		for(Imagen ima:imagenes) {
			deleteImagen(ima.getId());
		}
		pro.getComentariosProducto().clear();
		pro.getEtiquetasProducto().clear();
		pro.getImagenesPro().clear();
		rPro.save(pro);
		rPro.delete(pro);
	}
}
