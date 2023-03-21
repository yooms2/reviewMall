package com.lec.rm.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.rm.dao.MemberDao;
import com.lec.rm.dto.MemberDto;

public class MJoinService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mpwChk = request.getParameter("mpwChk");
		String mname = request.getParameter("mname");
		String mnickname = request.getParameter("mnickname");
		String mtel = request.getParameter("mtel");
		String memail = request.getParameter("memail");
		String mbirthStr = request.getParameter("mbirth");
		Date mbirth = null;
		if(!mbirthStr.equals("")) {
			mbirth = Date.valueOf(mbirthStr);
		}
		String mgender = request.getParameter("mgender");
		String maddress = request.getParameter("maddress");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.midConfirm(mid);
		if(result == MemberDao.NONEXIST) {
			MemberDto member = new MemberDto(mid, mpwChk, mname, mnickname, mtel, memail, mbirth, mgender, maddress, null);
			result = mDao.joinMember(member);
			if(result == MemberDao.SUCCESS) {
				HttpSession session = request.getSession();
				session.setAttribute("mid", mid);
				request.setAttribute("joinResult", "회원가입 완료되었습니다");
			} else {
				request.setAttribute("joinResult", "회원가입 실패하였습니다(정보가 너무 깁니다)");
			}
		} else {
			request.setAttribute("joinResult", "회원가입 실패하였습니다(중복된 아이디 입니다");
		}
	}
}
