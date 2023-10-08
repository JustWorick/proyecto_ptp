package com.CodingDojo.Abraham.Interfaces;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.CodingDojo.Abraham.Modelos.Imagen;

public interface RepoImagen extends CrudRepository<Imagen, Long>{

	List<Imagen> findByRecetaImgContains(Long id);
	
	List<Imagen> findByProductoImgContains(Long id);
	
	Optional<Imagen> findById(Long id);
}
