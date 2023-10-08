package com.CodingDojo.Abraham.Interfaces;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.CodingDojo.Abraham.Modelos.Comentario;

public interface RepoComentario extends CrudRepository<Comentario, Long>{

	List<Comentario> findByRecipeId(Long id);   
	
	List<Comentario> findAll();
}
