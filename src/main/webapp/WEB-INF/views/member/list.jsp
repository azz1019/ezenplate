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
				<th>회원번호</th>
				<th>이메일</th>
				<th>닉네임</th>
				<th>등급</th>
				<th>최근로그인</th>
				<th>지역</th>
				<th>리뷰 수</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="mvo">
				<tr>
					<td>${mvo.mno }</td>
					<td>${mvo.email }</td>
					<td>${mvo.nickName}</td>
					<td>${mvo.grade }</td>
					<td>${mvo.lastLogin }</td>
					<td>${mvo.userLocate }</td>
					<td>${mvo.reviewCount }</td>
					<td><a href="/member/detail?email=${mvo.email }">ㅇ</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${pgn.prev }">
	    <li class="page-item">
	    <a class="page-link" href="/member/list?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty}">Prev</a>
	    </li>
	    </c:if>
	    <c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
	    <li class="page-item ${pgn.pgvo.pageNo == i ? 'active':'' }">
	    <a class="page-link" href="/member/list?pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a>
	    </li>
	   	</c:forEach>
	   	<c:if test="${pgn.next }">
	    <li class="page-item">
	    <a class="page-link" href="/member/list?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}">Next</a>
	    </li>
	    </c:if>
  	</ul>
</div>

<jsp:include page="../common/footer.jsp" />
