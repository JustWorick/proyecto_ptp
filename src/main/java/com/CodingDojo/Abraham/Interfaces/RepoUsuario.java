package com.CodingDojo.Abraham.Interfaces;

import org.springframework.data.repository.CrudRepository;

import com.CodingDojo.Abraham.Modelos.Usuario;

public interface RepoUsuario extends CrudRepository<Usuario, Long>{

	Usuario findByEmail(String email);
	
}
