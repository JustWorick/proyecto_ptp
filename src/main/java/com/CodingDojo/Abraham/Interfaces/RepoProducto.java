package com.CodingDojo.Abraham.Interfaces;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.CodingDojo.Abraham.Modelos.Producto;

public interface RepoProducto extends CrudRepository<Producto, Long>{

	List<Producto> findAll();
	
	List<Producto> findAllByCreadorProductoId(Long id);
	
	Producto findByNombreContains(String nombre);
}
