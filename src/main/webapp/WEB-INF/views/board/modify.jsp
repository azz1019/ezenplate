<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


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
						<h2 class="text-uppercase text-center mb-5">게시글 수정</h2>

						<form action="/board/modify" method="post"
							enctype="multipart/form-data">
							<input type="hidden" value="${bdto.bvo.bno }" name="bno">
							<div class="form-outline">
								<div class="row">
									<div class="col-md-6 mb-4">
										<input type="hidden" class="form-control" id="userLocateText"
											value="${bdto.bvo.userLocate }" name="userLocateText">
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
											<input type="text" class="form-control" id="writer"
												name="writer" value="${ses.nickName}" readOnly />
										</div>
									</div>
								</div>

								<div class="form-outline mb-4">
									<input type="text" class="form-control" id="bname" name="bname"
										value="${bdto.bvo.bname }" />
								</div>
								<div class="form-outline mb-4">
									<textarea id="content" name="content" class="form-control"
										rows="23" cols="70" placeholder="내용을 입력해주세요">${bdto.bvo.content }</textarea>
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
												<button type="submit"
													class="btn btn-block btn-lg text-body sbmBtn" id="regBtn">수정</button>
											</div>
										</div>
									</div>
								</div>
								<div class="form-outline md-4">
									<div class="my-3" id="fileZone"></div>
								</div>

								<div class="container mt-3">
									<ul class="list-group list-group-flush">
										<c:forEach items="${bdto.fileList }" var="fvo">
											<li
												class="list-group-item d-flex justify-content-between align-items-center">
												${fvo.fileName } <span class="badge bg-primary rounded-pill">${fvo.fileSize }</span>
												<button data-uuid="${fvo.uuid }"
													class="btn btn-outline-danger btn-sm fileDelBtn">X</button>
											</li>
										</c:forEach>
									</ul>
								</div>


								<p class="text-center text-muted mt-5 mb-0">
									글 등록을 취소하고 돌아가고 싶다면? <a href="/board/list"
										class="fw-bold text-body listBtn"><u>뒤로 돌아가기</u></a>
								</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- // END Modify Form // -->

<script>
	document.getElementById('attachTrigger').addEventListener('click', () => {
		document.getElementById('files').click();
	});
	
	const userLocateCtrl = document.getElementById('userLocate');
	const userLocateValue = document.getElementById('userLocateText').value;
	for(let index = 0; index < userLocate.length; index++) {
		if(userLocate[index].value == userLocateValue) {
			userLocate[index].selected = true;
		}
	}
</script>

<script src="/resources/js/board.modify.js"></script>

<jsp:include page="../common/footer.jsp" />