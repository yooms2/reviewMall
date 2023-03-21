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
	<link href="${conPath }/css/header.css" rel="stylesheet">
</head>
<body>
	<div id="header">
		<c:if test="${empty member and empty admin }">
			<div class="gnb">
				<ul>
					<li><a href="#">게시판</a></li>
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
					<li><a href="#">게시판</a></li>
					<li><a href="#">로그아웃</a></li>
					<li><a href="#">정보수정</a></li>
					<li><a>${member.mname } 님</a></li>
				</ul>
			</div>
			<div class="logo">
				<img src="${conPath }/img/reviewmall.gif" alt="REVIEWMALL" onclick="location.href='${conPath }/main.do'">
			</div>
		</c:if>
		<c:if test="${empty member and not empty admin }">
			<div class="gnb">
				<ul>
					<li><a href="#">게시판</a></li>
					<li><a href="#">로그아웃</a></li>
					<li><a>${admin.aname } 님</a></li>
				</ul>
			</div>
			<div class="logo">
				<img src="${conPath }/img/reviewmall.gif" alt="REVIEWMALL" onclick="location.href='${conPath }/main.do'">
			</div>
		</c:if>
	</div>
</body>
</html>