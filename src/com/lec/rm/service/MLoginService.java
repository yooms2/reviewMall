package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.rm.dao.MemberDao;
import com.lec.rm.dto.MemberDto;

public class MLoginService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.loginMember(mid, mpw);
		if(result == MemberDao.SUCCESS) {
			HttpSession session = request.getSession();
			MemberDto member = mDao.getMember(mid);
			session.setAttribute("member", member);
		} else {
			request.setAttribute("loginError", "아이디/비밀번호가 틀렸습니다");
		}
	}
}
