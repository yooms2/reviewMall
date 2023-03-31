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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
	<%-- <link href="${conPath }/css/header.css" rel="stylesheet"> --%>
	<style>
		body {
			margin: 0;
			background-color: #f3e3b4; 
			min-width: 800px;
		}
		a {
			text-decoration: none;
			color: #fff;
		}
		.navbar {
			display: flex;
			justify-content: space-between;
			align-items: center;
			background-color: #e79418;
			padding: 8px 12px;
		}
		.navbar_logo {
			font-size: 24px;
			color: #fff;
		}
		.navbar_menu {
			display: flex;
			list-style: none;
			padding-left: 0;
		}
		.navbar_menu li {
			padding: 8px 12px;
		}
		.navbar_menu li.id {
			background-color: #857026;
			border-radius: 5px;
		}
		.navbar_menu li:hover {
			background-color: #f3e3b4;
			box-sizing: border-box;
			border-radius: 5px;
		}
		.navbar_menu li a:hover {
			color: #000;
		}
		.navbar_icons {
			list-style: none;
			color: #fff;
			display: flex;
			padding-left: 0;
		}
		.navbar_icons li {
			padding: 8px 12px;
		}
		.navbar_toggleBtn {
			display: block;
			position: absolute;
			right: 32px;
			font-size: 24px;
		}
		/* @media screen and (max-width: 768px) {
			.navbar {
				flex-direction: column;
				align-items: flex-start;
				padding: 8px 24px;
			}
			.navbar_menu {
				display: none;
				flex-direction: column;
				align-items: center;
				width: 100%;
			}
			.navbar_menu li {
				width: 100%;
				text-align: center;
			}
			.navbar_icons {
				display: none;
				justify-content: center;
				width: 100%;
			}
			.navbar_toggleBtn {
				display: block;
			}
			.navbar_menu.active,
			.navbar_icons.active {
				display: flex;
			} */
		}
	</style>
	<!-- <script>
		const toggleBtn = document.querySelector('.navbar_toggleBtn');
		const menu = document.querySelector('.navbar_menu');
		const icons = document.querySelector('.navbar_icons');
		
		toggleBtn.addEventListener('click', () => {
			menu.classList.toggle('active');
			icons.classList.toggle('active');
		});
	</script> -->
</head>
<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<i class="fa-solid fa-user" style="color: #f3e3b4;"></i>
			<a href="${conPath }/main.do">reviewMall</a>
		</div>
		<c:if test="${empty member and empty admin }">
			<ul class="navbar_menu">
				<li><a href="${conPath }/loginView.do">로그인</a></li>
				<li><a href="${conPath }/joinView.do">회원가입</a></li>
				<li><a href="${conPath }/productList.do">상품리스트</a></li>
				<li><a href="${conPath }/boardList.do">게시판</a></li>
			</ul>
		</c:if>
		<c:if test="${not empty member and empty admin }">
			<ul class="navbar_menu">
				<li class="id"><a href="${conPath }/main.do">${member.mname } 님</a></li>
				<li><a href="${conPath }/modifyView.do">마이페이지</a></li>
				<li><a href="${conPath }/wishList.do?mid=${member.mid }">관심목록</a></li>
				<li><a href="${conPath }/productList.do">상품리스트</a></li>
				<li><a href="${conPath }/logout.do">로그아웃</a></li>
				<li><a href="${conPath }/boardList.do">게시판</a></li>
			</ul>
		</c:if>
		<c:if test="${empty member and not empty admin }">
			<ul class="navbar_menu">
				<li class="id"><a href="${conPath }/allView.do">${admin.aname } 님</a></li>
				<li><a href="${conPath }/productAddView.do">상품등록</a></li>
				<li><a href="${conPath }/productList.do">상품리스트</a></li>
				<li><a href="${conPath }/logout.do">로그아웃</a></li>
				<li><a href="${conPath }/boardList.do">게시판</a></li>
			</ul>
		</c:if>
		<ul class="navbar_icons">
			<!-- <li><i class="fab fa-twitter"></i></li>
			<li><i class="fab fa-facebook-f"></i></li> -->
		</ul>
		<a href="" class="navbar_toggleBtn">
			<i class="fa-solid fa-bars" style="color: #ffffff;"></i>
		</a>
	</nav>
</body>
</html>