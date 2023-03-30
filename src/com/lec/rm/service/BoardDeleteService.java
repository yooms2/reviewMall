package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.dao.BoardDao;

public class BoardDeleteService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 원글만 삭제
//		int bid = Integer.parseInt(request.getParameter("bid"));
//		BoardDao bDao = BoardDao.getInstance();
//		int result = bDao.boardDelete(bid);
//		if(result == BoardDao.SUCCESS) {
//			request.setAttribute("boardResult", "게시글 삭제하였습니다");
//		} else {
//			request.setAttribute("boardResult", "게시글을 삭제하는데 실패하였습니다");
//		}
		
		int bgroup = Integer.parseInt(request.getParameter("bgroup"));
		int bstep = Integer.parseInt(request.getParameter("bstep"));
		int bindent = Integer.parseInt(request.getParameter("bindent"));
		BoardDao bDao = BoardDao.getInstance();
		int result = bDao.boardDelete(bgroup, bstep, bindent);
		if(result >= BoardDao.SUCCESS) {
			request.setAttribute("boardResult", "게시글 삭제하였습니다");
		} else {
			request.setAttribute("boardResult", "게시글을 삭제하는데 실패하였습니다");
		}
	}
}
