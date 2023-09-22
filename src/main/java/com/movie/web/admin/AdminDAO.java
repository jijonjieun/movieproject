package com.movie.web.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {

	List<Movielist> list();

	List<Map<String, Object>> memberList();

	int gradeChange(Map<String, String> map);

	Map<String, Object> userpage(int mno);

	int nicknameChange(Map<String, Object> map);

	void pointChange(Map<String, Object> map);

	Map<String, Object> adminLogin(Map<String, Object> map);

	List<Map<String, Object>> memberSearch(Map<String, Object> map);

	String totalMember();

	String totalIncome();

}
