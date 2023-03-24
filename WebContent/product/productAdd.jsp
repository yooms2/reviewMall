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
		
	</style>
</head>
<body>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div class="content">
			<form action="${conPath }/productAdd.do" method="post" enctype="multipart/form-data">
				<table>
					<caption>상품등록</caption>
					<tr>
						<th>상품명</th>
						<td><input type="text" name="pname" maxlength="33" required="required"></td>
					</tr>
					<tr>
						<th>시중가</th>
						<td><input type="number" name="pprice" min="1" max="999999999" required="required"></td>
					</tr>
					<tr>
						<th>사이즈</th>
						<td><input type="text" name="psize" maxlength="33" placeholder="ex) S사이즈, 2size, 265mm" required="required"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><input type="text" name="pcategory" maxlength="33" placeholder="ex) 남성용, 여성용" required="required"></td>
					</tr>
					<tr>
						<th>대표이미지</th>
						<td><input type="file" name="paimage" required="required"></td>
					</tr>
					<tr>
						<th>추가이미지</th>
						<td><input type="file" name="pbimage"></td>
					</tr>
					<tr>
						<th>상세설명</th>
						<td><textarea name="pcontent" rows="20" cols="60"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록하기" class="btn">
							<input type="reset" value="정보 초기화" class="btn">
							<input type="button" value="상품리스트" class="btn" onclick="location.href='${conPath }/productList.do'">
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