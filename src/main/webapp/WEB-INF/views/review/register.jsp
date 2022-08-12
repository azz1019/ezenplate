<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div class="container mt-3">
	<h2>리뷰 등록</h2>

	<form action="/review/register" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="sno" value="${rvo.sno }">
		<div class="mb-3 mt-3">
			<label for="writer">닉네임 : </label> <input type="text"
				class="form-control" id="writer" value="${ses.email }" name="writer"
				readonly>
		</div>

		<div class="mb-3">
			<label for="rate">평점 : </label> 
			<select class="form-select selectbox"
			style="box-sizing: border-box;width: 100px;padding: 4px;ont-size: 14px;border-radius: 6px;"
			id="rate" name="rate">
				<option value="1.0">1.0</option>
				<option value="1.5">1.5</option>
				<option value="2.0">2.0</option>
				<option value="2.5">2.5</option>
				<option value="3.0">3.0</option>
				<option value="3.5">3.5</option>
				<option value="4.0">4.0</option>
				<option value="4.5">4.5</option>
				<option value="5.0">5.0</option>
			</select>
		</div>
		
		<div class="mb-3 mt-3">
			<label for="content">리뷰 제목 : </label> 
			<input class="form-control"	name="title">
		</div>

		<div class="mb-3 mt-3">
			<label for="content">리뷰 내용 : </label> <textarea 
				 style="width: 100%; height: 200px;"
				name="content"></textarea>
		</div>

		<div class="mb-3">
			<label for="attach">사진 :</label> <input type="file"
				class="form-control" style="display: none;" id="files"
				name="fileAttached" multiple>
			<div class="d-grid">
				<button type="button" id="attachTrigger"
					class="btn btn-outline-primary btn-block d-block">이미지 첨부</button>
			</div>
			<div class="my-3" id="fileZone"></div>
		</div>
			<c:choose>
			 <c:when test="${ses.email ne null && ses.email ne '' }">
				<button type="submit" class="btn btn-primary" id="regBtn">등록</button>
			</c:when>
			<c:otherwise>
				<button type="submit" class="btn btn-primary disabled" id="regBtn">등록</button>
			</c:otherwise>
			</c:choose>
	</form>
</div>

<script>
	document.getElementById('attachTrigger').addEventListener('click', () => {
		document.getElementById('files').click();
	});
</script>
<script src="/resources/js/review.register.js"></script>

<jsp:include page="../common/footer.jsp" />