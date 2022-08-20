<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<!-- table Style CSS-->
<link rel="stylesheet" href="/resources/common/css/table.style.css">


<div class="container mt-5 mb-5">
	<h2 style=" display:inline-block;">내가 등록한 식당</h2>
	<span><button onclick="location.href='/store/myregister'" class="btn regBtn">등록</button></span>
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
						<td>${svo.sno }</td>
						<td><a href="/store/mydetail?sno=${svo.sno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">${svo.sname }</a></td>
						<td>${svo.category }</td>
						<td>${svo.locate }</td>
						<td>${svo.regAt }</td>
						<td>
							<c:choose>
								<c:when test="${svo.approve eq 1}">승인</c:when>
								<c:otherwise><span style="color:red;">미승인</span></c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>

<ul class="pagination justify-content-center">
	<c:if test="${pgn.prev }">
		<li class="page-item"><a class="page-link" href="/store/mylist?email=${ses.email }&pageNo=${pgn.startPage - 1 }&qty=${pgn.pgvo.qty}">◀</a></li>
	</c:if>
	<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
	    <li class="page-item ${pgn.pgvo.pageNo == i ? 'active' : ''}"><a class="page-link" href="/store/mylist?email=${ses.email }&pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a></li>
	</c:forEach>
	<c:if test="${pgn.next }">
	   	<li class="page-item"><a class="page-link" href="/store/mylist?email=${ses.email }&pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}">▶</a></li>
	</c:if>
</ul>

<jsp:include page="../common/footer.jsp"/>