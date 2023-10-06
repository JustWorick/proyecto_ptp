package com.CodingDojo.Abraham.Interfaces;

import org.springframework.data.repository.CrudRepository;

import com.CodingDojo.Abraham.Modelos.Video;

public interface RepoVideo extends CrudRepository<Video, Long>{

	Video findByRecetasVidId(Long id);
}
