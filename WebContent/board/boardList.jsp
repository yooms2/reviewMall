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
			height: 900px;
		}
		#content table tr {
			cursor: pointer;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function() {
			$('tr').click(function() {
				var bid = Number($(this).children().eq(0).text());
				if(!isNaN(bid)) {
					location.href="${conPath }/boardContent.do?bid="+bid+"&pageNum=${pageNum }";
				}
			});
		});
	</script>
</head>
<body>
	<c:if test="${not empty boardResult }">
		<script>
			alert('${boardResult }');
		</script>
	</c:if>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div id="content">
			<table>
				<caption>게시판</caption>
				<tr>
					<th><a href="${conPath }/boardWriteView.do">글쓰기</a></th>
				</tr>
			</table>
			<br>
			<table>
				<tr><th>글번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
				<c:if test="${boardList.size() == 0 }">
					<tr><td colspan="5">등록된 글이 없습니다</td></tr>
				</c:if>
				<c:if test="${boardList.size() != 0 }">
					<c:forEach var="board" items="${boardList }">
						<tr>
							<td>${board.bid }</td>
							<td style="text-align: left;">
								<c:forEach var="i" begin="1" end="${board.bindent }">
									<c:if test="${i == board.bindent }">ㄴ</c:if>
									<c:if test="${i != board.bindent }"> &nbsp; &nbsp; </c:if>
								</c:forEach>
								${board.btitle }
								<c:if test="${not empty board.bfilename }">
									<img src="${conPath }/img/file.jpg" width="15">
								</c:if>
								<c:if test="${board.brdate eq  today }">
									<img src="${conPath }/img/new.png" width="15">
								</c:if>
								<c:if test="${board.bhit > 20 }">
									<img src="${conPath }/img/hot.png" width="25">
								</c:if>
							</td>
							<td>${board.mnickname }</td>
							<td><fmt:formatDate value="${board.brdate }" type="date" pattern="yyyy-MM-dd"/></td>
							<td>${board.bhit }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="paging">
				<c:if test="${startPage > BLOCKSIZE }">
					[ <a href="${conPath }/boardList.do?pageNum=${startPage-1 }"> 이전 </a> ]
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i == pageNum }">
						[ <b> ${i } </b> ]
					</c:if>
					<c:if test="${i != pageNum }">
						[ <a href="${conPath }/boardList.do?pageNum=${i }"> ${i } </a> ]
					</c:if>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
					[ <a href="${conPath }/boardList.do?pageNum=${endPage+1 }"> 다음 </a> ]
				</c:if>
			</div>
		</div>
		<div class="footer">
		<jsp:include page="../main/footer.jsp"/>
		</div>
	</div>
</body>
</html>