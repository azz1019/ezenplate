<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<!-- login Style Css-->
<link rel="stylesheet" href="/resources/member/css/modify.style.css">

<section class="vh-100 mt-5 mb-5">
<div class="container v-100">
<div class="wrapper bg-white mt-sm-5">
    <h4 class="pb-4 title ">회원정보수정</h4>
    <form action="/member/modify" method="post" enctype="multipart/form-data">
	    <div class="d-flex align-items-start border-bottom">
	    	<c:if test="${mdto.fvo eq null }">
    			<img src="/resources/member/photo/profile_none.png">
    		</c:if>
	    
			<c:if test="${mdto.fvo.uuid ne null && mdto.fvo.uuid ne '' }">
				<img src="/upload/${fn:replace(mdto.fvo.saveDir, '\\', '/') }/${mdto.fvo.uuid }_th_${mdto.fvo.fileName }">
			</c:if>
			
	        <div class="pl-sm-4 pl-2" id="img-section">
	        	<input type="file" class="form-control" style="display: none;" id="files" name="fileAttached" multiple>
	        	<div class="" id="fileZone"></div>
	        	
	        	<c:if test="${mdto.fvo eq null }">
	        		<b>프로필 사진 없음</b><br>
	        		<button type="button" id="attachTrigger" class="btn">이미지 첨부</button>
	        	</c:if>
	        
	        	<c:if test="${mdto.fvo.uuid ne null && mdto.fvo.uuid ne '' }">
	        		<b>이름 : ${mdto.fvo.fileName }</b>
		            <p>용량 : ${mdto.fvo.fileSize }</p>
		    		<button data-uuid="${mdto.fvo.uuid }" class="btn fileDelBtn">이미지 삭제</button>
	        	</c:if>
	        </div>      
	    </div>
	    <div class="py-2">
	        <div class="row py-2">
	            <div class="col-md-6">
	               <label for="email">이메일 : </label>
	               <input type="email" class="form-control" id="email" value="${mdto.mvo.email }" name="email" readonly>
	            </div>
	            <div class="col-md-6 pt-md-0 pt-3">
	               <label for="pwd">비밀번호 : </label>
			      	<input type="text" class="form-control" id="pwd" value="${mdto.mvo.pwd }" name="pwd">
	            </div>
	        </div>
	        <div class="row py-2">
	            <div class="col-md-6">
	               <label for="nickName">닉네임 : </label>
			      	<input type="text" class="form-control" id="nickName" value="${mdto.mvo.nickName }" name="nickName">
	            </div>
	            <div class="col-md-6 pt-md-0 pt-3" id="lang">
	               <label for="userLocate">지역 : </label>
	                <div class="arrow">
	                    <input type="hidden" class="form-control" id="userLocateText" value="${mdto.mvo.userLocate }" name="userLocateText">
						<select class="form-select selectbox" style="box-sizing: border-box;width: 100px;padding: 4px;font-size: 14px;border-radius: 6px;" id="userLocate" name="userLocate">
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
	            </div>
	        </div>
	        <div class="py-3 pb-4 border-bottom">
	           <button type="submit" class="btn mr-3" id="regBtn">수정</button>
	           <!-- <button class="btn border button" id="cancBtn" onclick="location.href='/'">취소</button> --> 	
	        </div>
	        <div class="d-sm-flex align-items-center pt-3" id="deactivate">
	            <div>
	                <b>계정을 삭제하고 싶다면? </b>
	                <p>If you want to delete your account </p>
	            </div>
	            <div class="ml-auto">
	                <button class="btn danger deleteAcc" onclick="location.href='/member/remove?email=${ses.email }'">회원탈퇴</button>
	            </div>
	        </div>
	    </div>
    </form>
</div>
</div>
</section>

<script>
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
	
	document.getElementById('attachTrigger').addEventListener('click', () => {
		document.getElementById('files').click();
	});
</script>
<script src="/resources/js/member.modify.js"></script>

<jsp:include page="../common/footer.jsp"/>