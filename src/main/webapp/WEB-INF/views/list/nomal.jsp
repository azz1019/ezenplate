<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<div class="d-flex">
	<div class="mt-3 ml-3"><h2>리뷰</h3></div>
</div>
<div class="d-flex justify-content-end">
	<div class="" href="/"><a>전체</a></div>
	<div><a href="../list/holic">Holic</a></div>
	<div><a href="../list/good">맛있어요</a></div>
	<!-- <div><a href="../list/nomal">보통이에요</a></div> -->
	<div><a href="../list/bad">별로에요</a></div>
</div>
<hr>
<c:forEach items="${mlist }" var="ml">
<c:forEach items="${nomal }" var="no">
<c:if test="${ml.email == no.writer }">
<div>${ml.email }</div>
<div>${no.content }</div>
<div>${no.rate }</div>
</c:if>
</c:forEach>
</c:forEach>
<jsp:include page="../common/footer.jsp"/>