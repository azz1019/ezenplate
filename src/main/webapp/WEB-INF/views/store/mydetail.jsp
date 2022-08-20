<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<!-- title Style CSS-->
<link rel="stylesheet" href="/resources/common/css/title.style.css">

<div class="container mt-5 mb-5">
	<h2>${sdto.svo.sname }</h2>
	<section class="light-bg booking-details_wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12 responsive-wrap">
                    <div class="booking-checkbox_wrap">
                        <div class="booking-checkbox">
							<div class="reserve-seat-block">
			  					<c:choose>
									<c:when test="${sdto.svo.approve eq 1}">
										<div class="reserve-rating">
											<span>승인</span>
										</div>
									</c:when>
									<c:otherwise>
										<div class="reserve-rating" style="background-color:rgb(243, 78, 121)">
											<span>미승인</span>
										</div>
									</c:otherwise>
								</c:choose>
								
								<div class="review-btn">
			                        <a href="/store/mylist?email=${ses.email }&pageNo=${pgvo.pageNo }&qty=${pgvo.qty}" class="btn btn-outline-dark">목록</a>
			                        <span>목록으로</span>
			                        
			                        <c:if test="${sdto.svo.approve eq 0}">
										<a class="btn btn-outline-danger" id="storeRemove">삭제</a>
										<span>식당삭제</span>
									</c:if>
			                    </div>
							</div>
							<div class="address">
	                            <span class="icon-check"></span>
	                            <p>순번 : <span id="snoVal">${sdto.svo.sno }</span></p>
	                            <p>카테고리 : ${sdto.svo.category }</p>
	                            <p>소개 : ${sdto.svo.content }</p>
	                        </div>                       
                        	<div class="address">
	                            <span class="icon-location-pin"></span>
	                            <p>주소 : ${sdto.svo.locate }</p>
	                        </div>
	                        <div class="address">
	                            <span class="icon-screen-smartphone"></span>
	                            <p>연락처 : ${sdto.svo.tel }</p>
	                        </div>
                        	<div class="address">
	                            <span class="icon-clock"></span>
	                            <p>휴일 : ${sdto.svo.holiday }</p>
	                        </div>
   							<div class="address">
	                            <span class="icon-calendar"></span>
	                            <p>등록일 : ${sdto.svo.regAt }</p>
	                            <p>수정일 : ${sdto.svo.modAt }</p>
	                        </div>							
							<br>
                            <table class="table table-hover">
								<thead>
									<tr>
										<th>첫번째 메뉴</th>
										<th>첫번째 메뉴 가격</th>
										<th>두번째 메뉴</th>
										<th>두번째 메뉴 가격</th>
										<th>세번째 메뉴</th>
										<th>세번째 메뉴 가격</th>
										<th>네번째 메뉴</th>
										<th>네번째 메뉴 가격</th>
										<th>다섯번째 메뉴</th>
										<th>다섯번째 메뉴 가격</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>${sdto.svo.menuName1 }</th>
										<th>${sdto.svo.menuPrice1 }</th>
										<th>${sdto.svo.menuName2 }</th>
										<th>${sdto.svo.menuPrice2 }</th>
										<th>${sdto.svo.menuName3 }</th>
										<th>${sdto.svo.menuPrice3 }</th>
										<th>${sdto.svo.menuName4 }</th>
										<th>${sdto.svo.menuPrice4 }</th>
										<th>${sdto.svo.menuName5 }</th>
										<th>${sdto.svo.menuPrice5 }</th>
									</tr>
								</tbody>
							</table>
							
							<div class="d-flex mb-3">
								<c:forEach items="${sdto.fileList }" var="fvo">
									<c:choose>
										<c:when test="${fvo.fileType == 1 }">
											<div class="p-2 flex-fill">
												<img src="/upload/${fn:replace(fvo.saveDir, '\\', '/') }/${fvo.uuid }_th_${fvo.fileName }">
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
	<form action="" id="storeRmForm" style="display: none;" method="post">
		<input type="hidden" id="sno" value="" name="sno">
		<input type="hidden" id="email" value="${ses.email }" name="email">
		<input type="hidden" value="${pgvo.pageNo }" name="pageNo">
		<input type="hidden" value="${pgvo.qty }" name="qty">
	</form>
</div>

<script src="/resources/js/store.myremove.js"></script>
	
<jsp:include page="../common/footer.jsp"/>