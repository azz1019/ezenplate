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
			<c:forEach items="${list }" var="rvo">
			<c:if test="${rvo.report eq 1 }">
				<tr>
					<td>${rvo.regAt }</td>
					<td>${rvo.writer }</td>
					<td>${rvo.content}</td>
					<td><a href="/review/detail?rno=${rvo.rno }">ㅇ</a></td>
					<td><a href="/review/remove?rno=${rvo.rno }">ㅇ</a></td>
				</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="../common/footer.jsp" />