<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<!-- title Style CSS-->
<link rel="stylesheet" href="/resources/common/css/title.style.css">

<div class="container mt-5 mb-5">
	<h2>리뷰 수정</h2>
	<section class="light-bg booking-details_wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12 responsive-wrap">
                    <div class="booking-checkbox_wrap">
                        <div class="booking-checkbox">
                            <form action="/review/mymodify" method="post" enctype="multipart/form-data">
                            	<input type="hidden" value="${pgvo.pageNo }" name="pageNo">
								<input type="hidden" value="${pgvo.qty }" name="qty">
                            
                            	<div class="mb-3">
							      <label for="bno">순번 : </label>
							      <input type="text" class="form-control" id="rno" value="${rdto.rvo.rno }" name="rno" readonly>
							    </div>
                            
                            	<div class="mb-3">
							      <label for="sno">식당 순번 : </label>
							      <input type="text" class="form-control" id="sno" value="${rdto.rvo.sno }" name="sno" readonly>
							    </div>
                            
                            	<div class="mb-3">
							      <label for="rate">평점 : </label>
							      <input type="hidden" class="form-control" id="rateText" value="${rdto.rvo.rate }" name="rateText">
							      <select class="form-select selectbox" style="box-sizing: border-box;width: 100px;padding: 4px;font-size: 14px;border-radius: 6px;" id="rate" name="rate">
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
							    
							    <div class="mb-3">
							      <label for="title">제목 : </label>
							      <input type="text" class="form-control" id="title" value="${rdto.rvo.title }" name="title">
							    </div>
                            
                            	<div class="mb-3">
							      <label for="content">내용 : </label>
							      <textarea style="width: 100%; height: 200px;" id="content" name="content">${rdto.rvo.content }</textarea>
							    </div>
                            
                            	<div class="mb-3">
									<label for="attach">사진 :</label>
									<input type="file" class="form-control" style="display: none;" id="files" name="fileAttached" multiple>
									<div class="d-grid">
										<button type="button" id="attachTrigger" class="btn btn-outline-warning btn-block d-block">이미지 첨부</button>
									</div>
									<div class="my-3" id="fileZone"></div> 
							    </div>
							    
							    <button type="submit" class="btn btn-outline-warning" id="regBtn">수정</button>
                            </form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<hr>
<div class="container mt-3">
  <ul class="list-group list-group-flush">
  	<c:forEach items="${rdto.fileList }" var="fvo">
    <li class="list-group-item d-flex justify-content-between align-items-center">
      ${fvo.fileName }
      <span class="badge bg-primary rounded-pill">${fvo.fileSize }</span>
      <button data-uuid="${fvo.uuid }" class="btn btn-outline-danger btn-sm fileDelBtn">X</button>
    </li>
    </c:forEach>
  </ul>
</div>

<script>
	document.getElementById('attachTrigger').addEventListener('click', () => {
		document.getElementById('files').click();
	});
	
	const rateCtrl = document.getElementById('rate');
	const rateValue = document.getElementById('rateText').value;
	for(let index = 0; index < rateCtrl.length; index++) {
		if(rateCtrl[index].value == rateValue) {
			rateCtrl[index].selected = true;
		}
	}
</script>
<script src="/resources/js/review.mymodify.js"></script>

<jsp:include page="../common/footer.jsp"/>