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
	<link href="${conPath }/css/style2.css" rel="stylesheet">
	<style>
		
	</style>
</head>
<body>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div class="content">
			<table>
				<caption>${member.mname }(${member.mid })님의 관심목록</caption>
				<tr>
					<th>no</th>
				</tr>
				<tr>
					<th>상품번호</th>
					<td>${product.pid }</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>${product.pname }</td>
				</tr>
			</table>
		</div>
		<div class="footer">
		<jsp:include page="../main/footer.jsp"/>
		</div>
	</div>
</body>
</html>