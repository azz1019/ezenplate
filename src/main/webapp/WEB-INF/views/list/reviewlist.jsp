<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<div class="d-flex">
	<div class="mt-3 ml-3"><h2>리뷰</h3></div>
</div>
<div class="d-flex justify-content-end">
	<div class="" href><a>전체</a></div>
	<div><a href>Holic</a></div>
	<div><a href>맛있어요</a></div>
	<div><a href>보통이에요</a></div>
	<div><a href>별로에요</a></div>
</div>
<hr>

<c:forEach items="${mlist }" var="ml">
<c:forEach items="${relist }" var="rl">
<c:if test="${ml.email == rl.writer }">
<div><img src="/upload/${fn:replace(fl.fvo.saveDir, '\\', '/') }/${fl.fvo.uuid }_th_${fl.fvo.fileName }"></div>
<div>${ml.email }</div>
<div>${rl.content }</div>
</c:if>
</c:forEach>
</c:forEach>
<jsp:include page="../common/footer.jsp"/>