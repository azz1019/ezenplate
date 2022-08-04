<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div class="container mt-5">
	<h1>Board List
		<a href="/board/register" class="btn btn-primary">글쓰기</a></h1>
<!-- ================= TABLE =================  -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th>NO.</th>
				<th>지역</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
				<th>댓글 </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="bvo">
				<tr>
					<td>${bvo.bno }</td>
					<td>${bvo.userLocate }</td>
					<td><a href="/board/detail?bno=${bvo.bno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">${bvo.bname}</a></td>
					<td>${bvo.writer }</td>
					<td>${bvo.regAt }</td>
					<td>${bvo.readCount }</td>
					<td>${bvo.cmtQty }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- // END TABLE // -->
<!-- ================= SEARCH =================  -->
<input type="hidden" name="pageNo" value="${pgn.pgvo.pageNo }">
	<input type="hidden" name="qty" value="${pgn.pgvo.qty }">
	<div class="input-group">
	<c:set value="${pgn.pgvo.type }" var="typed"/>
		<select class="form-select" name="type">
			<option ${typed eq null ? 'selected':'' }>선택</option>
			<option value="twc" ${typed eq 'bcw' ? 'selected':'' }>전체검색</option>
			<option value="t" ${typed eq 'b' ? 'selected':'' }>제목</option>
			<option value="w" ${typed eq 'c' ? 'selected':'' }>내용</option>
			<option value="c" ${typed eq 'w' ? 'selected':'' }>닉네임</option>
			<option value="tw" ${typed eq 'bw' ? 'selected':'' }>제목 or 닉네임</option>
			<option value="tc" ${typed eq 'bc' ? 'selected':'' }>제목 or 내용</option>
			<option value="wc" ${typed eq 'wc' ? 'selected':'' }>닉네임 or 내용</option>
		</select>
		<input class="form-control me-2" type="search" placeholder="Search"
			aria-label="Search" name="kw" value="${pgn.pgvo.kw }">
		<button class="btn btn-outline-success" type="submit">Search 
		<span class="badge bg-danger">${pgn.totalCount }</span></button>
	</div>
<!-- // END SEARCH // -->

<!-- ================= PAGE =================  -->
<ul class="pagination justify-content-center">
		<c:if test="${pgn.prev }">
			<li class="page-item"><a class="page-link"
				href="/product/list?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&kw=${pgn.pgvo.kw}">Prev</a>
			</li>
		</c:if>
		<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
			<li class="page-item ${pgn.pgvo.pageNo == i ? 'active':'' }"><a
				class="page-link"
				href="/product/list?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&kw=${pgn.pgvo.kw}">${i }</a></li>
		</c:forEach>
		<c:if test="${pgn.next }">
			<li class="page-item"><a class="page-link"
				href="/product/list?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&kw=${pgn.pgvo.kw}">Next</a>
			</li>
		</c:if>
	</ul>
<!-- // END PAGE // -->

<jsp:include page="../common/footer.jsp" />
