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
		.content {
			width: 1800px;
			height: 14500px;
		}
		.content td {
			margin: 50px;
		}
		.paging {
			margin-bottom: 20px;
		}
	</style>
</head>
<body>
	<c:if test="${not empty productAddResult }">
		<script>
			alert('${productAddResult }');
		</script>
	</c:if>
	<c:if test="${not empty productAddError }">
		<script>
			alert('${productAddError }');
			history.back();
		</script>
	</c:if>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div class="content">
			<form action="${conPath }/productSearch.do">
				<table>
					<tr>
						<td>
							<input type="text" name="schPname" placeholder="상품명을 입력해 주세요">
							<input type="submit" value="검색">
						</td>
					</tr>
				</table>
			</form>
			<br>
			<table>
				<caption>상품 리스트</caption>
				<c:if test="${productCount == 0 }">
					<tr><td colspan="4">등록된 상품이 없습니다</td></tr>
				</c:if>
				<c:if test="${productCount != 0 }">
					<c:forEach var="product" items="${productList }">
						<tr>
							<td>
								<c:forEach var="i" begin="1" end="4">
										<img src="${conPath }/photoUp/${product.paimage }" alt="대표이미지"><br>
										${product.pname }<br>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.pprice }"/>원<br>
										${product.psize }
								</c:forEach>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<c:if test="${startPage > BLOCKSIZE }">
				[ <a href="${conPath }/productList.do?pageNum=${startPage-1 }"> 이전 </a> ]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					[ <b> ${i } </b> ]
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/productList.do?pageNum=${i }"> ${i } </a> ]
				</c:if>
			</c:forEach>
			<c:if test="${endPage < pageCnt }">
				[ <a href="${conPath }/productList.do?pageNum=${endPage+1 }"> 다음 </a> ]
			</c:if>
		</div>
		<div class="footer">
		<jsp:include page="../main/footer.jsp"/>
		</div>
	</div>
</body>
</html>