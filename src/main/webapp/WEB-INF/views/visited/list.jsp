<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<link rel="stylesheet" href="/resources/mylist/css/mylist.style.css">

<div class="container mt-3">
	<div class="row justify-content-center">
		<div class="col-md-5">
			<h3>내가 방문한 식당</h3>
		</div>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>식당 순번</th>
				<th>식당 이름</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="vvo">
				<c:if test="${ses.mno == vvo.mno }">
					<tr>
						<td><span id="snoVal">${vvo.sno }</span></td>
						<td>${vvo.sname }</td>
						<td>${vvo.regAt }</td>
						<td><a href="/visited/remove?sno=${vvo.sno }&mno=${ses.mno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}" class="btn btn-danger">삭제</a></td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>

<ul class="pagination justify-content-center">
	<c:if test="${pgn.prev }">
		<li class="page-item"><a class="page-link" href="/visited/list?mno=${ses.mno }&pageNo=${pgn.startPage - 1 }&qty=${pgn.pgvo.qty}">◀</a></li>
	</c:if>
	<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
	    <li class="page-item ${pgn.pgvo.pageNo == i ? 'active' : ''}"><a class="page-link" href="/visited/list?mno=${ses.mno }&pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a></li>
	</c:forEach>
	<c:if test="${pgn.next }">
	   	<li class="page-item"><a class="page-link" href="/visited/list?mno=${ses.mno }&pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}">▶</a></li>
	</c:if>
</ul>

<jsp:include page="../common/footer.jsp"/>