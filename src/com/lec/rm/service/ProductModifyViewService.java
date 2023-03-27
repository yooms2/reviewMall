package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.dao.ProductDao;

public class ProductModifyViewService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		ProductDao pDao = ProductDao.getInstance();
		request.setAttribute("product", pDao.productContent(pid));
	}
}
