package com.CodingDojo.Abraham.Interfaces;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.CodingDojo.Abraham.Modelos.Ingrediente;

public interface RepoIngrediente extends CrudRepository<Ingrediente, Long>{

	List<Ingrediente> findByRecetasIdContains(Long id);
	
}
