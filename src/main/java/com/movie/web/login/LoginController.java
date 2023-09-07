package com.movie.web.login;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;

	@Autowired
	private Util util;

	@GetMapping("/login")
	public String login() {

		return "/login";
	}

	@PostMapping("/login")
	public ModelAndView login(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);

		Map<String, Object> result = loginService.login(map);
		ModelAndView mv = new ModelAndView();

		System.out.println(result);

		if (util.obj2Int(result.get("count")) == 1) {
			// 세션올리기
			session.setAttribute("id", map.get("id"));
			session.setAttribute("name", result.get("m_name"));
			session.setAttribute("nickName", result.get("m_nicname"));
			session.setAttribute("status", result.get("m_status"));
			// 메인으로 이동하기
			mv.setViewName("redirect:/");
		} else {
			String error = "아이디나 비밀번호가 올바르지않습니다.";
			mv.addObject("error", error);
			mv.addObject("redirect:/login");
		}
		return mv;

	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("id") != null) {
			session.removeAttribute("id");

		}
		if (session.getAttribute("name") != null) {
			session.removeAttribute("name");
		}
		// 다른 방법
		session.invalidate();
		return "redirect:/";
	}
	

	

}	
