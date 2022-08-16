<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<div class="d-flex flex-column align-self-center" >
<div class="ml-3 mr-3 w-50 align-self-center">
<div class="d-flex w-100 justify-content-between">
<div class="d-inline-flex">
	<div class="mt-3 ml-7"><h2 class="pl-7">리뷰</h3></div>
</div>
<div class="mt-3 ml-5 d-inline-flex justify-content-end">
 <ul class="nav mt-3"  >
    <li class="nav-item ml-3 mr-0">
      <a class="nav-link ${active }" href="../list/reviewlist">전체<span class="badge bg-primary rounded-pill ">${pgn.totalCount }</span></a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="../list/holic">Holic<span class="badge bg-primary rounded-pill ">${pgn1.totalCount }</span></a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="../list/good">맛있어요<span class="badge bg-primary rounded-pill ">${pgn2.totalCount }</span></a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="../list/bad">별로에요<span class="badge bg-primary rounded-pill ">${pgn3.totalCount }</span></a>
    </li>
  </ul>
  </div>
</div>
</div>
</div>
<hr>

<div class="d-flex flex-column align-self-center" id="listBody">
<c:forEach items="${bad }" var="ba">
<c:forEach items="${mlist }" var="ml">
<c:if test="${ba.writer == ml.email }">
<c:forEach items="${filelist }" var="fi">
<c:if test="${fi.mno == ml.mno }">
  <a href="../review/mydetail?rno=${ba.rno }" class="list-group-item list-group-item-action w-50 align-self-center" aria-current="true">
  <div class="row">
<div class="col">
    <div class="row-col">
		<div class="col"><img src="/upload/${fn:replace(fi.saveDir, '\\', '/') }/${fi.uuid }_th_${fi.fileName }" class="rounded-circle"></div>
    	<div class="col"><small class="pt-3">${ba.writer }</small></div>
	</div>
    </div>
    <div class="col-6">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1 mr-5 " style="width:600px;">${ba.content }</h5>
    </div>
    </div>
    <div class="col">
    	<div class="row-col">
			<div class="col"><small>3 days ago</small></div>
     <div class="col pt-5">
     	<div class="d-flex w-100 justify-content-between">
    			<c:if test="${ba.rate < 2.0}" > 
						<div class="customer-rating customer-rating-red">${ba.rate }</div>
					</c:if>
					<c:if test="${ba.rate eq 3.0 }">
						<div class="customer-rating customer-rating-yellow">${ba.rate }</div>
					</c:if>
					<c:if test="${ba.rate eq 4.0 }">
						<div class="customer-rating customer-rating-">${ba.rate }</div>
					</c:if>
					<c:if test="${ba.rate >= 5.0 }">
						<div class="customer-rating customer-rating-green">${ba.rate }</div>
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