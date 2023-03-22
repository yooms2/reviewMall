package com.lec.rm.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.rm.dao.MemberDao;
import com.lec.rm.dto.MemberDto;

public class MModifyService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String dbMpw = request.getParameter("dbMpw");
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		if(mpw.equals("")) {
			mpw = dbMpw;
		}
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
		MemberDto member = new MemberDto(mid, mpw, mname, mnickname, mtel, memail, mbirth, mgender, maddress, null);
		int result = mDao.modifyMember(member);
		if(result == MemberDao.SUCCESS) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			request.setAttribute("modifyResult", "회원정보가 수정되었습니다");
		} else {
			request.setAttribute("modifyError", "정보수정에 실패하였습니다");
		}
	}
}
