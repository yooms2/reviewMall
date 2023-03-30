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
			height: 1000px;
		}
	</style>
</head>
<body>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div id="content">
			<form action="${conPath }/productModify.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<input type="hidden" name="pid" value="${product.pid }">
				<input type="hidden" name="dbPaimage" value="${product.paimage }">
				<input type="hidden" name="dbPbimage" value="${product.pbimage }">
				<table>
					<caption>${product.pid }번째 상품 수정</caption>
					<tr>
						<th>상품명</th>
						<td><input type="text" name="pname" value="${product.pname }" maxlength="33" required="required"></td>
					</tr>
					<tr>
						<th>시중가</th>
						<td><input type="number" name="pprice" min="1" max="999999999" value="${product.pprice }" required="required"></td>
					</tr>
					<tr>
						<th>사이즈</th>
						<td><input type="text" name="psize" value="${product.psize }" maxlength="33" required="required"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><input type="text" name="pcategory" value="${product.pcategory }" maxlength="33"></td>
					</tr>
					<tr>
						<th>대표이미지</th>
						<td>
							<input type="file" name="paimage" value="${product.paimage }">
							<c:if test="${not empty product.paimage }">
								${product.paimage }
							</c:if>
							<c:if test="${empty product.paimage }">
								첨부파일없음
							</c:if>
						</td>
					</tr>
					<tr>
						<th>추가이미지</th>
						<td>
							<input type="file" name="pbimage" value="${product.pbimage }">
							<c:if test="${not empty product.pbimage }">
								${product.pbimage }
							</c:if>
							<c:if test="${empty product.pbimage }">
								첨부파일없음
							</c:if>
						</td>
					</tr>
					<tr>
						<th>상세설명</th>
						<td><textarea name="pcontent" rows="20" cols="60">${product.pcontent }</textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정하기">
							<input type="button" value="이전" onclick="location.href='${conPath }/productList.do?pageNum=${param.pageNum }'">
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