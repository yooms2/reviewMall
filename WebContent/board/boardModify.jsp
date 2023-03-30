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
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div id="content">
			<form action="${conPath }/boardModify.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="bid" value="${board.bid }">
				<input type="hidden" name="dbBfilename" value="${board.bfilename }">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<table>
					<caption>${board.bid }번 글 수정</caption>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="mnickname" value="${board.mnickname }" readonly="readonly"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="btitle" value="${board.btitle }" required="required"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="bcontent" rows="20" cols="60">${board.bcontent }</textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="bfilename"><br>
							현재 파일 : 
							<c:if test="${not empty board.bfilename }">
								<a href="${conPath }/fileUp/${board.bfilename }" target="_blank">${board.bfilename }</a>
							</c:if>
							<c:if test="${empty board.bfilename }">
								첨부파일없음
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정하기" class="btn">
							<input type="reset" value="이전" class="btn">
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