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
</head>
<body>
	<c:if test="${not empty loginError }">
		<script>
			alert('${loginError }');
		</script>
	</c:if>
	<c:if test="${not empty modifyResult }">
		<script>
			alert('${modifyResult }');
		</script>
	</c:if>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div class="content">
			<table>
				<tr>
					<td><img src="${conPath }/img/join.gif" onclick="location.href='${conPath }/joinView.do'"></td>
				</tr>
				<tr>
					<td><img src="${conPath }/img/shirt.gif"  onclick="location.href='${conPath }/joinView.do'"></td>
				</tr>
				<tr>
					<td><img src="${conPath }/img/community.gif"  onclick="location.href='${conPath }/joinView.do'"></td>
				</tr>
			</table>
		</div>
		<div class="footer">
		<jsp:include page="../main/footer.jsp"/>
		</div>
	</div>
</body>
</html>