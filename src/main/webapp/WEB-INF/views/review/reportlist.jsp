<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<!-- table Style CSS-->
<link rel="stylesheet" href="/resources/common/css/table.style.css">

<div class="container mt-5 mb-5">
	<h2>신고 리스트</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>날짜</th>
				<th>작성자</th>
				<th>내용</th>
				<th>신고취소</th>
				<th>리뷰삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="rvo">
			<c:if test="${rvo.report eq 1 }">
				<tr>
					<td>${rvo.regAt }</td>
					<td>${rvo.writer }</td>
					<td>${rvo.content}</td>
					<td>
						<form action="/review/cancel" method="post" enctype="multipart/form-data">
							<input type="hidden" id="rno" name="rno" value="${rvo.rno }">
							<input type="hidden" id="report" name="report" value="${rvo.report }">
							<button type="submit">o</button>
						</form>
					</td>
					<td><a id="reviewRemove">ㅇ</a>
					<form action="" id="reviewRemoveForm" style="display: none;" method="post">
						<input type="hidden" id="rno_1" value="" name="rno">
						<span id="rnoVal">${rvo.rno }</span>
					</form>
					</td>
				</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>

<script src="/resources/js/review.remove.js"></script>
<jsp:include page="../common/footer.jsp" />
