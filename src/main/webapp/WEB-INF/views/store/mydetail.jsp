<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<div class="container mt-3">
	<h2>식당 상세</h2>
	<section class="light-bg booking-details_wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12 responsive-wrap">
                    <div class="booking-checkbox_wrap">
                        <div class="booking-checkbox">
                            <h5>${sdto.svo.sname }</h5>
                            순번 : <span id="snoVal">${sdto.svo.sno }</span><br>
                            카테고리 : ${sdto.svo.category }<br>
                            소개 : ${sdto.svo.content }<br>
                            주소 : ${sdto.svo.locate }<br>
                            연락처 : ${sdto.svo.tel }<br>
                            휴일 : ${sdto.svo.holiday }<br>
                            <c:choose>
								<c:when test="${sdto.svo.approve eq 1}">승인여부 : 승인<br></c:when>
								<c:otherwise>승인여부 : 미승인<br></c:otherwise>
							</c:choose>
							등록일 : ${sdto.svo.regAt }<br>
							수정일 : ${sdto.svo.modAt }<br>
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
	
	<a href="/store/mylist?pageNo=${pgvo.pageNo }&qty=${pgvo.qty}" class="btn btn-warning">목록</a>
	
	<c:if test="${sdto.svo.approve eq 0}">
		<a class="btn btn-danger" id="storeRemove">삭제</a>
	</c:if>
	<form action="" id="storeRmForm" style="display: none;" method="post">
		<input type="hidden" id="sno" value="" name="sno">
		<input type="hidden" value="${pgvo.pageNo }" name="pageNo">
		<input type="hidden" value="${pgvo.qty }" name="qty">
	</form>
</div>

<script src="/resources/js/store.myremove.js"></script>
	
<jsp:include page="../common/footer.jsp"/>