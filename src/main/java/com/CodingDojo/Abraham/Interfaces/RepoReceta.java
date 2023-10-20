package com.CodingDojo.Abraham.Interfaces;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.CodingDojo.Abraham.Modelos.Receta;

public interface RepoReceta extends CrudRepository<Receta, Long>{

	List<Receta> findAll();
	
	List<Receta> findAllByCreadorId(Long id);
	
	List<Receta> findTop5ByOrderByValoracionFinalDesc();
	
	Receta findByNombreContains(String palabra);
	
	List<Receta> findAllByEtiquetasNombreContains(String nombre);  // <<====== falta testeo
	
	Receta findByCreadorNombreContains(String nombre);
	
	List<Receta> findByIngredientesNombreContains(String nombre);
	
	List<Receta> findAllByNombreContains(String nombre);
}
