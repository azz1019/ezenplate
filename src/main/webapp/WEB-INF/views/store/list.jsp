<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div class="container mt-5">
	<h1>Store List</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>등록번호</th>
				<th>이름</th>
				<th>등록자</th>
				<th>분류</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="svo">
				<tr>
					<td>${svo.sno }</td>
					<td>${svo.sname }</td>
					<td>${svo.writer}</td>
					<td>${svo.category }</td>
					<td><a href="/store/detail?sno=${svo.sno }">ㅇ</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="../common/footer.jsp" />