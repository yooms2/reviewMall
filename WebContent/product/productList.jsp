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
			/* width: 1800px; */
			height: 4300px;
		}
		.content td {
			margin: 50px;
		}
		.paging {
			margin-bottom: 20px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function() {
			$('td').click(function() {
				var pid = $(this).children().eq(0).text();
				// alert(pid);
				if(!isNaN(pid)) {
					location.href="${conPath }/productContent.do?pid="+pid+"&pageNum=${pageNum }";
				}
			});
			/* $('.search').keyup(function() {
				var pname = $(this).val().trim();
				alert(pname);
				location.href="${conPath }/productSearch.do?pname="+{product.pname };
			}); */
		});
	</script>
</head>
<body>
	<c:if test="${not empty productResult }">
		<script>
			alert('${productResult }');
		</script>
	</c:if>
	<c:if test="${not empty productError }">
		<script>
			alert('${productError }');
			history.back();
		</script>
	</c:if>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div class="content">
			<form action="${conPath }/productList.do">
				<input type="text" name="pname" class="search" maxlength="33" value="${param.pname }" placeholder="상품명을 입력해 주세요">
				<input type="submit" value="검색" style="width:50px">
				<%-- <input type="hidden" name="mid" value="${member.mid }">
				<input type="hidden" name="mname" value="${member.mname }"> --%>
			</form>
			<br>
			<table>
				<caption>상품 리스트</caption>
				<c:if test="${productList.size() eq 0 }">
					<tr><td colspan="4">등록된 상품이 없습니다</td></tr>
				</c:if>
				<c:set var="i" value="0"/>
				<c:if test="${productList.size() != 0 }">
					<tr>
						<c:forEach var="product" items="${productList }">
							<c:if test="${i!=0 && i%4==0 }">
								</tr><tr>
							</c:if>
							<td>
								<p style="display:none">${product.pid }</p>
								<img src="${conPath }/photoUp/${product.paimage }" alt="대표이미지"><br>
								${product.pname }<br>
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.pprice }"/>원<br>
								${product.psize }(${product.pcategory })
								<c:set var="i" value="${i+1 }"/>
							</td>
						</c:forEach>
					</tr>
				</c:if>
			</table>
			<div class="paging">
			<c:if test="${startPage > BLOCKSIZE }">
				[ <a href="${conPath }/productList.do?pageNum=${startPage-1 }"> 이전 </a> ]
			</c:if>
			&nbsp;
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					[ <b> ${i } </b> ]
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/productList.do?pageNum=${i }"> ${i } </a> ]
				</c:if>
			</c:forEach>
			&nbsp;
			<c:if test="${endPage < pageCnt }">
				[ <a href="${conPath }/productList.do?pageNum=${endPage+1 }"> 다음 </a> ]
			</c:if>
			</div>
		</div>
		<div class="footer">
		<jsp:include page="../main/footer.jsp"/>
		</div>
	</div>
</body>
</html>