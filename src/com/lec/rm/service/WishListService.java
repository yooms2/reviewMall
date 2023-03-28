package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.dao.WishListDao;

public class WishListService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum = "1";
//		int wid = Integer.parseInt(request.getParameter("wid"))
		String mid = request.getParameter("mid");
//		String pname = request.getParameter("pname");
//		int pid = Integer.parseInt(request.getParameter("pid"));
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 5, BLOCKSIZE = 10;
		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		WishListDao wDao = WishListDao.getInstance();
//		System.out.println(startRow + " ~ " + endRow +"까지");
		request.setAttribute("wishList", wDao.wishList(startRow, endRow, mid));
		int wishCount = wDao.wishCount(mid);
		int pageCnt = (int)Math.ceil((double)wishCount/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE) * BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
//		System.out.println(startPage + "쪽 ~ " + endPage +"쪽까지");
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
	}
}
