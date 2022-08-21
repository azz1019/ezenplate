<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<link href="/resources/mylist/css/common.style.css" rel="stylesheet">
<div class="d-flex flex-column align-self-center" id="listHead">
<div class="ml-3 mr-3 w-75 align-self-center">
<div class="d-flex w-100 justify-content-between">
<div class="d-inline-flex new_review_title_name">
	<div class="mt-3 ml-7 new_review_font"><h2 class="pl-7">리뷰</h2></div>
</div>
<div class="mt-3 ml-5 d-inline-flex justify-content-end">
 <ul class="nav mt-3"  >
    <li class="nav-item ml-3 mr-0 ">
      <a class="nav-link disabled" href="../list/reviewlist?pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">전체<span class="badge bg-primary rounded-pill ">${pgn.totalCount }</span></a>
    </li>
    <li class="nav-item new_review_select">
      <a class="nav-link ${active }" href="../list/holic?pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">Holic<span class="badge bg-primary rounded-pill ">${pgn1.totalCount }</span></a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="../list/good?pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">맛있어요<span class="badge bg-primary rounded-pill ">${pgn2.totalCount }</span></a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="../list/bad?pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">별로에요<span class="badge bg-primary rounded-pill ">${pgn3.totalCount }</span></a>
    </li>
  </ul>
  </div>
</div>
</div>
</div>
<hr>

<div class="d-flex flex-column align-self-center" id="listBody">
<c:forEach items="${filelist }" var="fi">
<c:forEach items="${holic }" var="ho">
<c:if test="${ho.mno == fi.mno }">
<c:forEach items="${relist }" var="re">
<c:if test="${re.writer == ho.email }">
  <a href="../review/mydetail?rno=${re.rno }" class="list-group-item list-group-item-action w-75 align-self-center" aria-current="true">
<div class="row">
<div class="col img_fix">
    <div class="row-col new_review_img">
		<div class="col"><img src="/upload/${fn:replace(fi.saveDir, '\\', '/') }/${fi.uuid }_th_${fi.fileName }" class="rounded-circle"></div>
    	<div class="col"><small class="pt-3">${re.writer }</small></div>
	</div>
    </div>
    <div class="col-6">
    <div class="d-flex w-100 justify-content-between new_review_font">
      <h5 class="mb-1 mr-5 new_review_title" >${re.title }</h5>
    </div>
    </div>
    <div class="col">
    	<div class="row-col new_review_face">
			<c:forEach items="${msg }" var="ms">
    	<c:if test="${ms.rno == re.rno}">
			<div class="col"><small>${ms.diffTime }</small></div>
    	</c:if>
    	</c:forEach>
     <div class="col pt-5" style="padding-top: 1.5rem!important;" >
     	<div class="d-flex w-100 justify-content-between">
					<c:if test="${re.rate <= 2.0}" > 
						<div class="customer-rating text-center" id="rate_face"><img src="../../../resources/mylist/photo/restaurant_not_recommend_active_face.png"  id="rate_face_img"><br><p id="rate_face_text">별로</p></div>
					</c:if>
					<c:if test="${re.rate > 2.0 && re.rate < 4.0}">
						<div class="customer-rating text-center" id="rate_face"><img src="../../../resources/mylist/photo/restaurant_ok_active_face.png"  id="rate_face_img"><br><p id="rate_face_text">괜찮다</p></div>
					</c:if>
					<c:if test="${re.rate >= 4.0 }">
						<div class="customer-rating text-center" id="rate_face"><img src="../../../resources/mylist/photo/restaurant_recommend_active_face.png" id="rate_face_img"><br><p id="rate_face_text">맛있다</p></div>
					</c:if>
				</div>
    	</div>
    </div>
    </div>
</div>
  </a>
</c:if>
</c:forEach>
</c:if>
</c:forEach>
</c:forEach>
</div>

<jsp:include page="../common/footer.jsp"/>
