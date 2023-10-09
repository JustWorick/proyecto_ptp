package com.CodingDojo.Abraham.Controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.CodingDojo.Abraham.Modelos.Usuario;
import com.CodingDojo.Abraham.Servicio.Servicio;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorLogin {

	@Autowired
	private Servicio serv;
	
	
	@GetMapping("/login")
	public String registro(@ModelAttribute("usuario")Usuario nuevoUsuario) {
		return "login.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("usuarioEnSesion");
		return "redirect:/";
	}
	
	@GetMapping("/registro")
	public String singUp(@ModelAttribute("usuario")Usuario nuevoUsuario) {
		return "registro.jsp";
	}
	
	@PostMapping("/registro")
	public String registrarCliente(HttpSession session, @Valid @ModelAttribute("usuario")Usuario nuevoUsuario, BindingResult result, Model model) {
		serv.registroUsuario(nuevoUsuario, result);
		
		if(result.hasErrors()) {
			return "registro.jsp";
		}else {
			session.setAttribute("usuarioEnSesion", nuevoUsuario);
			return "redirect:/";
		}
	}
	@PostMapping("/login")
	public String login(@RequestParam("email")String email,
						@RequestParam("password")String password,
						HttpSession session, RedirectAttributes flash) {
		Usuario usuario = serv.loginUsuario(email, password);
		
		if(usuario == null) {
			flash.addFlashAttribute("error_login", "El email o el password son incorrectos");
			return "redirect:/login";
		}else {
			session.setAttribute("usuarioEnSesion", usuario);
			return "redirect:/";
		}
	}
}
