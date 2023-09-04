package com.movie.web.reseat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReseatController {
	@Autowired
	private ReseatService reseatService;
	
	
	
	@GetMapping("/reseat")
	public String reseat(Model model) {
		String id =reseatService.list();
		model.addAttribute("mid", id);
		return "/reseat";
		
	}
}
