package com.CodingDojo.Abraham.Modelos;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity
@Table(name="comentarios")
public class Comentario {
	
	// ATRIBUTOS <<====
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	private String contenido;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	
	// CONSTRUCTOR Y RELACIONES <<====
	
	public Comentario () {}
	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="usuario_id")
	private Usuario redactor;  
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="receta_id")
	private Receta recipe;
	
	
	// GETTERS Y SETTERS

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getContenido() {
		return contenido;
	}
	public void setContenido(String contenido) {
		this.contenido = contenido;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Usuario getRedactor() {
		return redactor;
	}
	public void setRedactor(Usuario redactor) {
		this.redactor = redactor;
	}
	public Receta getRecipe() {
		return recipe;
	}
	public void setRecipe(Receta recipe) {
		this.recipe = recipe;
	}        
	
	
	// PREPERSIST

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date(); 
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date(); 
	}
	
	
}
