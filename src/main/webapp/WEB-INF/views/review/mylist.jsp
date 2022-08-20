<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<!-- table Style CSS-->
<link rel="stylesheet" href="/resources/common/css/table.style.css">

<div class="container mt-5 mb-5">
	<h2>내가 쓴 리뷰</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>리뷰순번</th>
				<th>식당순번</th>
				<th>제목</th>
				<th>평점</th>
				<th>등록일</th>
				<th>수정일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="rvo">
				<c:if test="${ses.email == rvo.writer }">
					<tr>
						<td>${rvo.rno }</td>
						<td>${rvo.sno }</td>
						<td><a href="/review/mydetail?rno=${rvo.rno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">${rvo.title }</a></td>
						<td>${rvo.rate }</td>
						<td>${rvo.regAt }</td>
						<td>${rvo.modAt }</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>

<ul class="pagination justify-content-center">
	<c:if test="${pgn.prev }">
		<li class="page-item"><a class="page-link" href="/review/mylist?email=${ses.email }&pageNo=${pgn.startPage - 1 }&qty=${pgn.pgvo.qty}">◀</a></li>
	</c:if>
	<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
	    <li class="page-item ${pgn.pgvo.pageNo == i ? 'active' : ''}"><a class="page-link" href="/review/mylist?email=${ses.email }&pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a></li>
	</c:forEach>
	<c:if test="${pgn.next }">
	   	<li class="page-item"><a class="page-link" href="/review/mylist?email=${ses.email }&pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}">▶</a></li>
	</c:if>
</ul>

<jsp:include page="../common/footer.jsp"/>
