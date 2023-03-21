package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.dao.MemberDao;

public class MnickcnameConfirmService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mnickname = request.getParameter("mnickname");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.mnicknameConfirm(mnickname);
		if(result == MemberDao.EXIST) {
			request.setAttribute("mnicknameConfirm", "<b>사용중인 닉네임 입니다</b>");
		} else {
			request.setAttribute("mnicknameConfirm", "<strong>사용 가능한 닉네임 입니다</strong>");
		}
	}
}
