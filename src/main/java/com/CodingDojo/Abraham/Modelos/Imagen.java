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
@Table(name="imagenes")
public class Imagen {

	// ATRIBUTOS <<====
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	private String nombre;
	
	private String url;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	
	// CONSTRUCTOR Y RELACIONES <<====
	
	public Imagen () {}
	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="usuario_id") 
	private Usuario creadorImg;   
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="receta_id")
	private Receta recetaImg;           
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="producto_id") 
	private Producto productoImg;
	
	
	// GETTERS Y SETTERS

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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	public Usuario getCreadorImg() {
		return creadorImg;
	}
	public void setCreadorImg(Usuario creadorImg) {
		this.creadorImg = creadorImg;
	}
	public Receta getRecetaImg() {
		return recetaImg;
	}
	public void setRecetaImg(Receta recetaImg) {
		this.recetaImg = recetaImg;
	}
	public Producto getProductoImg() {
		return productoImg;
	}
	public void setProductoImg(Producto productoImg) {
		this.productoImg = productoImg;
	}        
	
	
	// ELIMINAR ? 
	public void eliminarRelaciones() {
		this.creadorImg = null;
		this.recetaImg = null;
		this.productoImg = null;
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
