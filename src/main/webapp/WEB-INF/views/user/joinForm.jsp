<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function idChk() {
		var user_id = frm.user_id.value;
		if (!frm.user_id.value) {
			alert("아이디 입력 후 중복체크 버튼을 눌러주세요!");
			frm.user_id.focus();
			return false;
		}
		$.post('idChk.html', 'user_id=' + frm.user_id.value, function(data) {
			//$('#disp').html(data);
			alert(data);
		});
	}

	function nickChk() {
		var user_nickname = frm.user_nickname.value;
		if (!frm.user_nickname.value) {
			alert("닉네임 입력 후 중복체크 버튼을 눌러주세요!");
			frm.user_nickname.focus();
			return false;
		}
		$.post('nickChk.html', 'user_nickname=' + frm.user_nickname.value,
				function(data) {
					//$('#disp').html(data);
					alert(data);
				});
	}

	/* 	function chk() {
	 if (frm.user_pwd.value != frm.user_pwd2.value) {
	 alert("암호와 암호확인이 서로 일치하지 않습니다.");
	 frm.user_pwd.value = "";
	 frm.user_pwd.focus();
	 return false;
	 }
	 } */

	function idChk2() {
		/* 	if (frm.user_id.value.length < 4 || frm.user_id.value.length > 12 ) {
				alert("아이디는 4 - 12글자");
				frm.user_id.focus();
				return false;
			} */

		// /^: 시작,  $/: 끝, []: 속에 글자 중에 하나
		// .*(?=.{4,8}) 점을 포함한 한글자 이상을 사용하는 4~8이내
		// (?=.*[0-9]) 숫자 하나는 포함
		// (?=.*[a-zA-Z]) 소문자/대문자 구별없이 한글자 이상
		// (?=.*[@!#$*()_&]) []속의 글자(특수문자) 하나는 있어야한다
		var user_pwd = /^.*(?=.{10,16})(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@!#$*()_&]).*$/;

		if (!user_pwd.test(frm.user_pwd.value)) {
			alert("비밀번호 조건에 맞지 않습니다.");
			frm.user_pwd.focus();
			return false;
		} else if (frm.user_pwd.value != frm.user_pwd2.value) {
			alert("암호와 암호확인이 서로 일치하지 않습니다.");
			frm.user_pwd.value = "";
			frm.user_pwd.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">회원가입</h2>

		<c:choose>
			<c:when test="${not empty message }">
				<script type="text/javascript">
					alert("${message}");
				</script>
			</c:when>
			<c:when test="${not empty message1 }">
				<script type="text/javascript">
					alert("${message1}");
				</script>
			</c:when>
		</c:choose>

		<form action="join.html" method="post" enctype="multipart/frm-data"
			name="frm" onsubmit="return idChk2()">
			<table class="table table-bordered">
				<tr>
					<td>아이디 <span class="glyphicon glyphicon-user"></span></td>
					<c:choose>
						<c:when test="${not empty user_id }">
							<td><input type="text" name="user_id" value="${user_id }"
								required="required" autofocus="autofocus">&nbsp; <input
								type="button" class="btn btn-info btn-sm" value="중복확인"
								onclick="idChk()"></td>
						</c:when>
						<c:when test="${empty user_id }">
							<td><input type="text" name="user_id" 
								required="required" autofocus="autofocus">&nbsp;<input type="button"
								class="btn btn-info btn-sm" value="중복확인" onclick="idChk()"></td>
						</c:when>
					</c:choose>
					<!-- <td><input type="text" name="user_id" required="required"
						autofocus="autofocus" style="padding-right: 10px;"> <input
						type="button" value="중복확인" class="btn btn-info btn-sm"
						onclick="idChk()"> <span user_id="disp" class="err"></span></td> -->
				</tr>
				<tr>
					<td>닉네임 <span class="glyphicon glyphicon-user"></span></td>
					<c:choose>
						<c:when test="${not empty user_nickname }">
							<td><input type="text" name="user_nickname"
								value="${user_nickname }" class="txt t02" required="required">&nbsp;
								<input type="button" class="btn btn-info btn-sm" value="중복확인"
								onclick="nickChk()"></td>
						</c:when>
						<c:when test="${empty user_nickname }">
							<td><input type="text" name="user_nickname" class="txt t02"
								required="required">&nbsp;<input type="button"
								class="btn btn-info btn-sm" value="중복확인" onclick="nickChk()"></td>
						</c:when>
					</c:choose>
					<!-- <td>닉네임 <span class="glyphicon glyphicon-user"></span></td>
					<td><input type="text" name="user_nickname"
						required="required" autofocus="autofocus"
						style="padding-right: 10px;"> <input type="button"
						value="중복확인" class="btn btn-info btn-sm" onclick="nickChk()">
						<span user_nickname="disp" class="err"></span></td> -->
				</tr>

				<tr>
					<td>이름 <span class="glyphicon glyphicon-user"></span></td>
					<td><input type="text" name="user_name" required="required"
						></td>
				</tr>

				<tr>
					<td>암호 <span class="glyphicon glyphicon-lock"></span></td>
					<td><input type="password" name="user_pwd" required="required">
						<p
							style="padding-top: 10px; color: gray; font-size: 11px; margin: 0px">
							※ 비밀번호는 영문 대소문자/숫자/특수문자를 조합, 10~16자로 설정해야한다.※</p></td>
				</tr>
				<tr>
					<td>암호확인 <span class="glyphicon glyphicon-lock"></span></td>
					<td><input type="password" name="user_pwd2"
						required="required"></td>
				</tr>
				<tr>
					<td>나이 <span class="glyphicon glyphicon-lock"></span></td>
					<td><input type="number" name="user_age" min="14" max="100"
						required="required"></td>
				</tr>
				<tr>
					<td>이메일 <span class="glyphicon glyphicon-envelope"></span></td>
					<td><input type="email" name="user_email" required="required"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>