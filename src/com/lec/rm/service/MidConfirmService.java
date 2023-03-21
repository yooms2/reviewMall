package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.dao.MemberDao;

public class MidConfirmService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.midConfirm(mid);
		if(result == MemberDao.EXIST) {
			request.setAttribute("midConfirm", "<b>사용중인 ID 입니다</b>");
		} else {
			request.setAttribute("midConfirm", "<strong>사용 가능한 ID 입니다</strong");
		}
	}
}
