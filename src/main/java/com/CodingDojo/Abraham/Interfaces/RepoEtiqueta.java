package com.CodingDojo.Abraham.Interfaces;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.CodingDojo.Abraham.Modelos.Etiqueta;

public interface RepoEtiqueta extends CrudRepository<Etiqueta, Long> {

	List<Etiqueta> findAll();
}
