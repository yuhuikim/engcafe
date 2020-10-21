<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table id="gbList_${startNum}" class="table table-bordered" style="display:active;float:left;width:840px;">
	<c:if test="${not empty replyList }">
	<c:forEach var="rl" items="${replyList }" varStatus="status">
	<tr>
		<td style="width:840px;height:160px;padding-left:10px;">
		<img src="${path }/resources/images/i13.jpg" alt="" style="float:left;"/> 
		<span style="float:right;" ><img src="${path}/resources/images/i11.jpg" alt="" /></span>
		<p style="float:left;padding-top:5px;padding-left:7px;font-size:13px;font-weight:bold;">${rl.r_nick }
			<img src="${path}/resources/images/i10.jpg" alt="" />
			<br />
			<span style="float:left;font-size:11px;color:#8f8f8f;font-weight:normal;font-weight:bold;line-height:7px;">${rl.r_update }</span>	
		</p>
		<textarea style="overflow: visible;display:block;float:left;white-space: pre-wrap;font-size:14px;text-align:left;margin-top:10px;margin-left:10px;border:none;outline:none;resize:none;" rows="3" cols="110" readonly="readonly">${rl.r_content }</textarea> 
			<p style="padding-left:10px;font-size:13px;">
				<a href="" style="float:left;color:#fc2323;text-decoration:underline;">댓글 ${rl.gbReply}</a>
				<a href="" style="float:right;color:black;padding-left:10px;padding-right:10px;margin-top:2px;">신고</a>
				<a href="" style="float:right;color:#8f8f8f;cursor:default;">|</a>
				<a href="" style="float:right;color:black;padding-right:10px;"><img src="${path}/resources/images/i12.jpg" alt="" style="margin-bottom:5px;"/>북마크</a>
			</p>
		</td>
	</tr>
	</c:forEach>
	</c:if>
	<c:if test="${wholeNum>endNum}">
		<tr id="moreKey_${endNum}">
			<td style="width:840px;height:50px;padding:0px;font-size:13px;"><button style="width:100%;height:100%;border:none;outline:none;background-color:#f9f9f9;" onclick="more(${r_b_num},${startNum},${endNum})">더보기</button></td>
		</tr>
	</c:if>
</table>

</body>
</html>