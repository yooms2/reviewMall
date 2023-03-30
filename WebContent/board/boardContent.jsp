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
			<table>
				<caption>${board.bid }번 글</caption>
				<tr>
					<th>작성자</th>
					<td>${board.mnickname }님</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${board.btitle }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${board.bcontent }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
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
						<c:if test="${member.mid eq board.mid or not empty admin}">
							<button onclick="location.href='${conPath }/boardModifyView.do?bid=${board.bid }&pageNum=${param.pageNum }'">수정하기</button>
						</c:if>
						<c:if test="${member.mid eq board.mid or not empty admin }">
							<button onclick="location.href='${conPath }/boardDelete.do?bgroup=${board.bgroup }&bstep=${board.bstep }&bindent=${board.bindent }&pageNum=${param.pageNum }'">삭제하기</button>
						</c:if>
						<c:if test="${not empty member or not empty admin }">
							<button onclick="location.href='${conPath}/boardReplyView.do?bid=${board.bid }&pageNum=${param.pageNum }'">답변하기</button>
						</c:if>
						<button onclick="location.href='${conPath}/boardList.do?pageNum=${param.pageNum }'">글목록</button>
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