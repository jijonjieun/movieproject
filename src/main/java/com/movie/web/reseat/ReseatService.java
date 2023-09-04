package com.movie.web.reseat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReseatService {
	@Autowired
	private ReseatDAO reseatDAO;
	

	public String list() {
		 return reseatDAO.list();
	}

}
