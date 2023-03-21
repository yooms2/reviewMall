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
	<link href="${conPath }/css/footer.css" rel="stylesheet">
</head>
<body>
	<c:if test="${not empty admin }">
	<div id="footer">
		<p><img src="${conPath }/img/reviewmall.gif" alt="REVIEWMALL" width="100px;" onclick="location.href='${conPath }/main.do'"> (주)REVIEWMALL</p>
		<p>서울특별시 서대문구 신촌로 141 위고인빌딩 1층</p>
		<p>Copyright© 2023 tj . All rights reserved.</p>
	</div>
	</c:if>
	<c:if test="${empty admin }">
	<div id="footer">
		<p><img src="${conPath }/img/reviewmall.gif" alt="REVIEWMALL" width="100px;" onclick="location.href='${conPath }/main.do'"> (주)REVIEWMALL</p>
		<p>서울특별시 서대문구 신촌로 141 위고인빌딩 1층</p>
		<p>Copyright© 2023 tj . All rights reserved. | <a href="${conPath }/adminLoginView.do">관리자 모드</a></p>
	</div>
	</c:if>
</body>
</html>