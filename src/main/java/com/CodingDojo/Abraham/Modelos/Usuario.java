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
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="usuarios")
public class Usuario {

	// ATRIBUTOS <<====
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@NotEmpty(message="Este Campo no puede estar vacio")
	@Size(min=2, max=30, message="El nickname debe tener al menos, entre 2 y 30 caracteres")
	private String nickname;
	
	@NotEmpty(message="Este Campo no puede estar vacio")
	@Size(min=2, max=25, message="El nombre debe tener al menos, entre 2 y 25 caracteres")
	private String nombre;
	
	@NotEmpty(message="Este Campo no puede estar vacio")
	@Size(min=2, max=25, message="El apellido debe tener al menos, entre 2 y 25 caracteres")
	private String apellido;
	
	@NotEmpty(message="Este campo no puede estar vacio")
	@Email(message="Por favor ingrese un email valido")
	private String email;
	
	@NotEmpty(message="Este campo no puede estar vacio")
	@Size(min=6,message="El password debe tener al menos 6 caracteres")
	private String password;
	
	@Transient
	@NotEmpty(message="Este campo no puede estar vacio")
	@Size(min=6,message="La confirmacion debe tener al menos 6 caracteres")
	private String confirmacion;
	
	private String region;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	
	// CONSTRUCTOR Y RELACIONES <<====
	
	public Usuario() {}
	
	
	@OneToMany(mappedBy="creador", fetch=FetchType.LAZY)
	private List<Receta> misRecetas; 
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
				name="recetas_favoritas",
				joinColumns = @JoinColumn(name="usuario_id"), //ID de la clase en la que estoy
				inverseJoinColumns = @JoinColumn(name="receta_id") //ID de la contraparte
				)
	private List<Receta> misRecetasFav;
	
	@OneToMany(mappedBy="redactor", fetch=FetchType.LAZY)
	private List<Comentario> comentarios; 
	
	@OneToMany(mappedBy="creadorProducto", fetch=FetchType.LAZY)
	private List<Producto> misProductos; 
	
	
	// GETTERS Y SETTERS
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmacion() {
		return confirmacion;
	}
	public void setConfirmacion(String confirmacion) {
		this.confirmacion = confirmacion;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
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
	public List<Receta> getMisRecetas() {
		return misRecetas;
	}
	public void setMisRecetas(List<Receta> misRecetas) {
		this.misRecetas = misRecetas;
	}
	public List<Receta> getMisRecetasFav() {
		return misRecetasFav;
	}
	public void setMisRecetasFav(List<Receta> misRecetasFav) {
		this.misRecetasFav = misRecetasFav;
	}
	public List<Comentario> getComentarios() {
		return comentarios;
	}
	public void setComentarios(List<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
	public List<Producto> getMisProductos() {
		return misProductos;
	}
	public void setMisProductos(List<Producto> misProductos) {
		this.misProductos = misProductos;
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
