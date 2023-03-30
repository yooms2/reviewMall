package com.lec.rm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.dao.ProductDao;
import com.lec.rm.dao.WishListDao;

public class ProductDeleteService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		ProductDao pDao = ProductDao.getInstance();
		WishListDao wDao = WishListDao.getInstance();
		int cnt = wDao.withdrawWishList(pid);
		int result = pDao.deleteProduct(pid);
		if(result == ProductDao.SUCCESS) {
			request.setAttribute("productResult", "상품이 삭제되었습니다");
		} else {
			request.setAttribute("productError", "상품을 삭제하는데 실패하였습니다");
		}
	}
}
