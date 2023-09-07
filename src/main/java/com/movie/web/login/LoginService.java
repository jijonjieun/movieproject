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
	
	
	
	//카카오 로그인 서비스 로직
	

}

