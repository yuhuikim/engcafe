<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>꿀카페 : 회원가입</title>
<link rel="stylesheet" href="/inc/user/css/V2Join.css">
<script type="text/javascript" src="https://nid.naver.com/js/clickcr.js"></script>
<script type="text/javascript" src="/inc/common/js/lcs_nclicks.js"></script>
<script type="text/javascript">
	lcs_do();
</script>
<meta name="decorator" content="V2_JOIN">

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
	<div id="wrap">
		<!-- header -->
		<div id="header">
			<a href="http://www.naver.com"><img
				src="${path }/resources/images/logo/join_logo.png" /></a>
		</div>
		<!-- // header -->

		<div id="container" role="main">
			<div id="content">
				<!-- tg-text=title -->
				<h2 class="blind">회원가입</h2>
				<div class="join_content">
					<form action="join.html" method="post" enctype="multipart/frm-data"
						name="frm" onsubmit="return idChk2()">

						<!-- 아이디-->
						<div class="join_row">
							<h3 class="join_title"></h3>
							<label for="user_id">아이디</label>
							<!-- <input type="text" id="id" name="user_id" class="int"
										title="ID" maxlength="20"> -->
							<c:choose>
								<c:when test="${not empty user_id }">
									<td><input type="text" name="user_id" value="${user_id }"
										required="required" autofocus="autofocus">&nbsp; <input
										type="button" class="btn btn-info btn-sm" value="중복확인"
										onclick="idChk()"></td>
								</c:when>
								<c:when test="${empty user_id }">
									<td><input type="text" name="user_id" required="required"
										autofocus="autofocus">&nbsp;<input type="button"
										class="btn btn-info btn-sm" value="중복확인" onclick="idChk()"></td>
								</c:when>
							</c:choose>
						</div>
						<!--// 아이디 -->


						<!-- 닉네임 -->

						<div class="join_row">
							<h3 class="join_title"></h3>
							<label for="user_nickname">닉네임</label> <span
								class="ps_box int_id"> <!-- <input type="text" id="id" name="user_id" class="int"
										title="ID" maxlength="20"> --> <c:choose>
									<c:when test="${not empty user_nickname }">
										<td><input type="text" name="user_nickname"
											value="${user_nickname }" class="txt t02" required="required">&nbsp;
											<input type="button" class="btn btn-info btn-sm" value="중복확인"
											onclick="nickChk()"></td>
									</c:when>
									<c:when test="${empty user_nickname }">
										<td><input type="text" name="user_nickname"
											class="txt t02" required="required">&nbsp;<input
											type="button" class="btn btn-info btn-sm" value="중복확인"
											onclick="nickChk()"></td>
									</c:when>
								</c:choose>
							</span>
						</div>

						<!--// 닉네임 -->


						<!-- 이름-->

						<div class="join_row">
							<h3 class="join_title"></h3>
							<label for="user_name">이름</label> <input type="text"
								name="user_name" required="required">
						</div>
						<!--// 이름 -->


						<!-- 비밀번호 -->
						<div class="join_row">
							<h3 class="join_title">
								<label for="user_pwd">비밀번호</label>
							</h3>
							<input type="password" name="user_pwd" required="required">
							<p
								style="padding-top: 10px; color: gray; font-size: 11px; margin: 0px">
								※ 비밀번호는 영문 대소문자/숫자/특수문자를 조합, 10~16자로 설정해야한다.※</p>

						</div>
						<div class="join_row">
							<h3 class="join_title">
								<label for="user_pwd2">비밀번호 재확인</label>
							</h3>
							<input type="password" name="user_pwd2" required="required">
						</div>

						<!-- 나이 -->
						<div class="join_row">
							<h3 class="join_title">
								<label for="user_age">나이</label>
							</h3>
							<input type="number" name="user_age" min="14" max="100"
								required="required">
						</div>
						<!-- // 나이 -->



						<!-- 이메일 -->
						<div class="join_row">
							<h3 class="join_title">
								<label for="user_email">이메일</label>
							</h3>
							<input type="email" name="user_email" required="required">
						</div>
						<!-- // 이메일 -->
						<div class="btn_area">
							<td colspan="2"><input type="submit" value="확인"></td>
						</div>


					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>