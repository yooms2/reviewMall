package com.lec.rm.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.dao.ProductDao;
import com.lec.rm.dto.ProductDto;

public class ProductSearchService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pname = request.getParameter("pname");
		ProductDao pDao = ProductDao.getInstance();
		ArrayList<ProductDto> product = pDao.getProducts(pname);
		System.out.println(product);
		request.setAttribute("product", product);
	}
}
