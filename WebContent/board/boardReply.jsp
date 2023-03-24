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
</head>
<body>
	<c:if test="${empty member}">
		<script>
			alert('로그인 후 작성이 가능합니다');
			location.href="${conPath }/loginView.do";
		</script>
	</c:if>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div class="content">
			<form action="${conPath }/boardReply.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="bgroup" value="${oriBoard.bgroup }">
				<input type="hidden" name="bstep" value="${oriBoard.bstep }">
				<input type="hidden" name="bindent" value="${oriBoard.bindent }">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<table>
					<caption>${oriBoard.bid }번 답변글 작성</caption>
					<tr>
						<th>작성자</th>
						<td>${member.mnickname }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="btitle" required="required" size="58"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="bcontent" rows="20" cols="60" required="required"></textarea>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="bfilename"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="글쓰기" class="btn">
							<input type="reset" value="다시쓰기" class="btn">
							<input type="button" value="글목록" class="btn" onclick="location.href='${conPath }/boardList.do?pageNum=${param.pageNum }'">
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