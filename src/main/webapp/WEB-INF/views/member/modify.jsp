<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<div class="container mt-3">
	<div class="row justify-content-center">
		<div class="col-md-5">
			<h3>프로필 수정</h3>
		</div>
	</div>
	<div class="row d-flex justify-content-center">
	    <div class="col-sm-8 p-3 bg-light">
	    	<form action="/member/modify" method="post" enctype="multipart/form-data">
				<div class="mb-3 mt-3">
		      		<label for="email">이메일 : </label>
		      		<div class="input-group">
		      			<input type="email" class="form-control" id="email" value="${mdto.mvo.email }" name="email" readonly>
		      		</div>
		    	</div>
		    	
		    	<div class="mb-3">
		      		<label for="pwd">비밀번호 : </label>
		      		<input type="text" class="form-control" id="pwd" value="${mdto.mvo.pwd }" name="pwd">
		    	</div>
		    	
		    	<div class="mb-3 mt-3">
		      		<label for="nickName">닉네임 : </label>
		      		<input type="text" class="form-control" id="nickName" value="${mdto.mvo.nickName }" name="nickName">
		    	</div>
		    	
		    	<div class="mb-3 mt-3">
			    	<label for="userLocate">지역 : </label>
			    	<input type="hidden" class="form-control" id="userLocateText" value="${mdto.mvo.userLocate }" name="userLocateText">
					<select class="selectpicker show-tick" data-style="btn-inverse" data-container="body" id="userLocate" name="userLocate">
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
		    
		    	<button type="submit" class="btn-form" id="regBtn" style="background-color: rgb(255, 113, 0);">수정</button> 	
			</form>
	    </div>
	    <div class="col-sm-4 p-3 bg-light text-white" style="text-align: center;">
	    	<c:if test="${mdto.fvo.uuid ne null && mdto.fvo.uuid ne '' }">
				<img src="/upload/${fn:replace(mdto.fvo.saveDir, '\\', '/') }/${mdto.fvo.uuid }_th_${mdto.fvo.fileName }" style="margin-top: 50px"><br>
    			<span class="badge bg-warning rounded-pill">현재 프로필 사진</span><br>
    			<span class="badge bg-warning rounded-pill">이름 : ${mdto.fvo.fileName }</span><br>
    			<span class="badge bg-warning rounded-pill">용량 : ${mdto.fvo.fileSize }</span><br>
    			<button data-uuid="${mdto.fvo.uuid }" class="mt-3 btn btn-outline-warning btn-sm fileDelBtn">삭제</button>
			</c:if>
	    </div>
	</div>
</div>
<br>

<script>
	document.getElementById('attachTrigger').addEventListener('click', () => {
		document.getElementById('files').click();
	});
	
	document.getElementById('regBtn').addEventListener('click', () => {
        alert('프로필 정보가 수정되었습니다.');
    });
	
	const userLocateCtrl = document.getElementById('userLocate');
	const userLocateValue = document.getElementById('userLocateText').value;
	for(let index = 0; index < userLocateCtrl.length; index++) {
		if(userLocateCtrl[index].value == userLocateValue) {
			userLocateCtrl[index].selected = true;
		}
	}
</script>
<script src="/resources/js/member.modify.js"></script>

<jsp:include page="../common/footer.jsp"/>