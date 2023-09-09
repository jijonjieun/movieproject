package com.movie.web.login;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;

	@Autowired
	private Util util;
	
	@Autowired
	NaverLoginBO naverloginbo;

	@GetMapping("/login")
	public String login(Model model,HttpSession session) {
		String naverAuthUrl = naverloginbo.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);

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
	
	//네이버로그인
	/*
	 * @RequestMapping(value="login") public String Login(Model model,HttpSession
	 * session) { System.out.println("login"); String naverAuthUrl =
	 * naverloginbo.getAuthorizationUrl(session); model.addAttribute("naverUrl",
	 * naverAuthUrl);
	 * 
	 * return "login"; }
	 */
	
	
	@RequestMapping(value="/login/naver",  method = {RequestMethod.GET,RequestMethod.POST})
	public String userNaverLoginPro(Model model,@RequestParam Map<String,Object> paramMap, @RequestParam String code, @RequestParam String state,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();

		OAuth2AccessToken oauthToken;
		oauthToken = naverloginbo.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		String apiResult = naverloginbo.getUserProfile(oauthToken);
		System.out.println("apiResult =>"+apiResult);
		ObjectMapper objectMapper =new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
//맵으로 사용자 정보를 저장함
		Map<String, Object> naverConnectionCheck = loginService.naverConnectionCheck(apiJson);
		System.out.println(naverConnectionCheck);
		
		if(naverConnectionCheck==null) {

			model.addAttribute("id",apiJson.get("id"));
			model.addAttribute("name",apiJson.get("name"));
			return "naverdetail";
		} else {
			Map<String, Object> loginCheck = loginService.userNaverLoginPro(apiJson);
			System.out.println(session.getAttribute("name"));
		}
			return "test";
		}
	
	
	@RequestMapping(value="/login/naver/register", method=RequestMethod.POST)
	public Map<String, Object> userNaverRegisterPro(@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		Integer registerCheck = loginService.userNaverRegisterPro(paramMap);
		System.out.println(registerCheck);
		
		if(registerCheck != null && registerCheck > 0) {
			Map<String, Object> loginCheck = loginService.userNaverLoginPro(paramMap);
			session.setAttribute("userInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		return resultMap;
	}	

}	
