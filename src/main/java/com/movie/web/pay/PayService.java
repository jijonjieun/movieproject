package com.movie.web.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayService {
	@Autowired
	private PayDAO payDAO;

}
