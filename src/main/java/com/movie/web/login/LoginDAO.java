package com.movie.web.login;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	Map<String, Object> login(Map<String, Object> map);

	Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson);

	Map<String, Object> userNaverLoginPro(Map<String, Object> apiJson);

	void setNaverConnection(Map<String, Object> apiJson);



}
