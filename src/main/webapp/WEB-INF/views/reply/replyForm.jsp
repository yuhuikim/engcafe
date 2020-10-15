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

<div id="refo" class="container" align="center" style="height:115px;border-radius:3px;">
	<form action="insertReply" method="post">
		<input type="hidden" name="r_num" value="0">	
		<input type="hidden" name="r_b_num" value="100">
		<c:if test="${empty r_ref || r_ref==0}">
			<input type="hidden" name="r_ref" value="0">
		</c:if>
		<c:if test="${not empty r_ref || r_ref!=0}">
			<input type="hidden" name="r_ref" value="${r_ref}">
		</c:if>
		<input type="hidden" name="r_id" value="tempid">
		<input type="hidden" name="r_nick" value="tempnick">
		
		<div class="container" style="width:95%;border:2px solid #e5e5e5;border-radius:10px;padding:20px 20px">
			<p style="float:left;font-size:17px;font-weight:bold;cursor:pointer;" onclick="">tempnick</p><br />
			<textarea style="border:none;outline:none;margin-left:10px;margin-bottom:10px;width:95%" name="r_content" cols="120" rows="3" placeholder="댓글을 남겨보세요"></textarea>
			<p>
				<img src="${path }/resources/images/i8.jpg" alt="" style="float:left;cursor:pointer" onclick=""/>
				<img src="${path }/resources/images/i9.jpg" alt="" style="float:left;cursor:pointer" onclick=""/>
				<input style="float:right;border-radius:2px;border:none;outline:none;margin-right:10px;font-size:14px;background-color:transparent;color:#bdbdbd;" type="submit" value="등록"/>
			</p>
		</div>

	</form>
</div>

</body>
</html>