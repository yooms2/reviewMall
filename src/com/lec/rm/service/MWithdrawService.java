package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.rm.dao.BoardDao;
import com.lec.rm.dao.MemberDao;
import com.lec.rm.dto.MemberDto;

public class MWithdrawService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mid = null;
		MemberDto sessionMember = (MemberDto) session.getAttribute("member");
		if(sessionMember != null) {
			mid = sessionMember.getMid();
		}
		BoardDao bDao = BoardDao.getInstance();
		int cnt = bDao.withdrawBoard(mid);
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.withdrawMember(mid);
		session.invalidate();
		if(result == MemberDao.SUCCESS) {
			request.setAttribute("withdrawResult", "회원탈퇴가 완료되었습니다");
		} else {
			request.setAttribute("withResult", "다시 시도해 주시기 바랍니다");
		}
	}
}
