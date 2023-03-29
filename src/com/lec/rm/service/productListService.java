package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.dao.ProductDao;

public class ProductListService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum = "1";
//		String mid = request.getParameter("mid");
//		String mname = request.getParameter("mname");
		String pname = request.getParameter("pname");
		int currentPage = Integer.parseInt(pageNum);
		final int  PAGESIZE = 40, BLOCKSIZE = 5;
		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		ProductDao pDao = ProductDao.getInstance();
		request.setAttribute("productList", pDao.productList(startRow, endRow, pname));
		int productCount = pDao.productCount(pname);
		int pageCnt = (int)Math.ceil((double)productCount/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE) * BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
	}
}
