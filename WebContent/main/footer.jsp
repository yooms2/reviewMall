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
		body {
			margin: 0;
			background-color: #f3e3b4; 
		}
		footer {
			width: 100%;
			height: 100px;
			line-height: 40px;
			background-color: #e79418;
			min-width: 600px;
		}
		footer p {
			text-align: center;
			font-weight: bold;
			font-size: 11pt;
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
			<a href="${conPath }/main.do">(주)REVIEWMALL</a> | 서울특별시 서대문구 신촌로 141 위고인빌딩 1층
		</p>
		<p>Copyright© 2023 tj . All rights reserved.</p>
	</c:if>
	<c:if test="${empty admin }">
		<p>
			<a href="${conPath }/main.do">(주)REVIEWMALL</a> | 서울특별시 서대문구 신촌로 141 위고인빌딩 1층
		</p>
		<p>Copyright© 2023 tj . All rights reserved. | <a href="${conPath }/adminLoginView.do">관리자 모드</a></p>
	</c:if>
	</div>
</footer>
</body>
</html>