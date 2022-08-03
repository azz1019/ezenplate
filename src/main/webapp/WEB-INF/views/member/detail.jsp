<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div class="container mt-3">
  <h2>상세정보</h2>
  <div class="card" style="width:600px">
    <img class="card-img-top" src="" alt="프로필사진 자리" style="width:100%">
    <div class="card-body">
      <p class="card-text">닉네임 : ${mdto.mvo.nickName }</p>
      <p class="card-text">이메일 : ${mdto.mvo.email }</p>
      <p class="card-text">등급 : 
      	<select name="memberGrade">
      		<option value="normal">일반회원</option>
      		<option value="holic">HOLIC</option>
      		<option value="admin">관리자</option>
      	</select>
      </p>
      <p class="card-text">최근 로그인 : ${mdto.mvo.lastLogin }</p>
      <p class="card-text">지역 : ${mdto.mvo.userLocate }</p>
      <p class="card-text">리뷰 수 : ${mdto.mvo.reviewCount }</p>
      <button type="button" id="gradeChangeBtn">등급변경</button>
    </div>
  </div>
</div>

<script src="/resources/js/member.modify.js"></script>
<jsp:include page="../common/footer.jsp" />