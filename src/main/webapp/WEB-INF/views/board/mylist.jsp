<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<div class="container mt-3">
	<h2>내가 쓴 지역게시판</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>순번</th>
				<th>지역</th>
				<th>제목</th>
				<th>등록일</th>
				<th>수정일</th>
				<th>조회수</th>
				<th>댓글수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="list">
				<c:if test="${ses.nickName == list.bvo.writer }">
					<tr>
						<th>${list.bvo.bno }</th>
						<th>${list.bvo.userLocate }</th>
						<th><a href="/board/detail?bno=${list.bvo.bno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">${list.bvo.bname }</a></th>
						<th>${list.bvo.regAt }</th>
						<th>${list.bvo.modAt }</th>
						<th>${list.bvo.readCount }</th>
						<th>${list.bvo.cmtQty }</th>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>

<ul class="pagination justify-content-center">
	<c:if test="${pgn.prev }">
		<li class="page-item"><a class="page-link" href="/board/mylist?pageNo=${pgn.startPage - 1 }&qty=${pgn.pgvo.qty}">◀</a></li>
	</c:if>
	<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
	    <li class="page-item ${pgn.pgvo.pageNo == i ? 'active' : ''}"><a class="page-link" href="/board/mylist?pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a></li>
	</c:forEach>
	<c:if test="${pgn.next }">
	   	<li class="page-item"><a class="page-link" href="/board/mylist?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}">▶</a></li>
	</c:if>
</ul>

<jsp:include page="../common/footer.jsp"/>