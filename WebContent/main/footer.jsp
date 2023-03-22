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
		footer {
			width: 100%;
			height: 100px;
			line-height: 40px;
			background-color: #808080;
		}
		footer #footer_content {
			padding: 10px 0;
		}
		footer p {
			text-align: center;
			font-weight: bold;
			font-size: 11pt;
		}
		footer p img {
			cursor: pointer;
		}
		footer a {
			color: black;
			text-decoration: none;
		}
	</style>
</head>
<body>
<footer>
	<div id="footer_content">
	<c:if test="${not empty admin }">
		<p>
			<img src="${conPath }/img/reviewmall.gif" alt="REVIEWMALL" width="100px;" onclick="location.href='${conPath }/main.do'">
			(주)REVIEWMALL | 서울특별시 서대문구 신촌로 141 위고인빌딩 1층
		</p>
		<p>Copyright© 2023 tj . All rights reserved.</p>
	</c:if>
	<c:if test="${empty admin }">
		<p>
			<img src="${conPath }/img/reviewmall.gif" alt="REVIEWMALL" width="100px;" onclick="location.href='${conPath }/main.do'">
			(주)REVIEWMALL | 서울특별시 서대문구 신촌로 141 위고인빌딩 1층
		</p>
		<p>Copyright© 2023 tj . All rights reserved. | <a href="${conPath }/adminLoginView.do">관리자 모드</a></p>
	</c:if>
	</div>
</footer>
</body>
</html>