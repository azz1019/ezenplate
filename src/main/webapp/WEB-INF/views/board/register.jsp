<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="../common/header.jsp" />
<!-- Board Style Css-->
<link rel="stylesheet" href="/resources/board/css/board.style.css">

<jsp:include page="../common/nav.jsp" />

<!--============================= Register Form =============================-->
<section class="bg-image"
	style="background-image: url('/resources/board/photo/background.jpg');">
	<div class="mask d-flex align-items-center gradient-custom-3">
		<div class="container backGround">
			<div
				class="register row d-flex justify-content-center align-items-center">
				<div class="card" style="border-radius: 15px;">
					<div class="card-body p-5">
						<h2 class="text-uppercase text-center mb-5">게시글 작성</h2>

						<form action="/board/register" method="post"
							enctype="multipart/form-data">
							<div class="form-outline">
								<div class="row">
									<div class="col-md-6 mb-4">
										<select class="form-select" id="userLocate" name="userLocate">
											<option value="지역" selected>지역</option>
											<option value="서울">서울</option>
											<option value="경기">경기</option>
											<option value="인천">인천</option>
											<option value="강원">강원</option>
											<option value="충북">충북</option>
											<option value="충남">충남</option>
											<option value="세종">세종</option>
											<option value="대전">대전</option>
											<option value="전북">전북</option>
											<option value="전남">전남</option>
											<option value="광주">광주</option>
											<option value="경북">경북</option>
											<option value="경남">경남</option>
											<option value="대구">대구</option>
											<option value="울산">울산</option>
											<option value="부산">부산</option>
											<option value="제주">제주</option>
										</select>
									</div>
									<div class="col-md-6 mb-4">
										<div class="form-outline datepicker">
											<input type="text" class="form-control" id="nickName"
												value="${ses.nickName}" readOnly />
										</div>
									</div>
								</div>

								<div class="form-outline mb-4">
									<input type="text" class="form-control" id="bname"
										placeholder="제목을 입력해주세요" />
								</div>
								<div class="form-outline mb-4">
									<textarea id="content" name="content" class="form-control"
										rows="23" cols="70" placeholder="내용을 입력해주세요"></textarea>
								</div>
								<div class="form-outline">
									<div class="row">
										<div class="col-md-2">
											<input type="file" class="form-control"
												style="display: none;" id="files" name="fileAttached"
												multiple>
											<div class="d-grid">
												<button type="button" id="attachTrigger"
													class="btn btn-block d-block btnPhoto">
													<i class="fa-regular fa-image fa-2x"></i>
												</button>
											</div>
										</div>
										<div class="col-md-10">
											<div class="d-flex justify-content-center">
												<button type="button"
													class="btn btn-block btn-lg text-body sbmBtn" id="regBtn">올리기</button>
											</div>
										</div>
									</div>
								</div>
								<div class="form-outline md-4">
									<div class="my-3" id="fileZone"></div>
								</div>

								<p class="text-center text-muted mt-5 mb-0">
									글 등록을 취소하고 돌아가고 싶다면? <a href="/board/list"
										class="fw-bold text-body listBtn"><u>뒤로 돌아가기</u></a>
								</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- // END Register Form // -->


<script>
	document.getElementById('attachTrigger').addEventListener('click', () => {
		document.getElementById('files').click();
	});
</script>
<script src="/resources/js/board.register.js"></script>

<jsp:include page="../common/footer.jsp" />