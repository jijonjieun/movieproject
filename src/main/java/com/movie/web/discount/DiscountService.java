package com.movie.web.discount;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiscountService {
	@Autowired
	private DiscountDAO discountDAO;
}
