package com.movie.web.detail;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DetailController {

	
	@GetMapping("/detail")
	public String detailPage(@RequestParam("mv_code") String mvCode, Model model) {
	  
		
	    return "detail"; 
	}
	
}
