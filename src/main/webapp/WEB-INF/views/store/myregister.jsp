<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<!-- title Style CSS-->
<link rel="stylesheet" href="/resources/common/css/title.style.css">

<div class="container mt-5 mb-5">
	<h2>식당 등록</h2>
	<form action="/store/myregister" method="post" enctype="multipart/form-data">
		<div class="mb-3 mt-3">
      		<label for="writer">닉네임 : </label>
      		<input type="text" class="form-control" id="writer" value="${ses.email }" name="writer" readonly>
    	</div>
	
		<div class="mb-3 mt-3">
      		<label for="sname">식당이름 : </label>
      		<input type="text" class="form-control" id="sname" placeholder="식당이름을 입력해주세요" name="sname" required>
    	</div>
    	
    	<div class="mb-3 mt-3">
	    	<label for="category">카테고리 : </label>
			<select class="form-select selectbox" style="box-sizing: border-box;width: 100px;padding: 4px;font-size: 14px;border-radius: 6px;" id="category" name="category" required>
	    		<option value="한식">한식</option>
	    		<option value="일식">일식</option>
	    		<option value="중식">중식</option>
	    		<option value="양식">양식</option>
	    		<option value="세계음식">세계음식</option>
	    		<option value="뷔페">뷔페</option>
	    		<option value="카페">카페</option>
	    		<option value="주점">주점</option>
			</select>
		</div>
		
		<div class="mb-3 mt-3">
      		<label for="content">소개 : </label>
      		<input type="text" class="form-control" id="content" placeholder="식당을 소개해주세요" name="content">
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="locate">주소 : </label>
      		<input type="text" id="address_kakao" name="locate" readonly />
    	</div>
    	<div class="mb-3 mt-3">
      		<label for="locate">상세 주소 : </label>
      		<input type="text" name="locate_detail" />
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="tel">연락처 : </label>
      		<input type="text" class="form-control" id="tel" placeholder="식당연락처를 입력해주세요" name="tel" required>
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="holiday">휴일 : </label>
      		<input type="text" class="form-control" id="holiday" placeholder="식당휴일을 입력해주세요" name="holiday">
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="menuName1">첫번째 메뉴 : </label>
      		<input type="text" class="form-control" id="menuName1" value="-" name="menuName1">
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="menuPrice1">첫번째 메뉴 가격 : </label>
      		<input type="text" class="form-control" id="menuPrice1" value="0" name="menuPrice1">
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="menuName2">두번째 메뉴 : </label>
      		<input type="text" class="form-control" id="menuName2" value="-" name="menuName2">
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="menuPrice2">두번째 메뉴 가격 : </label>
      		<input type="text" class="form-control" id="menuPrice2" value="0" name="menuPrice2">
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="menuName3">세번째 메뉴 : </label>
      		<input type="text" class="form-control" id="menuName3" value="-" name="menuName3">
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="menuPrice3">세번째 메뉴 가격 : </label>
      		<input type="text" class="form-control" id="menuPrice3" value="0" name="menuPrice3">
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="menuName4">네번째 메뉴 : </label>
      		<input type="text" class="form-control" id="menuName4" value="-" name="menuName4">
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="menuPrice4">네번째 메뉴 가격 : </label>
      		<input type="text" class="form-control" id="menuPrice4" value="0" name="menuPrice4">
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="menuName5">다섯번째 메뉴 : </label>
      		<input type="text" class="form-control" id="menuName5" value="-" name="menuName5">
    	</div>
    	
    	<div class="mb-3 mt-3">
      		<label for="menuPrice5">다섯번째 메뉴 가격 : </label>
      		<input type="text" class="form-control" id="menuPrice5" value="0" name="menuPrice5">
    	</div>
    	
    	<div class="mb-3">
			<label for="attach">사진 :</label>
			<input type="file" class="form-control" style="display: none;" id="files" name="fileAttached" multiple>
			<div class="d-grid">
				<button type="button" id="attachTrigger" class="btn btn-outline-warning btn-block d-block">이미지 첨부</button>
			</div>
			<div class="my-3" id="fileZone"></div> 
	    </div>
    
    	<button type="submit" class="btn btn-outline-warning" id="regBtn">등록</button>
	</form>
</div>

<script>
	document.getElementById('attachTrigger').addEventListener('click', () => {
		document.getElementById('files').click();
	});
</script>
<script src="/resources/js/store.myregister.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
<jsp:include page="../common/footer.jsp"/>
