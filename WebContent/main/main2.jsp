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
	<link href="${conPath }/css/style3.css" rel="stylesheet">
</head>
<body>
	<c:if test="${not empty loginError }">
		<script>
			alert('${loginError }');
		</script>
	</c:if>
	<c:if test="${not empty logoutResult }">
		<script>
			alert('${logoutResult }');
		</script>
	</c:if>
	<c:if test="${not empty modifyResult }">
		<script>
			alert('${modifyResult }');
		</script>
	</c:if>
	<c:if test="${not empty withdrawResult }">
		<script>
			alert('${withdrawResult }');
		</script>
	</c:if>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div class="content">
			<table>
				<tr>
					<td colspan="2">
						<img src="${conPath }/img/main1.png"  onclick="location.href='${conPath }/productList.do'">
					</td>
				</tr>
				<tr>
					<td>
						<iframe src="https://www.fashionn.com/board/list_new.php?table=1006" frameborder=0 framespacing=0>
						</iframe>
					</td>
					<td>
						<img src="${conPath }/img/main2.png" onclick="location.href='${conPath }/joinView.do'" style="height:533px">
					</td>
				</tr>
				<tr>
					<td>
						<img src="${conPath }/img/main3.png"  onclick="location.href='${conPath }/boardList.do'">
					</td>
					<td>
						<h2>
							자유게시판
						</h2>
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