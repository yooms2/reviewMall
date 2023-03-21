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
			height: 300px;
		}
	</style>
</head>
<body>
	<c:if test="${not empty adminLoginResult }">
		<script>
			alert('${adminLoginResult }');
		</script>
	</c:if>
	<c:if test="${not empty adminLoginError }">
		<script>
			alert('${adminLoginError }');
			history.back();
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<table>
			<caption>회원리스트</caption>
			<tr>
				<c:forEach var="dto" items="${members }">
					<td>${dto.mid }</td>
					<td>${dto.mname }</td>
					<td>${dto.mnickname }</td>
				</c:forEach>
			</tr>
		</table>
		<div class="paging">
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i eq pageNum }">
					[ <b> ${i } </b> ]
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/allView.do?pageNum=${i }"> ${i } </a> ]
				</c:if>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>