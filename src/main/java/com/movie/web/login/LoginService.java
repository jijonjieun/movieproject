package com.movie.web.login;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	@Autowired
	private LoginDAO loginDAO;

	public Map<String, Object> login(Map<String, Object> map) {
		return loginDAO.login(map);
	}

	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson) {
		return loginDAO.naverConnectionCheck(apiJson);
	}


	public Map<String, Object> userNaverLoginPro(Map<String, Object> apiJson) {
		return loginDAO.userNaverLoginPro(apiJson);
	}

	public void setNaverConnection(Map<String, Object> apiJson) {
		
	}



}

