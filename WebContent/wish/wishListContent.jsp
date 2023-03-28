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
		
	</style>
</head>
<body>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div id="content">
			<table>
				<caption>관심상품</caption>
					<tr>
						<th>상품번호</th>
						<td>${wish.pid }</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>${wish.pname }</td>
					</tr>
					<tr>
						<td colspan="2">
							<button onclick="location.href='${conPath }/wishListDelete.do?mid=${member.mid }&wid=${wish.wid }&pageNum=${param.pageNum }'">삭제</button>
							<button onclick="location.href='${conPath }/wishList.do?mid=${member.mid }&pageNum=${param.pageNum }'">관심목록</button>
						</td>
					</tr>
			</table>
		</div>
		<div class="footer">
		<jsp:include page="../main/footer.jsp"/>
		</div>
	</div>
</body>
</html>