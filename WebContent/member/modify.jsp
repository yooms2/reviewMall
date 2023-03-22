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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		$(function() {
			$('input[name="mpw"], input[name="mpwChk"]').keyup(function() {
				var mpw = $('input[name="mpw"]').val();
				var mpwChk = $('input[name="mpwChk"]').val();
				if(mpw.length < 4) {
					$('#mpwConfirm').html('<b>비밀번호는 4글자 이상 입력해 주세요</b>');
				}else if(mpw == mpwChk) {
					$('#mpwConfirm').html('<strong>비밀번호 일치</strong>');
				} else {
					$('#mpwConfirm').html('<b>비밀번호 불일치</b>');
				}
			});
			$('input[name="mnickname"]').keyup(function() {
				var mnickname = $(this).val();
				if(!mnickname || (mnickname == '${member.mnickname }')) {
					$('#mnicknameCofirm').html(' &nbsp ');
				} else if(mnickname.length < 2) {
					$('#mnicknameConfirm').text('닉네임은 2글자 이상 입력해 주세요');
				} else {
					$.ajax({
						url : '${conPath }/mnicknameConfirm.do',
						type : 'get',
						data : 'mnickname='+mnickname,
						dataType : 'html',
						success : function(data) {
							$('#mnicknameConfirm').html(data);
						}
					});
				}
			});
			$('input[name="memail"]').keyup(function() {
				var patternMemail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/;
				var memail = $(this).val();
				if(!memail || (memail == '${member.memail }')) {
					$('#memailConfirm').html(' &nbsp ');
				} else if(!memail.match(patternMemail)) {
					$('#memailConfirm').html('<b>메일형식에 맞게 입력해 주세요</b>');
				} else {
					$.ajax({
						url : '${conPath }/memailConfirm.do',
						type : 'get',
						data : 'memail='+memail,
						dataType : 'html',
						success : function(data) {
							$('#memailConfirm').html(data);
						}
					});
				}
			});
			$('form').submit(function() {
				var oldMpw = $('input[name="oldMpw"]').val();
				var mpwConfirm = $('#mpwConfirm').text().trim();
				var mnicknameConfirm = $('#mnicknameConfirm').text().trim();
				var memailConfirm = $('#memailConfirm').text().trim();
				if(oldMpw != '${member.mpw }') {
					alert('현재 비밀번호를 확인하세요');
					$('input[name="oldMpw"]').focus();
					return false;
				} else if(mpwConfirm == '비밀번호는 4글자 이상 입력해 주세요') {
					$('input[name="mpw"]').focus();
					return false;
				} else if(mpwConfirm == '비밀번호 불일치') {
					$('input[name="mpw"]').focus();
					return false;
				} else if(mnicknameConfirm == '닉네임은 2글자 이상 입력해 주세요') {
					$('input[name="mnickname"]').focus();
					return false;
				} else if(mnicknameConfirm == '사용중인 닉네임 입니다') {
					$('input[name="mnickname"]').focus();
					return false;
				} else if(memailConfirm == '중복된 이메일 입니다') {
					$('input[name="memail"]').focus();
					return false;
				} else if(memailConfirm == '메일형식에 맞게 입력해주세요') {
					$('input[name="memail"]').focus();
					return false;
				}
			});
		});
	</script>
	<script>
		$(function() {
			$("#datepicker").datepicker({
				dateFormat: "yy-mm-dd",
		    	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    	dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		    	changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		    	changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		    	showMonthAfterYear: true,
		    	yearSuffix: '년',
		    	showOtherMonths: true, // 현재 달이 아닌 달의 날짜도 회색으로 표시
		    	minDate: new Date(1950, 1 - 1, 1), // 1950년 1월1일을 최소 날짜로 세팅
		    	maxDate : 'y', // 현재 날짜 이전만 선택 가능
		    	yearRange: 'c-100:c+10',
			});
		});
	</script>
</head>
<body>
	<c:if test="${empty member }">
		<script>
			location.href="${conPath }/loginView.do";
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<form action="${conPath }/modify.do" method="post">
			<input type="hidden" name="dbMpw" value="${member.mpw }">
			<table>
				<caption>정보수정</caption>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mid" value="${member.mid }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="oldMpw"></td>
				</tr>
				<tr>
					<th>새로운 비밀번호</th>
					<td><input type="password" name="mpw" maxlength="16"></td>
				</tr>
				<tr>
					<th>새로운 비밀번호 확인</th>
					<td>
						<input type="password" name="mpwChk" maxlength="16">
						<span id="mpwConfirm"></span>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mname" value="${member.mname }" required="required"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="mnickname" value="${member.mnickname }" required="required">
						<span id="mnicknameConfirm"></span>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="mtel" value="${member.mtel }">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="memail" value="${member.memail }">
						<span id="memailConfirm"></span>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="mbirth" value="${member.mbirth }" id="datepicker"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
					<c:if test="${member.mgender eq 'm'}">
						남자<input type="radio" name="mgender" value="m" class="gender" checked="checked">
						여자<input type="radio" name="mgender" value="f" class="gender">
					</c:if>
					<c:if test="${member.mgender eq 'f'}">
						남자<input type="radio" name="mgender" value="m" class="gender">
						여자<input type="radio" name="mgender" value="f" class="gender" checked="checked">
					</c:if>
					<c:if test="${empty member.mgender }">
						남자<input type="radio" name="mgender" value="m" class="gender">
						여자<input type="radio" name="mgender" value="f" class="gender">
					</c:if>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="maddress" value="${member.maddress }"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="submit" value="수정하기" class="btn">
						<input type="reset" value="재입력" class="btn">
						<input type="button" value="이전" class="btn" onclick="history.back()">
						<input type="button" value="탈퇴하기" class="btn" onclick="location.href='${conPath }/withdraw.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>