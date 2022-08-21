<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<!-- detail Style Css-->
<link rel="stylesheet" href="/resources/member/css/detail.style.css">

<section class="vh-100 mt-5 mb-5">
	<div class="container v-100">
		<div class="wrapper bg-white mt-sm-5">
			<h4 class="pb-4 title text-center">회원상세정보</h4>
			<form action="/member/update" method="post">
				<div class="d-flex align-items-center border-bottom">
					<c:if test="${mdto.fvo eq null }">
						<img src="/resources/member/photo/profile_none.png">
					</c:if>

					<c:if test="${mdto.fvo.uuid ne null && mdto.fvo.uuid ne '' }">
						<img
							src="/upload/${fn:replace(mdto.fvo.saveDir, '//', '/') }/${mdto.fvo.uuid }_${mdto.fvo.fileName }"
							style="width: 45%; height: 150px;">
					</c:if>

					<div class="pl-sm-4 pl-2 mt-4" id="img-down-sec">
						<b class="detailNick">닉네임 : ${mdto.mvo.nickName }</b>
						<p class="detailEmail">이메일 : ${mdto.mvo.email }</p>
					</div>
				</div>
				<div class="py-2">
					<div class="row py-2">
						<div class="col-md-6">
							<label for="userLocate">지역 : </label> <input type="text"
								class="form-control" id="userLocate" name="userLocate"
								value="${mdto.mvo.userLocate }" readonly>
						</div>
						<div class="col-md-6 pt-md-0 pt-3">
							<label for="lastLogin">최근 로그인 : </label> <input type="text"
								class="form-control" id="lastLogin" name="lastLogin"
								value="${mdto.mvo.lastLogin }" readonly>
						</div>
					</div>
					<div class="row py-2">
						<div class="col-md-6">
							<label for="reviewCount">리뷰 수 : </label> <input type="text"
								class="form-control" id="reviewCount" name="reviewCount"
								value="${mdto.mvo.reviewCount }" readonly>
						</div>
						<div class="col-md-6 pt-md-0 pt-3" id="lang">
							<label for="grade">등급 : </label>
							<div class="arrow">
								<input type="hidden" class="form-control" id="gradeInput"
									value="${mdto.mvo.grade }" name="gradeInput"> <select
									class="form-select" id="grade" name="grade">
									<option value="10">일반사용자</option>
									<option value="50">HOLIC</option>
									<option value="99">관리자</option>
								</select>
							</div>
						</div>
					</div>
					<div class="py-3 pb-4 border-botto" align="right">
						<input type="hidden" name="email" value="${mdto.mvo.email }">
						<button type="submit" class="btn mr-3" id="gradeChangeBtn">등급변경</button>
						<!-- <button class="btn border button" id="cancBtn"
							onclick="location.href='/member/list'">취소</button> -->
					</div>
				</div>
			</form>
		</div>
	</div>
</section>







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
<jsp:include page="../common/footer.jsp" />
