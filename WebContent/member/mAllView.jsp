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
			height: 600px;
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
			<c:forEach var="dto" items="${members }">
				<tr>
					<td style="text-align:center;">
						아이디 : ${dto.mid } &nbsp;
						이름 : ${dto.mname } &nbsp;
						닉네임 : ${dto.mnickname }
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">
			<c:if test="${BLOCKSIZE < startPage }">
				<a href="${conPath }/allView.do?pageNum=${startPage-1 }">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i eq pageNum }">
					[ <b> ${i } </b> ]
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/allView.do?pageNum=${i }"> ${i } </a> ]
				</c:if>
			</c:forEach>
			<c:if test="${endPage < pageCnt }">
				<a href="${conPath }/allView.do?pageNum=${endPage+1 }">[다음]</a>
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>