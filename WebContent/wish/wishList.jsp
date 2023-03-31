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
	<style>
		tr:nth-child(3n+1):hover {
			color: skyblue;
			cursor: pointer;
			font-weight: bold;
		}
		
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function() {
			$('tr').click(function() {
				var wid = $(this).children().eq(0).text();
				// alert(wid);
				if(!isNaN(wid)) {
					location.href="${conPath }/wishListContent.do?wid="+wid+"&pageNum=${pageNum }";
				}
			});
		});
	</script>
</head>
<body>
	<c:if test="${not empty wishResult }">
		<script>
			alert('${wishResult }');
		</script>
	</c:if>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<c:set var="no" value="${no }"/>
		<div class="content">
			<table>
				<caption>${member.mname }(${member.mid })님의 관심목록</caption>
				<c:if test="${wishList.size() eq 0 }">
					<tr><td colspan="2">관심상품이 없습니다</td></tr>
				</c:if>
				<c:if test="${wishList.size() != 0 }">
					<c:forEach var="wish" items="${wishList }">
						<c:set var="no" value="${no+1 }"/>
						<tr>
							<td style="display:none">${wish.wid }</td>
							<td colspan="2" style="background-color:#d9d9d9">${no }번째 관심목록</td>
						</tr>
						<tr>
							<th>상품번호</th>
							<td>${wish.pid }</td>
						</tr>
						<tr>
							<th>상품명</th>
							<td>${wish.pname }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="paging">
				<c:if test="${startPage > BLOCKSIZE }">
					[ <a href="${conPath }/wishList.do?mid=${member.mid }&pageNum=${startPage-1 }"> 이전 </a> ]
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i eq pageNum }">
						[ <b> ${i } </b> ]
					</c:if>
					<c:if test="${i != pageNum }">
						[ <a href="${conPath }/wishList.do?mid=${member.mid }&pageNum=${i }"> ${i } </a> ]
					</c:if>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
					[ <a href="${conPath }/wishList.do?mid=${member.mid }&pageNum=${endPage+1 }"> 다음 </a> ]
				</c:if>
			</div>
		</div>
		<div class="footer">
		<jsp:include page="../main/footer.jsp"/>
		</div>
	</div>
</body>
</html>