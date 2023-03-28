package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.dao.WishListDao;

public class WishListDeleteService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		int wid = Integer.parseInt(request.getParameter("wid"));
		WishListDao wDao = WishListDao.getInstance();
		int result = wDao.deleteWish(mid, wid);
		if(result == WishListDao.SUCCESS) {
			request.setAttribute("wishResult", "상품을 관심목록에서 삭제하였습니다");
		} else {
			request.setAttribute("wishResult", "상품을 관심목록에서 삭제하는데 실패하였습니다");
		}
	}
}
