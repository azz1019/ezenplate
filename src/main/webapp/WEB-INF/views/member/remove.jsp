<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<div class="container mt-3">
	<h2>탈퇴</h2>
	<div class="booking-checkbox">
		<h3><span id="emailVal">${mdto.mvo.email }</span>님 탈퇴 전 아래의 내용을 꼭 확인해 주세요.</h3>
		탈퇴 시 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는 복구가 불가능 합니다.<br>
		탈퇴 후 재가입 하더라도 탈퇴 전의 정보 및 서비스 이용 기록은 복구되지 않습니다.
	    <hr>
	</div>
	
	<a class="btn btn-danger" id="memberRemove">탈퇴하기</a>
	<form action="" id="memberRmForm" style="display: none;" method="post">
		<input type="hidden" id="email" value="" name="email">
	</form>
</div>

<script src="/resources/js/member.remove.js"></script>

<jsp:include page="../common/footer.jsp"/>