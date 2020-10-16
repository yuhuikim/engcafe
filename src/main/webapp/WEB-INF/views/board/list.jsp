<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container" align="center">
		<h2 class="text-primary">영화 게시판</h2>
		<table class="table table-striped table-bordered">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="board" items="${list }">
					<tr>
						<td>${board.bNum }</td>
						<c:if test="${board.del == 'y'}">
							<td colspan="4">삭제된 글입니다</td>
						</c:if>
						<c:if test="${board.del != 'y'}">
							<td>${board.subject }</td>
							<td>${board.id }</td>
							<td>${board.bRegdate }</td>
							<td>${board.readCnt }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<a href="/board/insertForm" class="btn btn-info">게시글 입력</a>
	</div>

	<h1>유정 수정~</h1>

</body>
</html>