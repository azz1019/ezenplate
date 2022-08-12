<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div class="container mt-5">
	<h1>Member List</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>날짜</th>
				<th>작성자</th>
				<th>내용</th>
				<th>상세보기</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="cvo">
				<tr>
					<td>${cvo.regAt }</td>
					<td>${cvo.writer }</td>
					<td>${cvo.content}</td>
					<td><a href="/comment/detail?rno=${cvo.cno }">ㅇ</a>${rvo.grade }</td>
					<td><a href="/comment/remove?rno=${cvo.cno }">ㅇ</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="../common/footer.jsp" />