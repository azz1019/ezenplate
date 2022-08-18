<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div class="container mt-3">
	<h2>상세정보</h2>
	<div class="card" style="width: 600px">

		<img src="/upload/${fn:replace(mdto.fvo.saveDir, '\\', '/') }/${mdto.fvo.uuid }_th_${mdto.fvo.fileName }" style="margin-top: 50px">
		<form action="/member/update" method="post">
			<div class="card-body">
				<div class="mb-3 mt-3">
					<label for="email">이메일 : </label>
					<div class="input-group">
						<input type="email" class="form-control" id="email" name="email"
							value="${mdto.mvo.email }" readonly>
					</div>
				</div>

				<div class="mb-3 mt-3">
					<label for="nickName">닉네임 : </label>
					<div class="input-group">
						<input type="text" class="form-control" id="nickName"
							name="nickName" value="${mdto.mvo.nickName }" readonly>
					</div>
				</div>

				<div class="mb-3 mt-3">
					<label for="lastLogin">최근 로그인 : </label>
					<div class="input-group">
						<input type="text" class="form-control" id="lastLogin"
							name="lastLogin" value="${mdto.mvo.lastLogin }" readonly>
					</div>
				</div>

				<div class="mb-3 mt-3">
					<label for="userLocate">지역 : </label>
					<div class="input-group">
						<input type="text" class="form-control" id="userLocate"
							name="userLocate" value="${mdto.mvo.userLocate }" readonly>
					</div>
				</div>

				<div class="mb-3 mt-3">
					<label for="reviewCount">리뷰 수 : </label>
					<div class="input-group">
						<input type="text" class="form-control" id="reviewCount"
							name="reviewCount" value="${mdto.mvo.reviewCount }" readonly>
					</div>
				</div>

				<div class="mb-3 mt-3">
					<label for="grade">등급 : </label> 
					<input type="hidden" class="form-control" id="gradeInput" value="${mdto.mvo.grade }" name="gradeInput">
					<select class="selectpicker show-tick" data-style="btn-inverse" data-container="body" id="grade" name="grade">
						<option value="10">일반사용자</option>
						<option value="50">HOLIC</option>
						<option value="99">관리자</option>
					</select>
				</div>

				<button type="submit" id="gradeChangeBtn">등급변경</button>
			</div>
		</form>
	</div>
</div>

<script>
	const gradeCtrl = document.getElementById('grade');
	const gradeVal = document.getElementById('gradeInput').value;
	for(let index = 0; index < gradeCtrl.length; index++) {
		if(gradeCtrl[index].value == gradeVal) {
			gradeCtrl[index].selected = true;
		}
	}
	
	document.getElementById('gradeChangeBtn').addEventListener('click', (e) => {
		alert("등급 변경 완료");
	});
</script>
<script src="/resources/js/manager.js"></script>
<jsp:include page="../common/footer.jsp" />
