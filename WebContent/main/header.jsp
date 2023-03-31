<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		* {
			padding: 0;
		}
		#header {
			background-color: #808080;
			/* position: fixed; */
		}
		#header .logo img {
			width: 350px;
			text-align: center;
			margin: 0 auto;
			cursor: pointer;
		}
		#header a {
			text-decoration: none;
			color: black;
			font-size: 13pt;
		}
		#header .gnb {
			min-width: 800px;
		}
		#header .gnb ul {
			margin: 0 auto;
			overflow: hidden;
		}
		#header .gnb ul li {
			float: right;
			list-style: none;
			margin-right: 30px;
			padding-bottom: 10px;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<div id="header">
		<c:if test="${empty member and empty admin }">
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/boardList.do">게시판</a></li>
					<li><a href="${conPath }/productList.do">상품리스트</a></li>
					<li><a href="${conPath }/loginView.do">로그인</a></li>
					<li><a href="${conPath }/joinView.do">회원가입</a></li>
				</ul>
			</div>
			<div class="logo">
				<img src="${conPath }/img/reviewmall.gif" alt="REVIEWMALL" onclick="location.href='${conPath }/main.do'">
			</div>
		</c:if>
		<c:if test="${not empty member and empty admin }">
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/boardList.do">게시판</a></li>
					<li><a href="${conPath }/logout.do">로그아웃</a></li>
					<li><a href="${conPath }/productList.do">상품리스트</a></li>
					<li><a href="${conPath }/wishList.do?mid=${member.mid }">관심목록</a></li>
					<li><a href="${conPath }/modifyView.do">마이페이지</a></li>
					<li><a href="${conPath }/main.do">${member.mname } 님</a></li>
				</ul>
			</div>
			<div class="logo">
				<img src="${conPath }/img/reviewmall.gif" alt="REVIEWMALL" onclick="location.href='${conPath }/main.do'">
			</div>
		</c:if>
		<c:if test="${empty member and not empty admin }">
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/boardList.do">게시판</a></li>
					<li><a href="${conPath }/logout.do">로그아웃</a></li>
					<li><a href="${conPath }/productAddView.do">상품등록</a></li>
					<li><a href="${conPath }/productList.do">상품리스트</a></li>
					<li><a href="${conPath }/allView.do">${admin.aname } 님</a></li>
				</ul>
			</div>
			<div class="logo">
				<img src="${conPath }/img/reviewmall.gif" alt="REVIEWMALL" onclick="location.href='${conPath }/main.do'">
			</div>
		</c:if>
	</div>
</body>
</html>