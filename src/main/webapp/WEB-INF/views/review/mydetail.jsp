<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<!-- title Style CSS-->
<link rel="stylesheet" href="/resources/common/css/title.style.css">

<div class="container mt-5 mb-5">
	<h2>리뷰 상세</h2>
	<c:if test="${ses.email == rdto.rvo.writer }">
		<a href="/review/mylist?email=${ses.email }&pageNo=${pgvo.pageNo }&qty=${pgvo.qty}" class="btn btn-outline-dark">목록</a>
		<a href="/review/mymodify?rno=${rdto.rvo.rno }&pageNo=${pgvo.pageNo }&qty=${pgvo.qty}" class="btn btn-outline-warning">수정</a>
		<a class="btn btn-outline-danger" id="reviewRemove">삭제</a>
	</c:if>
	<hr>
	<div class="booking-checkbox_wrap">
		<div class="customer-review_wrap">
    		<div class="customer-img">
    			리뷰순번 : <span id="rnoVal">${rdto.rvo.rno }</span><br>
  				<span>식당 : ${sdto.svo.sname }</span>
  			</div>
  		<div class="customer-content-wrap">
      		<div class="customer-content">
          		<div class="customer-review">
          			<h6>${rdto.rvo.title }</h6>
          			등록일 : ${rdto.rvo.regAt }<br>
					수정일 : ${rdto.rvo.modAt }<br>
          		</div>
          		<c:choose>
          			<c:when test="${rdto.rvo.rate <= 2.0}">
						<div class="customer-rating text-center" id="rate_face"><img src="../../../resources/mylist/photo/restaurant_not_recommend_active_face.png"  id="rate_face_img"><br><p id="rate_face_text" style="right:4px;">별로</p></div>
					</c:when>
					<c:when test="${rdto.rvo.rate > 2.0 && rdto.rvo.rate < 4.0}">
						<div class="customer-rating text-center" id="rate_face"><img src="../../../resources/mylist/photo/restaurant_ok_active_face.png"  id="rate_face_img"><br><p id="rate_face_text" style="right:4px;">괜찮다</p></div>
					</c:when>
					<c:otherwise>
						<div class="customer-rating text-center" id="rate_face"><img src="../../../resources/mylist/photo/restaurant_recommend_active_face.png" id="rate_face_img"><br><p id="rate_face_text" style="right:4px;">맛있다</p></div>
					</c:otherwise>
				</c:choose>
      		</div>
      		<p class="customer-text">${rdto.rvo.content }</p>
      		
      		<ul>
	      		<c:forEach items="${rdto.fileList }" var="fvo">
					<c:choose>
						<c:when test="${fvo.fileType == 1 }">
							<li><img src="/upload/${fn:replace(fvo.saveDir, '\\', '/') }/${fvo.uuid }_th_${fvo.fileName }" class="img-fluid"></li>
						</c:when>
						<c:otherwise></c:otherwise>			
					</c:choose>
				</c:forEach>
      		</ul>
        </div>
    	</div>
    	<hr>
	</div>
	<form action="" id="reviewRmForm" style="display: none;" method="post">
		<input type="hidden" id="rno" value="" name="rno">
		<input type="hidden" id="email" value="${ses.email }" name="email">
		<input type="hidden" value="${pgvo.pageNo }" name="pageNo">
		<input type="hidden" value="${pgvo.qty }" name="qty">
	</form>
</div>

<script src="/resources/js/review.myremove.js"></script>
	
<jsp:include page="../common/footer.jsp"/>
