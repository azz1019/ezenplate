<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<!-- Board Style CSS-->
<link rel="stylesheet" href="/resources/board/css/board.list.style.css">
<script src="/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- title Style CSS-->
<link rel="stylesheet" href="/resources/common/css/title.style.css">

<div class="container pt-5 mt-5 mb-5" style="padding-left:50px;">
	<h2>내가 쓴 지역게시판</h2>
</div>
<!--  ==================== Start Board List ====================  -->
<section class="board-pg section-padding p-3">
	<div class="container">
		<div class="justify-content-center">
			<div class="col-lg-12 mt-5 ml-4">
			<div class="borderSet">
				<c:forEach items="${list }" var="list">
					<c:if test="${ses.nickName == list.bvo.writer }">
						<div class="posts">
							<div class="item mb-8">
								<div class="col-11 content blog-table">
									<div class="row">
										<p class="locateCss">지역 > <span>${list.bvo.userLocate }</span></p>
										<a class="links" style="text-decoration: none; width:1200px;"
											href="/board/detail?bno=${list.bvo.bno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">
											<h4 class="title">${list.bvo.bname }</h4>
											<p class="contents">${list.bvo.content }</p>
											<div class="board-pic">
												<c:forEach items="${list.fileList }" var="fvo">
													<div class="flex-fill p-4">
														<img class="img"
															src="/upload/${fn:replace(fvo.saveDir, '//','/')}/${fvo.uuid}_${fvo.fileName}">
													</div>
												</c:forEach>
											</div>
										</a>
									</div>
									<div class="tags mb-2">
										<a href="/board/detail?bno=${list.bvo.bno}">${list.bvo.writer }</a>
										<span><fmt:formatDate pattern="yyyy. MM. dd. HH시mm분"
												value="${list.bvo.regAt}" /></span> <a
											href="/board/detail?bno=${list.bvo.bno}">댓글 <span>${list.bvo.cmtQty }</span></a>
										<span>조회 ${list.bvo.readCount }</span>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- ==================== End Blog ==================== -->
<!-- ==================== Pagination ==================== -->
<ul class="pagination justify-content-center">
	<c:if test="${pgn.prev }">
		<li class="page-item"><a class="page-link" href="/board/mylist?nickName=${ses.nickName }&pageNo=${pgn.startPage - 1 }&qty=${pgn.pgvo.qty}"><i
				class="fa-solid fa-angle-left"></i></a></li>
	</c:if>
	<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
	    <li class="page-item ${pgn.pgvo.pageNo == i ? 'active' : ''}"><a class="page-link" href="/board/mylist?nickName=${ses.nickName }&pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a></li>
	</c:forEach>
	<c:if test="${pgn.next }">
	   	<li class="page-item"><a class="page-link" href="/board/mylist?nickName=${ses.nickName }&pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}"><i
				class="fa-solid fa-angle-right"></i></a></li>
	</c:if>
</ul>
<!-- ==================== End Pagination ====================  -->

<jsp:include page="../common/footer.jsp" />
