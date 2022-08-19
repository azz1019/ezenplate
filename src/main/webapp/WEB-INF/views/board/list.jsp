<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav2.jsp" />
 <link href="/resources/mylist/css/common.style.css" rel="stylesheet" type="text/css">
<!-- Board Style CSS-->
<link rel="stylesheet" href="/resources/board/css/board.list.style.css">
<script src="/resources/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- ==================== Start Header ==================== -->

<section class="page-header" id="boardhead">
	<div class="container" id ="boardlist">
		<div class="row">
			<div class="col-lg-7 col-md-5" id="boardtitle">
				<div class="cont">
					<h1 class="extra-title mb-10">지역게시판</h1>
					<p>우리 지역의 다양한 이야기를 이웃과 함께 나누어요.</p>
				</div>
			</div>
		</div>
	</div>
	<section class="page-buttons" style="padding-right:180px;">
	<div class="container mb-5">
		<div class="buttons">
			<div class="text-lg-start float-left">
				<form class="d-flex" action="/board/list" method="get"
					id="inputForm">
					<input type="hidden" name="pageNo" value="${pgn.pgvo.pageNo }">
					<input type="hidden" name="qty" value="${pgn.pgvo.qty }">
					<div class="input-group">
						<input type="hidden" id="locationKeyword" value="${pgn.pgvo.kw }">
						<select class="form-select" id="locationSelect" onchange="location = this.value;">
							 <option value="/board/list">전체</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=서울">서울</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=경기">경기</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=인천">인천</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=강원">강원</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=충북">충북</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=충남">충남</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=세종">세종</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=대전">대전</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=전북">전북</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=전남">전남</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=광주">광주</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=경북">경북</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=경남">경남</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=대구">대구</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=울산">울산</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=부산">부산</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=제주">제주</option>
						</select>
					</div>
				</form>
			</div>

			<!-- 로그인 안되면 로그인 페이지로 보내기-->
			<div class="text-lg-end float-right">
				<c:choose>
					<c:when test="${ses.email ne null && ses.email ne '' }">
						<button type="button" class="btn regBtn"
							onclick="location.href='/board/register'">글쓰기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn regBtn"
							onclick="location.href='/member/login'">글쓰기</button>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- // -->
		</div>
	</div>
</section>
</section>
<!-- ==================== End Start Header ====================  -->

<!-- ==================== Start Board button ==================== -->
<%-- <section class="page-buttons">
	<div class="container mb-5">
		<div class="buttons">
			<div class="text-lg-start float-left">
				<form class="d-flex" action="/board/list" method="get"
					id="inputForm">
					<input type="hidden" name="pageNo" value="${pgn.pgvo.pageNo }">
					<input type="hidden" name="qty" value="${pgn.pgvo.qty }">
					<div class="input-group">
						<input type="hidden" id="locationKeyword" value="${pgn.pgvo.kw }">
						<select class="form-select" id="locationSelect" onchange="location = this.value;">
							 <option value="/board/list">전체</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=서울">서울</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=경기">경기</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=인천">인천</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=강원">강원</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=충북">충북</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=충남">충남</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=세종">세종</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=대전">대전</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=전북">전북</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=전남">전남</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=광주">광주</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=경북">경북</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=경남">경남</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=대구">대구</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=울산">울산</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=부산">부산</option>
							 <option value="/board/list?pageNo=1&qty=10&type=l&kw=제주">제주</option>
						</select>
					</div>
				</form>
			</div>

			<!-- 로그인 안되면 로그인 페이지로 보내기-->
			<div class="text-lg-end float-right">
				<c:choose>
					<c:when test="${ses.email ne null && ses.email ne '' }">
						<button type="button" class="btn regBtn"
							onclick="location.href='/board/register'">글쓰기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn regBtn"
							onclick="location.href='/member/login'">글쓰기</button>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- // -->
		</div>
	</div>
</section> --%>
<!-- ==================== End Board Button ====================  -->
<!-- ==================== Search ==================== -->
<section class="search-page">
	<div class="container justify-content-center">
		<div class="col-lg-11 ml-4">
			<div class="col-md-11" id="boardsearch">
				<form class="d-flex" action="/board/list" method="get"
					id="inputForm">
					<input type="hidden" name="pageNo" value="${pgn.pgvo.pageNo }">
					<input type="hidden" name="qty" value="${pgn.pgvo.qty }">
					<div class="input-group">
						<c:set value="${pgn.pgvo.type }" var="typed" />
						<select class="form-select" name="type">
							<option ${typed eq null ? 'selected':'' }>선택</option>
							<option value="twc" ${typed eq 'twc' ? 'selected':'' }>전체</option>
							<option value="t" ${typed eq 't' ? 'selected':'' }>제목</option>
							<option value="w" ${typed eq 'w' ? 'selected':'' }>닉네임</option>
							<option value="c" ${typed eq 'c' ? 'selected':'' }>내용</option>
						</select> 
							<input class="form-control ml-4 mr-4 searchInput" type="search"
							placeholder="검색어를 입력해보세요" aria-label="Search" name="kw"
							id="searchID">
						<div class="input-group-append">
							<button class="btn searchBtn" type="submit">
								<i class="fa-solid fa-magnifying-glass" style="color: white;"></i>
								<span class="badge bg-danger ml-2">${pgn.totalCount}</span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- ==================== End Search ====================  -->
<hr>
<!--  ==================== Start Board List ====================  -->
<section class="board-pg section-padding p-4">
	<div class="container" style="padding-left:40px;">
		<div class="justify-content-center" style="margin-right:200px; margin-left:80px;" >
			<div class="col-lg-11 ml-4" style="padding-left:50px;margin-left: 0px;padding-right: 0px;">
				<c:forEach items="${list }" var="list">
					<div class="posts" >
						<div class="item mb-8">
							<div class="col-11 content blog-table">
								<div class="row">
									<a class="links" style="text-decoration: none; width:800px;"
										href="/board/detail?bno=${list.bvo.bno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">
										<h4 class="title">${list.bvo.bname }</h4>
										<p>${list.bvo.content }</p>

										<div class="board-pic">
											<c:forEach items="${list.fileList }" var="fvo">
												<div class="flex-fill p-3">
													<img class="img"
														src="/upload/${fn:replace(fvo.saveDir, '//','/')}/${fvo.uuid}_${fvo.fileName}">
												</div>
											</c:forEach>
										</div>
									</a>
								</div>
								<div class="tags mb-3">
									<a href="/board/detail?bno=${list.bvo.bno}">${list.bvo.writer }</a>
									<span><fmt:formatDate pattern="yyyy. MM. dd. HH시mm분"
											value="${list.bvo.regAt}" /></span> <a
										href="/board/detail?bno=${list.bvo.bno}">댓글 <span>${list.bvo.cmtQty }</span></a>
									<span>조회 ${list.bvo.readCount }</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>

<!-- ==================== End Blog ==================== -->
<!-- ==================== Pagination ==================== -->
<ul class="pagination justify-content-center mt-5">
	<c:if test="${pgn.prev }">
		<li class="page-item"><a class="page-link"
			href="/board/list?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&kw=${pgn.pgvo.kw}"><i
				class="fa-solid fa-angle-left"></i></a></li>
	</c:if>
	<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
		<li class="page-item ${pgn.pgvo.pageNo == i ? 'active' : '' }"><a
			class="page-link"
			href="/board/list?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&kw=${pgn.pgvo.kw}">${i}</a></li>
	</c:forEach>
	<c:if test="${pgn.next }">
		<li class="page-item"><a class="page-link"
			href="/board/list?pageNo=${pgn.endPage+1 }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&kw=${pgn.pgvo.kw}"><i
				class="fa-solid fa-angle-right"></i></a></li>
	</c:if>
</ul>
<!-- ==================== End Pagination ====================  -->

<script src="/resources/js/board.register.js"></script>
<script>
	const locationSelectCtrl = document.getElementById('locationSelect');
	const locationKeyword = document.getElementById('locationKeyword').value;
	for(let index = 0; index < locationSelectCtrl.length; index++) {
		if(locationSelectCtrl[index].text == locationKeyword) {	
			locationSelectCtrl[index].selected = true;
		}
	}
</script>

<jsp:include page="../common/footer.jsp" />