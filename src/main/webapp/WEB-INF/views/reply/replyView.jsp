<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#replyFormDisp').load('replyForm?r_ref=0');
	});
	function rDelete(r_b_num, r_num){
		var sendData = 'r_b_num='+r_b_num+'&r_num='+r_num;
		$.post('deleteReply', sendData, function(data){
			alert("댓글 삭제 성공");
 			$('#repListDisp').html(data);
		});
	}
	function rUpdate(r_b_num, r_num, r_level){
		// 데이터를 읽을 때 input/textarea는 form형식 -> val()
		// td/span 같이 form 형식이 아닐 때 -> text()
		var txt = $('#rCont_'+r_num).text();
		var rows = 3+0.2*r_level;
		var cols = 120-r_level*7;
		// 읽은 글을 편집 할 수 있도록 textarea에 넣어야 함
		$('#rCont_'+r_num).html('<textarea rows="'+rows+'" cols="'+cols+'" id="rCont2_'+r_num+'" style="outline:none;border:1px solid #cdcdcd">'+
				txt+'</textarea>');
		$('#tab_pop_'+r_num).html(
			'<div style="width:80px;height:100px;padding-top:7px;padding-bottom:7px;border:1px solid #cdcdcd;">'+
			'<table class="table table-hover" style="text-align:center;font-size:14px;color:#8c8c8c;">'+
			'<tr><td style="padding:10px;cursor:pointer;" onclick="up('+r_b_num+','+r_num+')">확인</td></tr>'+
			'<tr><td style="padding:10px;border-bottom:1px solid #cdcdcd;cursor:pointer" onclick="lst('+r_b_num+')">취소</td></tr></table></div>');
	}
	function up(r_b_num, r_num){
		var sendData = 'r_content='+$('#rCont2_'+r_num).val()+'&r_b_num='+r_b_num+'&r_num='+r_num;
		$.post('updateReply', sendData, function(data){
			alert("수정 성공");
 			$('#repListDisp').html(data);
		});
	}
	function lst(r_b_num){
		$('#repListDisp').load('replyList?r_b_num='+r_b_num);
	}
	function modKey(r_num){
		$('#tab_pop_'+r_num).appendTo('#modIcon_'+r_num);
		$('#tab_pop_'+r_num).attr('style','display:active;position:absolute;');
	}
	function stopModKey(r_num){
		$('#tab_pop_'+r_num).attr('style','display:none;');
	}
	function replKey(r_num,r_level){
		$('#replDiv_'+r_num).attr('style','display:active;');
  		$('#replInDiv_'+r_num).load('replyForm?r_ref='+r_num);		
	}
	function iconDown(r_num){
		$('#replIcon_'+r_num).attr('class','glyphicon glyphicon-circle-arrow-up');
	}
	function stopIconDown(r_num){
		$('#replIcon_'+r_num).attr('class','glyphicon glyphicon-circle-arrow-Down');
	}
	function iconUp(r_num){
		$('#replDiv_'+r_num).attr('style','display:none;');
	}

</script>

</head>
<body>
<div id="replyWhole" class="container" align="center">

	<div id="repListDisp" class="container" align="center">
		<c:if test="${not empty replyList }">
			<p align="left" style="margin-top:24px;margin-left:10px;font-size:20px;font-weight:bolder">댓글 
				<a href="" style="margin-left:10px;font-size:15px;color:#333333;font-weight:bolder">등록순</a> 
				<a href="" style="margin-left:10px;font-size:14px;color:#bdbdbd;font-weight:bolder">최신순</a>
			</p>
			<table class="table" style="width:100%">
				<c:forEach var="rl" items="${replyList }">
					<c:if test="${rl.r_del=='y'}">
						<tr><td colspan="12">삭제된 댓글입니다.</td></tr>
					</c:if>
					<c:if test="${rl.r_del!='y'}">
						<tr style="border-top:1px solid #cdcdcd">
							<c:if test="${rl.r_level>0 }"><td colspan="${rl.r_level}"></td></c:if>
							<td style="width:60px;padding-top:30px;padding-bottom:20px;">
								<i class="glyphicon glyphicon-user" style="float:left;color:#dfe1e5;font-size:50px"></i>
							</td>
							<td colspan="11-${rl.r_level}" style="padding:20px 20px">
								<p style="font-size:16px;font-weight:bold;cursor:pointer;">${rl.r_nick }
								
									<div id="tab_pop_${rl.r_num}" style="display:none">	
											<c:if test="${rl.r_id==rl.r_id }">	
												<div style="width:80px;height:100px;padding-top:7px;padding-bottom:7px;border:1px solid #cdcdcd;">
													<table class="table table-hover" style="text-align:center;font-size:14px;color:#8c8c8c;">
														<tr>
															<td style="padding:10px;cursor:pointer;" onclick="rUpdate(${rl.r_b_num},${rl.r_num},${rl.r_level });">수정</td>
														</tr>
														<tr>
															<td style="padding:10px;border-bottom:1px solid #cdcdcd;cursor:pointer" onclick="rDelete(${rl.r_b_num},${rl.r_num })">삭제</td>
														</tr>
													</table>
												</div>			
											</c:if>
											<c:if test="${rl.r_id!=rl.r_id }">
												<div style="width:80px;height:60px;padding-top:8px;border:1px solid #cdcdcd;">
													<table class="table table-hover" style="text-align:center;font-size:14px;color:#8c8c8c;">
														<tr>
															<td style="padding:10px;border-bottom:1px solid #cdcdcd;cursor:pointer;" onclick="">신고</td>
														</tr>
													</table>
												</div>
											</c:if>
										</div>
								
									<i id="modIcon_${rl.r_num}" style="float:right;color:#bdbdbd;cursor:pointer" class="glyphicon glyphicon-cog" onmouseover="modKey(${rl.r_num})" onmouseout="stopModKey(${rl.r_num})"></i>
								</p>
								<p id="rCont_${rl.r_num }" style="font-size:16px">${rl.r_content }</p>
								<p style="float:left;font-size:13px;color:#979797 ">${rl.r_update }&nbsp&nbsp
								<c:if test="${rl.r_level<10}">
									<p id="rKey_${rl.r_num }" style="float:left;font-size:13px;color:#979797;cursor:pointer" onclick="replKey(${rl.r_num},${rl.r_level})">답글쓰기</p>
								</c:if>
								<c:if test="${rl.r_level>=10}">
								
									<p id="rKey_${rl.r_num }" style="float:left;padding-top:2px;font-size:5px;color:#979797;">더 댓글을 달 수 없는 댓글입니다.</p>
								</c:if>
								</p>
							</td>
						</tr>
						<tr id="replDiv_${rl.r_num}" style="display:none">
	 						<td style="height:220px;padding-top:25px;">
								<span id="replIcon_${rl.r_num}" onmouseover="iconDown(${rl.r_num})" onclick="iconUp(${rl.r_num})" onmouseout="stopIconDown(${rl.r_num})"
								 class="glyphicon glyphicon-circle-arrow-down" style="cursor:pointer;float:right;font-size:30px;color:#d6d6d6"></span>
							</td> 
							<td colspan="11" id="replInDiv_${rl.r_num}" align="left" style="height:220px;padding-top:20px;padding-bottom:20px">
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</c:if>
		<hr style="margin-bottom:50px;border-top:3px double #d6d6d6;"/>
		<div id="replyFormDisp"></div>
	</div>
</div>
</body>
</html>