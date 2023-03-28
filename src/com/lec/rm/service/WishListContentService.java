package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.dao.WishListDao;

public class WishListContentService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int wid = Integer.parseInt(request.getParameter("wid"));
		WishListDao wDao = WishListDao.getInstance();
		request.setAttribute("wish", wDao.wishProduct(wid));
	}
}
