<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<!-- table Style CSS-->
<link rel="stylesheet" href="/resources/common/css/table.style.css">

<div class="container mt-5 mb-5"">
	<h2>식당 리스트</h2>
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
				<c:if test="${svo.approve eq '0' }">
				<tr>
					<td>${svo.sno }</td>
					<td>${svo.sname }</td>
					<td>${svo.writer}</td>
					<td>${svo.category }</td>
					<td><a href="/store/detail?sno=${svo.sno }">ㅇ</a></td>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${pgn.prev }">
	    <li class="page-item">
	    <a class="page-link" href="/store/approve?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty}">Prev</a>
	    </li>
	    </c:if>
	    <c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
	    <li class="page-item ${pgn.pgvo.pageNo == i ? 'active':'' }">
	    <a class="page-link" href="/store/approve?pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a>
	    </li>
	   	</c:forEach>
	   	<c:if test="${pgn.next }">
	    <li class="page-item">
	    <a class="page-link" href="/store/approve?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}">Next</a>
	    </li>
	    </c:if>
  	</ul>
</div>

<jsp:include page="../common/footer.jsp" />
