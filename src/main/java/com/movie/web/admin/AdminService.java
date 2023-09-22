package com.movie.web.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	public List<Movielist> list() {
	
		return adminDAO.list();
	}

	public List<Map<String, Object>> memberList() {
		return adminDAO.memberList();
	}

	public int gradeChange(Map<String, String> map) {
		return adminDAO.gradeChange(map);
	}

	public Map<String, Object> userpage(int mno) {
		return adminDAO.userpage(mno);
	}

	public int nicknameChange(Map<String, Object> map) {
		return adminDAO.nicknameChange(map);
	}

	public void pointChange(Map<String, Object> map) {
		adminDAO.pointChange(map);

	}

	public Map<String, Object> adminLogin(Map<String, Object> map) {
		return adminDAO.adminLogin(map);
	}

	public List<Map<String, Object>> memberSearch(Map<String, Object> map) {
		return adminDAO.memberSearch(map);
	}

	public String totalMember() {
		return adminDAO.totalMember();
	}

	public String totalIncome() {
		return adminDAO.totalIncome();
	}

}
