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
			height: 800px;
		}
	</style>
</head>
<body>
	<c:if test="${empty member and empty admin }">
		<script>
			alert('게시판 글쓰기는 로그인 후에 가능합니다');
			history.back();
		</script>
	</c:if>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div id="content">
			<form action="${conPath }/boardWrite.do" method="post" enctype="multipart/form-data">
				<table>
					<caption>글쓰기</caption>
					<tr>
						<th>제목</th>
						<td><input type="text" name="btitle" required="required" size="25"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="bcontent" rows="20" cols="60"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="bfilename"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="글쓰기" class="btn">
							<input type="reset" value="다시쓰기" class="btn">
							<input type="button" value="글목록" class="btn" onclick="location.href='${conPath }/boardList.do'">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="footer">
		<jsp:include page="../main/footer.jsp"/>
		</div>
	</div>
</body>
</html>