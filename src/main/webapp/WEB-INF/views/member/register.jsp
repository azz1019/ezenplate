<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<!-- SLIDER -->
<section class="slider d-flex align-items-center" style="background-image: url('/resources/mylist/photo/background.jpg');">
    <div class="container" style="
    margin-left: 500px;
    margin-right: 500px;
    margin-top: 200px;
    margin-bottom: 100px;
">
        <div class="row d-flex justify-content-center" style="border-radius: 30px; background-color : rgba(128,128,128,0.5); padding-top: 32px;padding-bottom: 32px;">
            <div class="col-md-12">
                <div class="slider-title_box">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slider-content_wrap" style="font-family: 'Jua', sans-serif;">
                                <h1>회원가입</h1>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="row d-flex justify-content-center" style="color: white;">
                        <div class="col-md-10">
						  	<form action="/member/register" method="post" enctype="multipart/form-data">
								<div class="mb-3 mt-3">
						      		<div class="input-group" style="width:90%; position: relative;left:10%;">
						      			<input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요" name="email" required style="height:60px;">
						      			<button type="button" class="btn btn-outline-warning" id="dupleCheck">중복확인</button>
						      		</div>
						    	</div>
						    	
						    	<div class="mb-3" style="width:90%; position: relative;left:10%;">
						      		<input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력해주세요" name="pwd" required style="height:60px;">
						    	</div>
						    	
						    	<div class="mb-3 mt-3" style="width:90%; position: relative;left:10%;">
						      		<input type="text" class="form-control" id="nickName" placeholder="닉네임을 입력해주세요" name="nickName" required style="height:60px;">
						    	</div>
						    	
						    	<div class="mb-3 mt-3">
							    	<label for="userLocate">지역 : </label>
									<select class="selectpicker show-tick" data-style="btn-inverse" data-container="body" id="userLocate" name="userLocate" required>
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
						    	
						    	<div class="mb-3">
									<label for="attach">프로필 사진 :</label>
									<input type="file" class="form-control" style="display: none;" id="files" name="fileAttached" multiple>
									<button type="button" id="attachTrigger" class="btn btn-outline-warning">이미지 첨부</button>
									<div class="my-3" id="fileZone"></div> 
							    </div>
						    	<br>
						    	<br>
						    	<button type="submit" class="btn-form" id="regBtn" style="background-color: rgb(255, 113, 0);font-family: 'Jua', sans-serif;">회원가입</button> 	
							</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--// SLIDER -->

<script>
	document.getElementById('attachTrigger').addEventListener('click', () => {
		document.getElementById('files').click();
	});
</script>
<script src="/resources/js/member.register.js"></script>

<jsp:include page="../common/footer.jsp"/>
