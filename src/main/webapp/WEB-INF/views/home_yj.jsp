<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<script type="text/javascript">

	$(function(){
		
		$('#bmi').attr('src',"${path}/resources/images/s1.jpg");
		$('#bmi').click(function() {
			if($('#bmi').attr("src")=="${path}/resources/images/s1.jpg"){
				alert("즐겨찾는 카페 추가");	
				$('#bmi').attr('src','${path}/resources/images/s2.jpg');
			}else{
				alert("즐겨찾는 카페 해제");
				$('#bmi').attr('src','${path}/resources/images/s1.jpg');	
			}
		});
		
		
		$('#myacti').click(function(){
			$('#cinfo').attr('style','font-size:13px;color:#bfbfbf;padding-top:6px;padding-right:10px;cursor:pointer;font-weight:normal');
 			$('#myacti').attr('style','font-size:13px;color:black;padding-top:6px;cursor:default;font-weight:bolder');
 			$('#cinfo_span').attr('style','display:none;padding-top:7px;padding-bottom:7px;height:210px');
			$('#myacti_span').attr('style','display:active;padding-top:7px;padding-bottom:7px;height:210px');
		});
		
		$('#cinfo').click(function(){
			$('#cinfo').attr('style','font-size:13px;color:black;padding-top:6px;padding-right:10px;cursor:default;font-weight:bolder');
			$('#myacti').attr('style','font-size:13px;color:#bfbfbf;padding-top:6px;cursor:pointer');
			$('#myacti_span').attr('style','display:none;padding-top:7px;padding-bottom:7px;height:210px');
			$('#cinfo_span').attr('style','display:active;padding-top:7px;padding-bottom:7px;height:210px');
		});
		
		
		
	});

</script>
</head>
<body>

<section id="header">
	<div class="container" align="center">
		<div style="width:1080px;height:35px;font-size:12px;">
			<a href="http://www.naver.com"><img align="left" src="${path }/resources/images/n1.jpg" alt="" /></a>
			<p align="right" style="padding-top:8px;color:#dedede">
				<a href="" style="color:black;padding-right:10px">카페홈</a>|
				<a href="" style="color:black;padding-left:5px;padding-right:10px">새글</a>|
				<a href="" style="color:black;padding-left:5px;padding-right:10px">내소식</a>|
				<a href="" style="color:black;padding-left:5px;padding-right:10px">채팅</a>|&nbsp
				<a href="" class="btn btn-xs btn-default">로그인</a>
			</p>
		</div>
		<img src="${path }/resources/images/yanado.jpg" alt="" />
	</div>
</section>
<div class="container" align="center" style="padding-top:10px;padding-left:40px;padding-right:40px;">

	<section id="middle">
		<div class="container" align="left" style="width:1080px;height:45;padding-top:11px;border:1px solid #ededed;font-size:13">
			<a href="" style="color:black;padding-left:5px;padding-right:10px">[영꿀]추천 미드/영화</a>·
			<a href="" style="color:black;padding-left:5px;padding-right:10px">[꿀팁]미드/영화</a>·
			<a href="" style="color:black;padding-left:5px;padding-right:10px">[꿀팁]영어공부</a>·
			<a href="" style="color:black;padding-left:5px;padding-right:10px">[정보]유아영어</a>·
			<a href="" style="color:black;padding-left:5px;padding-right:10px">[친목]두런두런</a>
		</div>
	</section>
	
	<section id="menu">
		<div style="float:left;width:200px;padding-top:20px;padding-left:10px;">
			<div style="height:40px;padding-top:3px;border-top:2px solid black;border-bottom:1px solid #ededed;">
			<table>
				<tr>
					<td><img id="bmi" src="${path}/resources/images/s1.jpg" alt="" style="cursor:pointer;padding-right:10px;padding-bottom:2px"/></td>
					<td><p id="cinfo" style="font-size:13px;color:black;padding-top:6px;padding-right:10px;cursor:default;font-weight:bolder">카페정보</p></td>
					<td><p id="myacti" style="font-size:13px;color:#bfbfbf;padding-top:6px;cursor:pointer;">나의활동</p></td>
				</tr>
			</table>
			</div>
			<div id="cinfo_span" style="height:210px;padding-top:7px;padding-bottom:7px">
				<table style="border-bottom:1px solid #ededed;">
					<tr>
						<td style="padding-bottom:7px"><img src="${path }/resources/images/m3.jpg" alt="" /></td>
						<td style="padding-left:5px;padding-bottom:7px">
							<img src="${path }/resources/images/m4.jpg" alt="" /><a href="" style="font-size:13px;font-weight:bolder;color:black">인텐시브</a><br />
							<a href="" style="font-size:11px;color:#7d7d7d">since 2012.11.24</a><br />
							<a href="" style="font-size:11px;color:#7d7d7d">카페소개</a>
						</td>
					</tr>
				</table>
				<table width="180px">
					<tr>
						<td colspan="2" style="padding-top:10px;padding-bottom:5px" >
							<a href="" style="font-size:13px;color:#7d7d7d"><img src="${path }/resources/images/i1.jpg" alt="" />가지5단계</a>
						</td>
					</tr>
					<tr>
						<td style="padding-bottom:3px">
							<a href="" style="font-size:13px;color:#7d7d7d">
								<img src="${path }/resources/images/i2.jpg" alt="" />118,601
								<img src="${path }/resources/images/i3.jpg" alt="" />
							</a>
						</td>
						<td align="right" style="padding-bottom:3px">
							<a href="" style="font-size:13px;color:#7d7d7d">초대하기</a>
						</td>
					</tr>
					<tr>
						<td style="padding-bottom:1px">
							<a href="" style="font-size:11px;color:#7d7d7d">
								<img src="${path }/resources/images/i4.jpg" alt="" />즐겨찾는 멤버
							</a>
						</td>
						<td align="right" style="padding-bottom:1px">
							<a href="" style="font-size:11px;color:#7d7d7d">18,783명</a>
						</td>
					</tr>
					<tr>
						<td style="padding-bottom:1px">
							<a href="" style="font-size:11px;color:#7d7d7d">
								<img src="${path }/resources/images/i5.jpg" alt="" />게시판 구독수
							</a>
						</td>
						<td align="right" style="padding-bottom:1px">
							<a href="" style="font-size:11px;color:#7d7d7d">2,842회</a>
						</td>
					</tr>
					<tr>
						<td style="padding-bottom:1px">
							<a href="" style="font-size:11px;color:#7d7d7d">
								<img src="${path }/resources/images/i6.jpg" alt="" />우리 카페앱 수
							</a>
						</td>
						<td align="right" style="padding-bottom:1px">
							<a href="" style="font-size:11px;color:#7d7d7d">1,248회</a>
						</td>
					</tr>
				</table>
			</div>
			<div id="myacti_span" style="height:210px;display:none;padding-top:7px;padding-bottom:7px">
				
								
				<u:mypagetag> </u:mypagetag>
				
				
				
			</div>
			<button href="" style="text-align:center;background-color:#555555;width:200px;height:35px;color:white;border-radius:1px;border:1px solid #c2c2c2;font-size:13px;margin-top:10px;">카페 가입하기</button>
			<button href="" style="text-align:center;background-color:white;width:200px;height:35px;border-radius:1px;border:1px solid #c2c2c2;margin-top:10px;margin-bottom:10px;font-size:13px;">카페 채팅
				<img src="${path}/resources/images/i7.jpg" alt="" style="margin-bottom:2px"/></button>
			<form action="" method="post" class="form-horizontal">
				<div class="form-inline form-group" style="padding-left:15px;padding-right:5px">
					<input type="text" id="search" style="float:left;width:160px;height:25px;border-radius:1px;border:1px solid #c2c2c2;"/>
					<input type="submit" value="검색" style="float:right;width:40px;height:25px;color:white;background-color:#24c932;border-radius:1px;border:1px solid #24c932;font-size:12px;margin-bottom:4px;"/>
				</div>
			</form>
			
			<!-- 게시판 category -->
			
			<section id="categorybar">
			<div style="height:40px;padding-top:3px;border-top:2px solid black;border-bottom:1px solid #ededed;">
			
			<u:categoriestag />
			
			</div>
			</section>
		</div>
	</section>
	
	<section id="body">
		<div style="margin-left:200px;width:900px;padding-top:20px;padding-bottom:20px;">
			<div class="container" style="width:860px;height:1000px;padding-top:20px;padding-bottom:20px;border:4px solid #ededed;">
				
				<div id="banners" class="container" style="display:active;padding-top:60px;padding-bottom:60px;background-color:#ededed;width:700;height:960;">
					<div class="row">				
						<a href=""><img style="width:195px;height:220px;" src="${path}/resources/images/1.jpg" alt=""/></a>
						<a href=""><img style="width:195px;height:220px;margin-left:10px;margin-right:10px" src="${path}/resources/images/2.jpg" alt=""/></a>
						<a href=""><img style="width:195px;height:220px;" src="${path}/resources/images/3.jpg" alt=""/></a>
					<!-- </div>
					<div class="row" style="margin-top:10px;margin-bottom:10px"> -->	
					<br />	<br /><br />		
						<a href=""><img style="width:195px;height:220px;" src="${path}/resources/images/4.jpg" alt=""/></a>
						<a href=""><img style="width:195px;height:220px;margin-left:20px;margin-right:20px" src="${path}/resources/images/5.jpg" alt=""/></a>	
						<a href=""><img style="width:195px;height:220px;" src="${path}/resources/images/6.jpg" alt=""/></a>
					<!-- </div>
					<div class="row">	 -->	
					<br />	<br /><br />		
						<a href=""><img style="width:195px;height:220px;" src="${path}/resources/images/7.jpg" alt=""/></a>
						<a href=""><img style="width:195px;height:220px;margin-left:20px;margin-right:20px" src="${path}/resources/images/8.jpg" alt=""/></a>
						<a href=""><img style="width:195px;height:220px;" src="${path}/resources/images/9.jpg" alt=""/></a>
					</div>
				</div>
				
				
			</div>	
		</div>
	</section>
</div>
<section id="footer">
	<div class="container" align="center" style="padding-bottom:40px">
		<hr style="border:1px solid black"/>
		<div style="float:left;padding-top:5px;">
			<p align="left" style="font-size:14px;color:black;font-weight:bold">영어꿀＆미드추천(영국,미국드라마),미드영어,생활기초영어회화&nbsp&nbsp|&nbsp&nbsp
			<a href="#header" style="font-size:12px;color:#9c9c9c">https://cafe.naver.com/4dramaenglish</a></p>
		</div>
		<div style="float:right;">
			<a href="#header"><img src="${path}/resources/images/f1.jpg" alt="" /></a>
		</div>
	</div>
</section>	
</body>
</html>