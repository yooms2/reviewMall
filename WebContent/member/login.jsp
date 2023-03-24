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
	<link href="${conPath }/css/login.css" rel="stylesheet">
</head>
<body>
	<c:if test="${not empty joinResult }">
		<script>
			alert('${joinResult}');
		</script>
	</c:if>
	<c:if test="${not empty joinError }">
		<script>
			alert('${joinError}');
			back.history();
		</script>
	</c:if>
	<div id="login-form">
		<h1>회원 로그인</h1>
		<form action="${conPath }/login.do" method="post">
			<div class="int">
				<input type="text" name="mid" value="${mid }" placeholder="아이디" required="required">
			</div>
			<div class="int">
				<input type="password" name="mpw" placeholder="비밀번호" required="required">
			</div>
			<div class="login">
				<input type="submit" value="로그인">
			</div>
		</form>
		<div class="caption">
			<a href="${conPath }/joinView.do">회원가입</a>
		</div>
	</div>
</body>
</html>