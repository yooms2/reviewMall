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
			height: 1200px;
		}
	</style>
</head>
<body>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div class="content">
		<input type="hidden" name="mid" value="${member.mid }">
		<input type="hidden" name="mname" value="${member.mname }">
			<table>
				<caption>${product.pid }번째 상품</caption>
				<tr>
					<th>상품명</th>
					<td>${product.pname }</td>
				</tr>
				<tr>
					<th>시중가</th>
					<td>${product.pprice }</td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td>${product.psize }</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>${product.pcategory }</td>
				</tr>
				<tr>
					<th>대표이미지</th>
					<td><img src="${conPath }/photoUp/${product.paimage }"></td>
				</tr>
				<tr>
					<th>추가이미지</th>
					<td>
						<c:if test="${not empty product.pbimage }">
							<img src="${conPath }/photoUp/${product.pbimage }">
						</c:if>
					</td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td>${product.pcontent }</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:if test="${not empty admin }">
							<button onclick="location.href='${conPath }/productModifyView.do?pid=${product.pid }&pageNum=${param.pageNum }'">수정</button>
							<button onclick="location.href='${conPath }/productDelete.do?pid=${product.pid }&pageNum=${param.pageNum }'">삭제</button>
						</c:if>
						<c:if test="${not empty member }">
							<button onclick="location.href='${conPath }/wishListAdd.do?mid=${member.mid }&pid=${product.pid }&pageNum=${param.pageNum }'">관심상품 추가</button>
						</c:if>
						<button onclick="location.href='${conPath }/productList.do?pageNum=${param.pageNum }'">목록</button>
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