package com.CodingDojo.Abraham.Interfaces;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.CodingDojo.Abraham.Modelos.Usuario;

public interface RepoUsuario extends CrudRepository<Usuario, Long>{

	Usuario findByEmail(String email);
	
	Usuario findByNombreContains(String palabra);
	
	List<Usuario> findAll();
}
