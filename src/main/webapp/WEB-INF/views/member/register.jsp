<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<!-- register Style Css-->
<link rel="stylesheet" href="/resources/member/css/register.style.css">


<section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11 mt-5 firstCard">
        <div class="card text-black mt-5" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
            
              <div class="col-md-10 col-lg-8 col-xl-7 order-2 order-lg-1 pt-3">
                <p class="regTitle text-center fw-bold mb-5 mx-1 mx-md-4 mt-3">회원가입 </p>
                
               	<form action="/member/register" method="post" enctype="multipart/form-data">
              	 <div class="col-md-10 mb-4">
					<div class="d-flex justify-content-center">
                     <input type="email" class="form-control inputFormEmail" id="email" placeholder="이메일을 입력해주세요" name="email" required>
                     <button type="button" class="btn btn-outline-warning" id="dupleCheck">중복확인</button>
                  </div>
                 </div>

                  <div class="col-md-10 mb-4">
                     <input type="password" class="form-control inputForm" id="pwd" placeholder="비밀번호를 입력해주세요" name="pwd" required>
                  </div>

				<div class="row mb-5">
						<select class="form-select col-md-2" id="userLocate" name="userLocate">
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
						<div class="form-outline datepicker col-md-7">
							<input type="text" class="form-control inputFormName" id="nickName" placeholder="닉네임을 입력해주세요" name="nickName" required>
						</div>
				</div>
                 
               <div class="form-outline">
				<div class="row">
					<div class="col-md-2">
						<input type="file" class="form-control"
							style="display: none;" id="files" name="fileAttached"
							multiple>
						<div class="d-grid">
							<button type="button" id="attachTrigger"
								class="btn btn-block d-block btnPhoto" data-bs-toggle="tooltip" data-bs-placement="bottom" title="사진을 추가할 수 있어요">
								<i class="fa-regular fa-image fa-2x"></i>
							</button>
						</div>
					</div>
					<div class="col-md-8">
						<div class="d-flex justify-content-center">
							<button type="submit"
								class="btn btn-block btn-lg text-body sbmBtn" id="regBtn">회원가입하기</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-outline md-4">
				<div class="my-3" id="fileZone"></div>
			</div>
                </form>

              </div>
	            	<div class="col-md-10 col-lg-6 col-xl-5 d-flex align-items-center order-1 order-lg-2">
	                <img src="/resources/member/photo/withEzen1.png" alt="Sample image" style="width:85%; height:auto;">
	              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>




<script>
	document.getElementById('attachTrigger').addEventListener('click', () => {
		document.getElementById('files').click();
	});
	
	// Initialize tooltips
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
	  return new bootstrap.Tooltip(tooltipTriggerEl)
	});
</script>
<script src="/resources/js/member.register.js"></script>

<jsp:include page="../common/footer.jsp"/>
