<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<div class="container mt-3">
	<h2>로그인</h2>
  	<form action="/member/login" method="post">
		<div class="mb-3 mt-3">
      		<label for="email">이메일 : </label>
      		<input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요" name="email" required>
    	</div>
    	<div class="mb-3">
      		<label for="pwd">비밀번호 : </label>
      		<input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력해주세요" name="pwd" required>
    	</div>
    	<button type="submit" class="btn btn-primary">로그인</button>   	
	</form>
</div>

<jsp:include page="../common/footer.jsp"/>