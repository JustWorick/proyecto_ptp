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
@Table(name="recetas")
public class Receta {
	
	// ATRIBUTOS <<====

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@NotEmpty(message="Este Campo no puede estar vacio")
	@Size(min=2, max=30, message="El nombre debe tener al menos, entre 2 y 30 caracteres")
	private String nombre;
	
	private String descripcion;
	
	@NotEmpty(message="Este Campo no puede estar vacio")
	private String preparacion;
	
	private int porciones;
	
	private double valoracionTotal;   //  <<==== es la suma de todas las valoraciones
	
    private int numeroValoraciones;  // <<==== cuenta el numero de valoraciones
    
    private double valoracionFinal; // <<==== es el resultado final de las valoraciones (valoracionTotal / numeroValoraciones)
    
    @Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	
	// CONSTRUCTOR Y RELACIONES <<====
	
	public Receta() {}
	
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
				name="recetas_tienen_ingredientes",
				joinColumns = @JoinColumn(name="receta_id"), 
				inverseJoinColumns = @JoinColumn(name="ingrediente_id") 
				)
	private List<Ingrediente> ingredientes;
	
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
				name="recetas_tienen_etiquetas",
				joinColumns = @JoinColumn(name="receta_id"), 
				inverseJoinColumns = @JoinColumn(name="etiqueta_id") 
				)
	private List<Etiqueta> etiquetas;
	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="usuario_id") 
	private Usuario creador;  
	
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
				name="recetas_favoritas",
				joinColumns = @JoinColumn(name="receta_id"), 
				inverseJoinColumns = @JoinColumn(name="usuario_id") 
				)
	private List<Usuario> usuarios;
	
	@OneToMany(mappedBy="recipe", fetch=FetchType.LAZY)
	private List<Comentario> comentariosDeReceta;
	
	
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
	public String getPreparacion() {
		return preparacion;
	}
	public void setPreparacion(String preparacion) {
		this.preparacion = preparacion;
	}
	public int getPorciones() {
		return porciones;
	}
	public void setPorciones(int porciones) {
		this.porciones = porciones;
	}
	public double getValoracionTotal() {
		return valoracionTotal;
	}
	public void setValoracionTotal(double valoracionTotal) {
		this.valoracionTotal = valoracionTotal;
	}
	public int getNumeroValoraciones() {
		return numeroValoraciones;
	}
	public void setNumeroValoraciones(int numeroValoraciones) {
		this.numeroValoraciones = numeroValoraciones;
	}
	public double getValoracionFinal() {
		return valoracionFinal;
	}
	public void setValoracionFinal(double valoracionFinal) {
		this.valoracionFinal = valoracionFinal;
	}
	public List<Ingrediente> getIngredientes() {
		return ingredientes;
	}
	public void setIngredientes(List<Ingrediente> ingredientes) {
		this.ingredientes = ingredientes;
	}
	public List<Etiqueta> getEtiquetas() {
		return etiquetas;
	}
	public void setEtiquetas(List<Etiqueta> etiquetas) {
		this.etiquetas = etiquetas;
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
	public Usuario getCreador() {
		return creador;
	}
	public void setCreador(Usuario creador) {
		this.creador = creador;
	}
	public List<Usuario> getUsuarios() {
		return usuarios;
	}
	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}
	public List<Comentario> getComentariosDeReceta() {
		return comentariosDeReceta;
	}
	public void setComentariosDeReceta(List<Comentario> comentariosDeReceta) {
		this.comentariosDeReceta = comentariosDeReceta;
	}
	
	// PREPERSIST

	@PrePersist
    public void calcularValoracionFinal() {
        if (numeroValoraciones == 0) {
        	valoracionFinal = 0.0;
        } else {
        	valoracionFinal = valoracionTotal / numeroValoraciones;
        }
    }
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date(); 
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date(); 
	}


}