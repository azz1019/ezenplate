<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<div class="container mt-3">
	<h2>리뷰 상세</h2>
	<section class="light-bg booking-details_wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12 responsive-wrap">
                    <div class="booking-checkbox_wrap">
                        <div class="booking-checkbox">
                            순번 : <span id="rnoVal">${rdto.rvo.rno }</span><br>
                            식당 순번 : ${rdto.rvo.sno }<br>
                            평점 : ${rdto.rvo.rate }<br>
                            내용 : ${rdto.rvo.content }<br>
							등록일 : ${rdto.rvo.regAt }<br>
							수정일 : ${rdto.rvo.modAt }<br>
							
							<div class="d-flex mb-3">
								<c:forEach items="${rdto.fileList }" var="fvo">
									<c:choose>
										<c:when test="${fvo.fileType == 1 }">
											<div class="p-2 flex-fill">
												<img src="/upload/${fn:replace(fvo.saveDir, '\\', '/') }/${fvo.uuid }_th_${fvo.fileName }" class="thumb_image">
											</div>
										</c:when>
										<c:otherwise></c:otherwise>			
									</c:choose>
								</c:forEach>
						  	</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<a href="/review/mylist?pageNo=${pgvo.pageNo }&qty=${pgvo.qty}" class="btn btn-warning">목록</a>
	<a href="/review/mymodify?rno=${rdto.rvo.rno }&pageNo=${pgvo.pageNo }&qty=${pgvo.qty}" class="btn btn-success">수정</a>
	
	<a class="btn btn-danger" id="reviewRemove">삭제</a>
	<form action="" id="reviewRmForm" style="display: none;" method="post">
		<input type="hidden" id="rno" value="" name="rno">
		<input type="hidden" value="${pgvo.pageNo }" name="pageNo">
		<input type="hidden" value="${pgvo.qty }" name="qty">
	</form>
</div>

<script src="/resources/js/review.myremove.js"></script>
	
<jsp:include page="../common/footer.jsp"/>