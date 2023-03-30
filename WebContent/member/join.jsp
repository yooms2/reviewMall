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
	<style>
		#content {
			height: 1000px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		$(function() {
			$('input[name="mid"]').keyup(function() {
				var mid = $(this).val();
				var patternMid = /^[a-zA-Z0-9]/;
				if(mid.length < 4) {
					$('#midConfirm').html('<b>아이디는 4글자 이상 입력해 주세요</b>');
				} else if(!mid.match(patternMid)){
					$('#midConfirm').html('<b>영문/숫자로만 입력해 주세요</b>');
				} else {
					$.ajax({
						url : '${conPath }/midConfirm.do',
						type : 'get',
						data : 'mid='+mid,
						dataType : 'html',
						success : function(data) {
							$('#midConfirm').html(data);
						}
					});
				}
			});
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
				if(!mnickname) {
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
				if(!memail) {
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
				var midConfirm = $('#midConfirm').text().trim();
				var mpwConfirm = $('#mpwConfirm').text().trim();
				var mnicknameConfirm = $('#mnicknameConfirm').text().trim();
				var memailConfirm = $('#memailConfirm').text().trim();
				if(midConfirm != '사용 가능한 ID 입니다') {
					$('input[name="mid"]').focus();
					return false;
				} else if(mpwConfirm != '비밀번호 일치') {
					$('input[name="mpw"]').focus();
					return false;
				} else if(mnicknameConfirm != '사용 가능한 닉네임 입니다') {
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
	<c:if test="${not empty member }">
		<script>
			alert('로그인 상태 입니다');
			history.back();
		</script>
	</c:if>
	<div id="wrapper">
		<div class="header">
		<jsp:include page="../main/header.jsp"/>
		</div>
		<div id="content">
			<form action="${conPath }/join.do" method="post">
				<table>
					<caption>회원가입</caption>
					<tr>
						<th>아이디 <b>*</b></th>
						<td>
							<input type="text" name="mid" required="required" placeholder="영문+숫자 조합 4자 이상">
							<p id="midConfirm"></p>
						</td>
					</tr>
					<tr>
						<th>비밀번호 <b>*</b></th>
						<td><input type="password" name="mpw" maxlength="16" placeholder="비밀번호는 4자~16자 " required="required"></td>
					</tr>
					<tr>
						<th>비밀번호 확인 <b>*</b></th>
						<td>
							<input type="password" name="mpwChk" maxlength="16" placeholder="비밀번호는 4자~16자 " required="required">
							<p id="mpwConfirm"></p>
						</td>
					</tr>
					<tr>
						<th>이름 <b>*</b></th>
						<td><input type="text" name="mname" required="required"></td>
					</tr>
					<tr>
						<th>닉네임 <b>*</b></th>
						<td>
							<input type="text" name="mnickname" placeholder="닉네임은 2자 이상 " required="required">
							<p id="mnicknameConfirm"></p>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input type="text" name="mtel">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" name="memail">
							<p id="memailConfirm"></p>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" name="mbirth" id="datepicker"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							남자<input type="radio" name="mgender" value="m" class="gender">
							여자<input type="radio" name="mgender" value="f" class="gender">
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="maddress" id="addr"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<input type="submit" value="회원가입" class="btn">
							<input type="reset" value="재입력" class="btn">
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