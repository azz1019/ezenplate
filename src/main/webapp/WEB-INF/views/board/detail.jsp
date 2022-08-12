<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<!-- Board Style CSS-->
<link rel="stylesheet"
	href="/resources/board/css/board.detail.style.css">

<main id="main">
	<div class="main-content paddsection">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8 col-md-offset-2">
					<div class="row">
						<div class="container-main single-main">
							<div class="col-md-12">
								<div class="block-main mb-3">
									<div class="board-txt mb-2">

										<div class="container mt-4">
											<form action="" id="boardRmForm" style="display: none;"
												method="post">
												<input type="hidden" id="bno" value="" name="bno"> <input
													type="hidden" value="${pgvo.pageNo }" name="pageNo">
												<input type="hidden" value="${pgvo.qty }" name="qty">
												<input type="hidden" value="${pgvo.type }" name="type">
												<input type="hidden" value="${pgvo.kw }" name="kw">
											</form>
										</div>
										<h4>${bdto.bvo.userLocate }</h4>
										<span class ="titleCss">${bdto.bvo.bname }</span>
										<span>
										<c:if test="${ses.nickName == bdto.bvo.writer}">
												<a class ="modifyBtn" href="/board/modify?bno=${bdto.bvo.bno }">수정</a>
												<button type="button" id="boardRemove">삭제</button>
											</c:if>
										</span>

									</div>
									<div class="post-meta">
										<ul class="list-unstyled">
											<li class="author">by: ${bdto.bvo.writer }</li>
											<li class="date"><fmt:formatDate
													pattern="yyyy. MM. dd. HH시mm분" value="${bdto.bvo.regAt}" /></li>
											<li class="comment"><i class="ion-ios-heart-outline"></i>댓글
												<span class="commentQty">${bdto.bvo.cmtQty }</span></li>
											<li id="bnoVal">${bdto.bvo.bno }</li>
										</ul>
									</div>

									<div class="d-flex">
										<c:forEach items="${bdto.fileList }" var="fvo">
											<c:choose>
												<c:when test="${fvo.fileType == 1 }">
													<div class="flex-fill mt-3 p-4">
														<img class="img"
															src="/upload/${fn:replace(fvo.saveDir, '//','/')}/${fvo.uuid}_${fvo.fileName}">
													</div>
												</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
									<div class="content-main single-post padDiv">
										<p class="mb-3 content">${bdto.bvo.content }</p>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="comments text-left padDiv mb-30">
									<div class="entry-comments">
										<div class="input-group mb-3">
											<span class="input-group-text" id="cmtWriter">${ses.nickName }</span>
											<input type="text" class="form-control"
												placeholder="댓글을 남겨보세요" id="cmtText">
											<button type="button" class="btn" id="cmtSbmBtn">ADD</button>
										</div>
										<div>
											<p>예시</p>
										</div>
										<h6 class="mb-3">
											<span class="commentQty">${bdto.bvo.cmtQty } </span> Comments
										</h6>
										<div class="commentForm">
											<div class="entry-comments-body">
												<span class="entry-comments-author">TESTER</span> <span><a
													href="#">2022.08.11. 14시 35분</a></span>
												<p class="mb-10">저도 너무 가고싶어요ㅠㅠㅠ!</p>
											</div>
											<div class="entry-comments-body">
												<span class="entry-comments-author">USER1</span> <span><a
													href="#">2022.08.11. 14시 42분</a></span>
												<p class="mb-10">독일 가는건가요~?</p>
											</div>
											<div class="entry-comments-body">
												<span class="entry-comments-author">ADMIN</span> <span><a
													href="#">2022.08.11. 14시 45분</a></span>
												<p class="mb-10">갑시다!!!!!!!!</p>
											</div>
										</div>
									</div>





									<div class="container mt-3">

										<div id="accordionExample"></div>
										<table class="table table-hover" id="cmtZone"></table>
										<div class="text-center" style="visibility: hidden;">
											<button type="button" data-page="1" id="moreBtn"
												class="btn btn-outline-secondary">MORE +</button>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Blog Single -->

	<!-- End #main -->






	<script src="/resources/js/board.register.js"></script>
	<script src="/resources/js/board.detail.js"></script>
	<script src="/resources/js/board.comment.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			getCommentList(document.getElementById('bnoVal').innerText);
			if (document.getElementById('cmtWriter').innerText == '') {
				document.getElementById('cmtText').disabled = true;
				document.getElementById('cmtSbmBtn').classList.add("disabled");

			}
		});
	</script>
	<jsp:include page="../common/footer.jsp" />