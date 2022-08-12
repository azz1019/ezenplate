<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<!--============================= BOOKING =============================-->
<c:set var="now" value="<%=new java.util.Date()%>"></c:set>
<fmt:formatDate value="${now}" pattern="E" var="today" />
<c:set var="now_today" value="${today }요일"></c:set>
<div>

	<!-- Swiper -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<c:forEach items="${sdto.fileList }" var="fvo">
				<div class="swiper-slide">
					<a
						href="/upload/${fn:replace(fvo.saveDir, '\\','/')}/${fvo.uuid}_${fvo.fileName}"
						class="grid image-link"> <img
						src="/upload/${fn:replace(fvo.saveDir, '\\','/')}/${fvo.uuid}_${fvo.fileName}"
						class="img-fluid">
					</a>
				</div>
			</c:forEach>

		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination swiper-pagination-white"></div>
		<!-- Add Arrows -->
		<div class="swiper-button-next swiper-button-white"></div>
		<div class="swiper-button-prev swiper-button-white"></div>
	</div>
</div>
<!--//END BOOKING -->
<!--============================= RESERVE A SEAT =============================-->
<section class="reserve-block">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<input type="hidden" value="${ses.email }" id="email">
				<h5 id="store_name">${sdto.svo.sname }</h5>
				<fmt:parseNumber var="rate" value="${sdto.svo.rateAvg }"
					integerOnly="true" />
				<c:choose>
					<c:when test="${rate == 0 }">
						<p>$$$$$</p>
					</c:when>
					<c:when test="${rate == 1 }">
						<p>
							<span>$</span>$$$$
						</p>
					</c:when>
					<c:when test="${rate == 2 }">
						<p>
							<span>$$</span>$$$
						</p>
					</c:when>
					<c:when test="${rate == 3 }">
						<p>
							<span>$$$</span>$$
						</p>
					</c:when>
					<c:when test="${rate == 4 }">
						<p>
							<span>$$$$</span>$
						</p>
					</c:when>
					<c:when test="${rate == 5 }">
						<p>
							<span>$$$$$</span>
						</p>
					</c:when>
				</c:choose>

			</div>
			<div class="col-md-6">
				<div class="reserve-seat-block">
					<c:choose>
						<c:when test="${sdto.svo.rateAvg < 2.0 }">
							<div class="reserve-rating bg-danger">
								<span>${Math.round(sdto.svo.rateAvg*10)/10.0 }</span>
							</div>
						</c:when>
						<c:when
							test="${sdto.svo.rateAvg >= 2.0 && sdto.svo.rateAvg < 4.0 }">
							<div class="reserve-rating bg-warning">
								<span>${Math.round(sdto.svo.rateAvg*10)/10.0 }</span>
							</div>
						</c:when>
						<c:when test="${sdto.svo.rateAvg >= 4.0 }">
							<div class="reserve-rating">
								<span>${Math.round(sdto.svo.rateAvg*10)/10.0 }</span>
							</div>
						</c:when>

					</c:choose>
					<c:choose>
						<c:when test="${ses.email ne null && ses.email ne '' }">
							<div class="review-btn">
								<a href="/review/register?sno=${sdto.svo.sno }"
									class="btn btn-outline-danger">WRITE A REVIEW</a> <span>${sdto.svo.cmtQty }</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="review-btn">
								<a href="#" class="btn btn-outline-danger disabled">WRITE A
									REVIEW</a> <span>${sdto.svo.cmtQty }</span>
							</div>
						</c:otherwise>
					</c:choose>
					<div class="reserve-btn">
						<div class="featured-btn-wrap">
							<c:choose>
								<c:when test="${ses.email ne null && ses.email ne '' }">
									<a href="/want/register?sno=${sdto.svo.sno }&mno=${ses.mno}" class="btn btn-danger">가고싶다</a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-danger" id="login_plz">가고싶다</a>
								</c:otherwise>							
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--//END RESERVE A SEAT -->
<!--============================= BOOKING DETAILS =============================-->
<section class="light-bg booking-details_wrap">
	<div class="container">
		<div class="row">
			<div class="col-md-8 responsive-wrap">
				<div class="booking-checkbox_wrap">
					<div class="booking-checkbox">

						<p>${sdto.svo.content }</p>
						<hr>
					</div>
					<div class="row">

						<div class="col-md-4">
							<label class="custom-checkbox"> <span
								class="ti-check-box"></span> <span
								class="custom-control-description">Menu</span>
							</label>
						</div>
						<c:if test="${sdto.svo.menuName1 ne '-' }">
							<div class="col-md-4">
								<label class="custom-checkbox"> <span
									class="ti-check-box"></span> <span
									class="custom-control-description">${sdto.svo.menuName1 }
										: ${sdto.svo.menuPrice1 }</span>
								</label>
							</div>
						</c:if>

						<c:if test="${sdto.svo.menuName2 ne '-' }">
							<div class="col-md-4">
								<label class="custom-checkbox"> <span
									class="ti-check-box"></span> <span
									class="custom-control-description">${sdto.svo.menuName2 }
										: ${sdto.svo.menuPrice2 }</span>
								</label>
							</div>
						</c:if>

						<c:if test="${sdto.svo.menuName3 ne '-' }">
							<div class="col-md-4">
								<label class="custom-checkbox"> <span
									class="ti-check-box"></span> <span
									class="custom-control-description">${sdto.svo.menuName3 }
										: ${sdto.svo.menuPrice3 }</span>
								</label>
							</div>
						</c:if>

						<c:if test="${sdto.svo.menuName4 ne '-' }">
							<div class="col-md-4">
								<label class="custom-checkbox"> <span
									class="ti-check-box"></span> <span
									class="custom-control-description">${sdto.svo.menuName4 }
										: ${sdto.svo.menuPrice4 }</span>
								</label>
							</div>
						</c:if>

						<c:if test="${sdto.svo.menuName5 ne '-' }">
							<div class="col-md-4">
								<label class="custom-checkbox"> <span
									class="ti-check-box"></span> <span
									class="custom-control-description">${sdto.svo.menuName5 }
										: ${sdto.svo.menuPrice5 }</span>
								</label>
							</div>
						</c:if>

						<div class="col-md-4">
							<label class="custom-checkbox"> <span
								class="ti-check-box"></span> <span
								class="custom-control-description">최근 업데이트 :
									${sdto.svo.modAt }</span>
							</label>
						</div>
					</div>
				</div>
				<!-- 리뷰 -->
				<div class="booking-checkbox_wrap mt-4">
					<h5>${sdto.svo.cmtQty }Reviews</h5>
					<hr>
					<input type="hidden" id="sno" value="${sdto.svo.sno }">

					<div id="review_list"></div>

				</div>
			</div>
			<div class="col-md-4 responsive-wrap">
				<div class="contact-info">
					<div id="map" style="width: 100%; height: 300px;"></div>


					<div class="address">
						<span class="icon-location-pin"></span>
						<p id="store_locate">${sdto.svo.locate }</p>
					</div>
					<div class="address">
						<span class="icon-screen-smartphone"></span>
						<p>${sdto.svo.tel }</p>
					</div>

					<div class="address">
						<span class="icon-clock"></span>
						<p>${sdto.svo.holiday } 
							
							<c:choose>
								<c:when test="${sdto.svo.holiday eq now_today }">
									<span class="close-now">CLOSE NOW</span>
						</p>
						</c:when>
						<c:when test="${sdto.svo.holiday ne now_today }">
							<span class="open-now">OPEN NOW</span>
					</p>
						</c:when>
						</c:choose>
					</div>
					<c:choose>
						<c:when test="${ses.email ne null && ses.email ne '' }">
							<a href="/visited/register?mno=${ses.mno }&sno=${sdto.svo.sno}" class="btn btn-outline-danger btn-contact">가봤어요</a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-outline-danger btn-contact " id="login_plz">가봤어요</a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="follow">
					<div class="follow-img">
						<img src="" class="img-fluid" alt="#">
						<h6>Christine Evans</h6>
						<span>New York</span>
					</div>
					<ul class="social-counts">
						<li>
							<h6>26</h6> <span>Listings</span>
						</li>
						<li>
							<h6>326</h6> <span>Followers</span>
						</li>
						<li>
							<h6>12</h6> <span>Followers</span>
						</li>
					</ul>
					<a href="#">FOLLOW</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!--// SLIDER -->
<script src="/resources/js/review.list.js"></script>
<script>
	get_review_list();
</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2de0e8ebdfa1edf21dac9afa475efc03&libraries=services"></script>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	var local = document.getElementById('store_locate').innerText;
	var store = document.getElementById('store_name').innerText;
	//주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					local,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">'
												+ store + '</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
</script>
<!-- Magnific popup JS -->
<script src="/resources/dist/js/jquery.magnific-popup.js"></script>
<!-- Swipper Slider JS -->
<script src="/resources/dist/js/swiper.min.js"></script>
<script>
	var swiper = new Swiper('.swiper-container', {
		slidesPerView : 3,
		slidesPerGroup : 3,
		loop : true,
		loopFillGroupWithBlank : true,
		pagination : {
			el : '.swiper-pagination',
			clickable : true,
		},
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},
	});
</script>
<script>
	if ($('.image-link').length) {
		$('.image-link').magnificPopup({
			type : 'image',
			gallery : {
				enabled : true
			}
		});
	}
	if ($('.image-link2').length) {
		$('.image-link2').magnificPopup({
			type : 'image',
			gallery : {
				enabled : true
			}
		});
	}
</script>
<script type="text/javascript">
document.getElementById('login_plz').addEventListener('click', (e)=>{
	alert("로그인 해주세요");
});


</script>
<script type="text/javascript">
let visit_ok = '<c:out value="${visit_ok}"/>';
let visit_no = '<c:out value="${visit_no}"/>';
if(visit_ok){
	alert("가봤어요를 등록했습니다");
}
if(visit_no){
	alert("이미 가봤어요를 등록되어 있습니다");
}
</script>
<script type="text/javascript">
let want_ok = '<c:out value="${want_ok}"/>';
let want_no = '<c:out value="${want_no}"/>';
let want_check = '<c:out value="${want_check}"/>';
if(want_ok){
	alert("가고싶다를 등록했습니다.");
}
if(want_no){
	alert("가고싶다 등록을 실패 했습니다.");
}
if(want_check){
	alert("가고싶다가 이미 등록되어 있습니다.");
}
</script>
<jsp:include page="../common/footer.jsp" />
