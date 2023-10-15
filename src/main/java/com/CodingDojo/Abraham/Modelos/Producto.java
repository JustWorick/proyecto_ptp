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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="productos")
public class Producto {

	// ATRIBUTOS <<====
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@NotEmpty(message="Este Campo no puede estar vacio")
	@Size(min=2, max=30, message="El nombre debe tener al menos, entre 2 y 30 caracteres")
	private String nombre;
	
	@NotEmpty(message="Este Campo no puede estar vacio")
	private String descripcion;
	
	@OneToMany(mappedBy="productoImg", fetch=FetchType.LAZY)
	private List<Imagen> imagenesPro;

    // Nuevo campo para el precio
    private double precio;

    // Nuevo campo para la imagen
    private String imagen;
    
    private String informacionNutricional;
	
	/*
		
		
		
		
		FALTA AGREGAR LA INFORMACION NUTRICIONAL Y DONDE ENCONTRAR EL PRODUCTO
		
		
		
		
	*/
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	
	// CONSTRUCTOR Y RELACIONES <<====
	
	public Producto () {}
	
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
				name="etiquetas_productos",
				joinColumns = @JoinColumn(name="producto_id"), 
				inverseJoinColumns = @JoinColumn(name="etiqueta_id") 
				)
	private List<Etiqueta> etiquetasProducto;
	
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
				name="comentarios_productos",
				joinColumns = @JoinColumn(name="producto_id"), 
				inverseJoinColumns = @JoinColumn(name="comentario_id") 
				)
	private List<Comentario> comentariosProducto;
	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="usuario_id") 
	private Usuario creadorProducto;

	
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
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
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
	public List<Etiqueta> getEtiquetasProducto() {
		return etiquetasProducto;
	}
	public void setEtiquetasProducto(List<Etiqueta> etiquetasProducto) {
		this.etiquetasProducto = etiquetasProducto;
	}
	public List<Comentario> getComentariosProducto() {
		return comentariosProducto;
	}
	public void setComentariosProducto(List<Comentario> comentariosProducto) {
		this.comentariosProducto = comentariosProducto;
	}
	public Usuario getCreadorProducto() {
		return creadorProducto;
	}
	public void setCreadorProducto(Usuario creadorProducto) {
		this.creadorProducto = creadorProducto;
	}     
	public List<Imagen> getImagenesPro() {
		return imagenesPro;
	}
	public void setImagenesPro(List<Imagen> imagenesPro) {
		this.imagenesPro = imagenesPro;
	}
	public double getPrecio() {
		return precio;
	}		
	public void setPrecio(double precio) {
		this.precio = precio;
	}	
	public String getImagen() {
		return imagen;
	}	
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public String getInformacionNutricional() {
		return informacionNutricional;
	}
	public void setInformacionNutricional(String informacionNutricional) {
		this.informacionNutricional = informacionNutricional;
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
