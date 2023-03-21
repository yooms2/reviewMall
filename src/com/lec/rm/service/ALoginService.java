package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.rm.dao.AdminDao;
import com.lec.rm.dto.AdminDto;

public class ALoginService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aid = request.getParameter("aid");
		String apw = request.getParameter("apw");
		AdminDao aDao = AdminDao.getInstance();
		int result = aDao.adminLogin(aid, apw);
		if(result == AdminDao.SUCCESS) {
			HttpSession session = request.getSession();
			AdminDto admin = aDao.getAdmin(aid);
			session.setAttribute("admin", admin);
			request.setAttribute("adminLoginResult", "관리자 페이지입니다");
		} else {
			request.setAttribute("adminLoginError", "로그인 실패하였습니다");
		}
	}
}
