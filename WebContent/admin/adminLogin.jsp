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
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<style>
		#content {
			width: 800px;
			height: 800px;
			line-height: 80px;
			margin: 0 auto;
			text-align: center;
		}
	</style>
</head>
<body>
	<c:if test="${not empty member }">
		<script>
			alert('접근 제한 페이지 입니다');
			history.back();
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<form action="${conPath }/adminLogin.do" method="post">
			<table>
				<caption>관리자 로그인</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="aid" required="required" autofocus="autofocus" placeholder="아이디">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="apw" required="required" placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="submit" value="로그인">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>