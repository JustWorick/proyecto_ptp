package com.CodingDojo.Abraham.Modelos;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="etiquetas")
public class Etiqueta {

	// ATRIBUTOS <<====

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@NotEmpty(message="Este Campo no puede estar vacio")
	@Size(min=2, max=30, message="El nombre debe tener al menos, entre 2 y 30 caracteres")
	private String nombre;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	
	// CONSTRUCTOR Y RELACIONES <<====
	
	public Etiqueta () {}
	
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
				name="recetas_tienen_etiquetas",
				joinColumns = @JoinColumn(name="etiqueta_id"), 
				inverseJoinColumns = @JoinColumn(name="receta_id") 
				)
	private List<Receta> recetas;
	
	
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
				name="etiquetas_productos",
				joinColumns = @JoinColumn(name="etiqueta_id"), 
				inverseJoinColumns = @JoinColumn(name="producto_id") 
				)
	private List<Producto> productos;
	
	
	// GETTERS Y SETTERS
	
	public List<Producto> getProductos() {
		return productos;
	}
	public void setProductos(List<Producto> productos) {
		this.productos = productos;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
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
	public List<Receta> getRecetas() {
		return recetas;
	}
	public void setRecetas(List<Receta> recetas) {
		this.recetas = recetas;
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
