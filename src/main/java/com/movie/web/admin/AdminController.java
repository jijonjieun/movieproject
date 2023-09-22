package com.movie.web.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AdimUtil adminUtil;
	
	//메인화면
	@GetMapping(value = { "/","admin" })
	public String admin(HttpSession session) {

	if(session.getAttribute("adminInfo") == null) {
		return "admin/login";
	}
		return "admin/member";
	}

	//로그인
	@PostMapping("/login")
	public String adminLogin(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);

		Map<String, Object> result = adminService.adminLogin(map);

		System.out.println("나한테오는거야?"+result);

		if (adminUtil.obj2Int(result.get("count")) == 1 && adminUtil.obj2Int(result.get("m_status")) == 0) {
			// 세션올리기
			System.out.println("여기옴?");
			session.setAttribute("mid", map.get("id"));
			session.setAttribute("adminInfo", result);
			System.out.println(session.getAttribute("adminInfo"));
			// 메인으로 이동하기
			return "redirect:/admin/member";
		} else {
			return "redirect:/admin/login";
		}

	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {

		session.setMaxInactiveInterval(0); 
		session.invalidate();

		return "redirect:/mhome";
	}
	
	
	
	@GetMapping("/movieupload")
	public String adminmvuplode(Model model) {
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		List<Movielist> list = new ArrayList<Movielist>();
		list = adminService.list();
		
		
		
	
		for (Movielist movie : list) {
			JSONObject movieJson = new JSONObject();
			movieJson.put("mv_poster", movie.getMv_poster());
			movieJson.put("mv_code", movie.getMv_code());
			movieJson.put("mv_name", movie.getMv_name());
			movieJson.put("mv_sdate", movie.getMv_sdate());
			movieJson.put("mv_maker", movie.getMv_maker());
			movieJson.put("au_status", movie.getAu_status());
			movieJson.put("au_acccnt", movie.getAc_acccnt());

			jsonArray.add(movieJson);
		
		}
	
		json.put("jsonlist", jsonArray);
		 model.addAttribute("jsonData", json.toString());
		System.out.println(json.toString());
		
	return "admin/movieupload";

}
	
	
	// member
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public ModelAndView member(@RequestParam Map<String, Object> map, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("adminInfo") != null) {
	
		
		//회원 검색기능
	    // 검색어가 없을 경우 모든 회원 목록을 보여줌
	    if (map.get("search") == null || map.get("searchV") == null) {
	        mv.addObject("memberList", adminService.memberList());
	        mv.addObject("totalMember",adminService.totalMember());
	        mv.addObject("totalIncome",adminService.totalIncome());
	    } else {
	        List<Map<String, Object>> searchList = adminService.memberSearch(map);
	        System.out.println("맵에머있는데"+map);
	        System.out.println("여기에뭐가있어"+searchList);
	        mv.addObject("memberList", searchList);
	        mv.addObject("totalMember",adminService.totalMember());
	        mv.addObject("totalIncome",adminService.totalIncome());
	        
	    }
	    
		mv.setViewName("admin/member");
	    
		} else {
			mv.addObject("redirect:/login");
		}
		return mv;
	}
	
	// gradeChange
	@RequestMapping(value = "/gradeChange", method = RequestMethod.GET)
	public String gradeChange(@RequestParam Map<String, String> map) {
		int result = adminService.gradeChange(map);
		System.out.println(result);
		return "redirect:/admin/member";
	}
	
	
	// gradeChange 마이페이지에서
	@ResponseBody
	@RequestMapping(value = "/gradeChange2", method = RequestMethod.POST)
	public String gradeChange2(@RequestParam Map<String, String> map) {
		JSONObject json = new JSONObject();
		int result = adminService.gradeChange(map);
		System.out.println("되나요"+result);
		json.put("result",result);
		return json.toString();
	}
	
	
	//회원정보를 볼수있다.
	@GetMapping("/userpage")
	public String userpage(@RequestParam(value="mno") int mno, Model model, HttpSession session) {
		System.out.println("회원번호잡아오나"+mno);
		
		if(session.getAttribute("adminInfo") == null) {
			return "/login";
		}
		else {
		Map<String, Object> myInfo = adminService.userpage(mno);
		model.addAttribute("myInfo", myInfo);
		
		
		return "admin/userpage";
	}
	}
	
	//부적절한 닉네임 변경
	@ResponseBody
	@PostMapping("/nicknameChange")
	public String nicknameChange(@RequestParam Map<String, Object> map, Model model) {
		JSONObject json = new JSONObject();
		int change = adminService.nicknameChange(map);
		
		System.out.println("닉변하면 담는 것들은?" + map);
		json.put("change",change);
		
		return json.toString();
	}
	
	
	//포인트변경
	@PostMapping("/pointChange")
	public String pointChange(@RequestParam Map<String, Object> map) {
		
		adminService.pointChange(map);
		
		  String mno = (String) map.get("mno"); // 멤버 고유번호 가져오기
		    return "redirect:/admin/userpage?mno=" + mno;
		
	}
	
	
	//제재알림메일
	@ResponseBody
	@PostMapping("/email")
	public String mail(@RequestParam Map<String, Object> map, Model model) throws EmailException {
		JSONObject json = new JSONObject();
		System.out.println("맵에 뭐가 담겨있니"+map);
		if(map != null) {
		adminUtil.htmlMailSender(map);
		json.put("send", "1");
		} else {
			json.put("send", "0");
		}
		return json.toString();
	}
	
	
	
	

	
	

	
	
	
	
}
