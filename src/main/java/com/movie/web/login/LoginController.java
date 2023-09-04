package com.movie.web.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/login")
	public String login() {
		
		return "/login";
	}
	
	
	@PostMapping("/login")
	public String login2() {
		
		return "/login";
	}
}
