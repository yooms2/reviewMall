package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.rm.dao.WishListDao;
import com.lec.rm.dto.WishListDto;

public class WishListAddService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		String pname = request.getParameter("pname");
		int pid = Integer.parseInt(request.getParameter("pid"));
		WishListDao wDao = WishListDao.getInstance();
		WishListDto wishList = new WishListDto(0, mid, mname, pname, pid);
		int result = wDao.addWish(mid, pid);
		if(result == WishListDao.SUCCESS) {
			request.setAttribute("wishResult", "관심목록에 추가되었습니다");
		} else {
			request.setAttribute("wishError", "이미 관심목록에 있는 상품입니다");
		}
	}
}
