<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<link rel="stylesheet" href="/resources/mylist/css/mylist.style.css">

<div class="container mt-3">
	<div class="row justify-content-center">
		<div class="col-md-5">
			<div class="styled-heading">
				<h3>내가 쓴 지역게시판</h3>
			</div>
		</div>
	</div>
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
			<c:forEach items="${list }" var="bvo">
				<c:if test="${ses.nickName == bvo.writer }">
					<tr>
						<td>${bvo.bno }</td>
						<td>${bvo.userLocate }</td>
						<td><a href="/board/detail?bno=${bvo.bno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">${bvo.bname }</a></td>
						<td><span><fmt:formatDate pattern="yyyy. MM. dd. HH시mm분" value="${bvo.regAt}" /></span></td>
						<td><span><fmt:formatDate pattern="yyyy. MM. dd. HH시mm분" value="${bvo.modAt}" /></span></td>
						<td>${bvo.readCount }</td>
						<td>${bvo.cmtQty }</td>
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