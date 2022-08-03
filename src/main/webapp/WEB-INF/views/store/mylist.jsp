<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<div class="container mt-3">
	<h2>내가등록한 식당</h2>
	<a href="/store/register" class="btn btn-success">등록</a>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>순번</th>
				<th>이름</th>
				<th>카테고리</th>
				<th>주소</th>
				<th>등록일</th>
				<th>승인여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="svo">
				<c:if test="${ses.email == svo.writer }">
					<tr>
						<th>${svo.sno }</th>
						<th><a href="/store/mydetail?sno=${svo.sno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">${svo.sname }</a></th>
						<th>${svo.category }</th>
						<th>${svo.locate }</th>
						<th>${svo.regAt }</th>
						<th>
							<c:choose>
								<c:when test="${svo.approve eq 1}">승인</c:when>
								<c:otherwise>미승인</c:otherwise>
							</c:choose>
						</th>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>

<ul class="pagination justify-content-center">
	<c:if test="${pgn.prev }">
		<li class="page-item"><a class="page-link" href="/store/mylist?pageNo=${pgn.startPage - 1 }&qty=${pgn.pgvo.qty}">◀</a></li>
	</c:if>
	<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
	    <li class="page-item ${pgn.pgvo.pageNo == i ? 'active' : ''}"><a class="page-link" href="/store/mylist?pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a></li>
	</c:forEach>
	<c:if test="${pgn.next }">
	   	<li class="page-item"><a class="page-link" href="/store/mylist?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}">▶</a></li>
	</c:if>
</ul>

<jsp:include page="../common/footer.jsp"/>