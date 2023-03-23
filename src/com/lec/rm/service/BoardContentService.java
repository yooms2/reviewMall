package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.dao.BoardDao;
import com.lec.rm.dto.BoardDto;

public class BoardContentService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bid = Integer.parseInt(request.getParameter("bid"));
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("board", bDao.boardContent(bid));
	}
}
