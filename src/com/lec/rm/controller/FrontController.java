package com.lec.rm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.service.ALoginService;
import com.lec.rm.service.BoardContentService;
import com.lec.rm.service.BoardDeleteService;
import com.lec.rm.service.BoardListService;
import com.lec.rm.service.BoardModifyService;
import com.lec.rm.service.BoardModifyViewService;
import com.lec.rm.service.BoardReplyService;
import com.lec.rm.service.BoardReplyViewService;
import com.lec.rm.service.BoardWriteService;
import com.lec.rm.service.MAllViewService;
import com.lec.rm.service.MJoinService;
import com.lec.rm.service.MLoginService;
import com.lec.rm.service.MLogoutService;
import com.lec.rm.service.MModifyService;
import com.lec.rm.service.MWithdrawService;
import com.lec.rm.service.MemailConfirmService;
import com.lec.rm.service.MidConfirmService;
import com.lec.rm.service.MnickcnameConfirmService;
import com.lec.rm.service.ProductAddService;
import com.lec.rm.service.ProductContentService;
import com.lec.rm.service.ProductDeleteService;
import com.lec.rm.service.Service;
import com.lec.rm.service.WishListAddService;
import com.lec.rm.service.WishListContentService;
import com.lec.rm.service.WishListDeleteService;
import com.lec.rm.service.WishListService;
import com.lec.rm.service.ProductListService;
import com.lec.rm.service.ProductModifyService;
import com.lec.rm.service.ProductModifyViewService;
import com.lec.rm.service.ProductSearchService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int modifyView = 0;
	private int writeView = 0;
	private int addView = 0;
	private int proModi = 0;
	private int adminView = 0;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		
		// 비회원
		if(command.equals("/main.do")) {
			viewPage = "main/main.jsp";
		} else if(command.equals("/joinView.do")) {
			viewPage = "member/join.jsp";
		} else if(command.equals("/midConfirm.do")) {
			service = new MidConfirmService();
			service.execute(request, response);
			viewPage = "member/midConfirm.jsp";
		} else if(command.equals("/mnicknameConfirm.do")) {
			service = new MnickcnameConfirmService();
			service.execute(request, response);
			viewPage = "member/mnicknameConfirm.jsp";
		} else if(command.equals("/memailConfirm.do")) {
			service = new MemailConfirmService();
			service.execute(request, response);
			viewPage = "member/memailConfirm.jsp";
		} else if(command.equals("/join.do")) {
			service = new MJoinService();
			service.execute(request, response);
			viewPage = "loginView.do";
			
		// 관리자
		} else if(command.equals("/adminLoginView.do")) {
			viewPage = "admin/adminLogin.jsp";
			adminView = 1;
		} else if(command.equals("/adminLogin.do")) {
			if(adminView == 1) {
				service = new ALoginService();
				service.execute(request, response);
				adminView = 0;
			}
			viewPage = "allView.do";
		} else if(command.equals("/allView.do")) {
			service = new MAllViewService();
			service.execute(request, response);
			viewPage = "member/mAllView.jsp";
			
		// 회원
		} else if(command.equals("/loginView.do")) {
			viewPage = "member/login.jsp";
		} else if(command.equals("/login.do")) {
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		} else if(command.equals("/logout.do")) {
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		} else if(command.equals("/modifyView.do")) {
			viewPage= "member/modify.jsp";
			modifyView = 1;
		} else if(command.equals("/modify.do")) {
			if(modifyView == 1) {
				service = new MModifyService();
				service.execute(request, response);
				modifyView = 0;
			}
			viewPage = "main/main.jsp";
		} else if(command.equals("/withdraw.do")){
			service = new MWithdrawService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			
		// 게시판
		} else if(command.equals("/boardWriteView.do")) {
			viewPage = "board/boardWrite.jsp";
			writeView = 1;
		} else if(command.equals("/boardWrite.do")) {
			if(writeView == 1) {
				service = new BoardWriteService();
				service.execute(request, response);
				writeView = 0;
			}
			viewPage = "boardList.do";
		} else if(command.equals("/boardList.do")) {
			service = new BoardListService();
			service.execute(request, response);
			viewPage = "board/boardList.jsp";
		} else if(command.equals("/boardContent.do")) {
			service = new BoardContentService();
			service.execute(request, response);
			viewPage = "board/boardContent.jsp";
		} else if(command.equals("/boardModifyView.do")) {
			service = new BoardModifyViewService();
			service.execute(request, response);
			viewPage = "board/boardModify.jsp";
		} else if(command.equals("/boardModify.do")) {
			service = new BoardModifyService();
			service.execute(request, response);
			viewPage = "boardList.do";
		} else if(command.equals("/boardDelete.do")) {
			service = new BoardDeleteService();
			service.execute(request, response);
			viewPage = "boardList.do";
		} else if(command.equals("/boardReplyView.do")) {
			service = new BoardReplyViewService();
			service.execute(request, response);
			viewPage = "board/boardReply.jsp";
		} else if(command.equals("/boardReply.do")) {
			service = new BoardReplyService();
			service.execute(request, response);
			viewPage = "boardList.do";
			
		// 상품
		} else if(command.equals("/productAddView.do")) {
			viewPage = "product/productAdd.jsp";
			addView = 1;
		} else if(command.equals("/productAdd.do")) {
			if(addView == 1) {
				service = new ProductAddService();
				service.execute(request, response);
				addView = 0;
			}
			viewPage = "productList.do";
		} else if(command.equals("/productList.do")) {
			service = new ProductListService();
			service.execute(request, response);
			viewPage = "product/productList.jsp";
		} else if(command.equals("/productContent.do")) {
			service = new ProductContentService();
			service.execute(request, response);
			viewPage = "product/productContent.jsp";
		} else if(command.equals("/productModifyView.do")) {
			service = new ProductModifyViewService();
			service.execute(request, response);
			viewPage = "product/productModify.jsp";
			proModi = 1;
		} else if(command.equals("/productModify.do")) {
			if(proModi == 1) {
				service = new ProductModifyService();
				service.execute(request, response);
				proModi = 0;
			}
			viewPage = "productList.do";
		} else if(command.equals("/productDelete.do")) {
			service = new ProductDeleteService();
			service.execute(request, response);
			viewPage = "productList.do";
//		} else if(command.equals("/productSearch.do")){
//			service = new ProductSearchService();
//			service.execute(request, response);
//			viewPage = "productList.do";
			
		// 관심목록
		} else if(command.equals("/wishListAdd.do")) {
			service = new WishListAddService();
			service.execute(request, response);
			viewPage = "wishList.do";
		} else if(command.equals("/wishList.do")) {
			service = new WishListService();
			service.execute(request, response);
			viewPage = "wish/wishList.jsp";
		} else if(command.equals("/wishListContent.do")) {
			service = new WishListContentService();
			service.execute(request, response);
			viewPage = "wish/wishListContent.jsp";
		} else if(command.equals("/wishListDelete.do")) {
			service = new WishListDeleteService();
			service.execute(request, response);
			viewPage = "wishList.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
