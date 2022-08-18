<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<!-- SLIDER -->
<section class="slider d-flex align-items-center" style="background-image: url('/resources/mylist/photo/background.jpg');">
    <div class="container">
        <div class="row d-flex justify-content-center" style="background-color : rgba(128,128,128,0.85);">
            <div class="col-md-12">
                <div class="slider-title_box">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slider-content_wrap" style="font-family: 'login_font';">
                                <img src="../resources/mylist/photo/EZEN(no-bg).png" >
                            </div>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-10">
						  	<form action="/member/login" method="post">
								<div class="mb-3 mt-3" style="position: relative;left:23%;" >
						      		<input type="email"class="form-control" id="email" placeholder="이메일을 입력해주세요" name="email" required style="width:54%; height:60px;">
						    	</div>
						    	<div class="mb-3" style="position: relative;left:23%;border-bottom:40px">
						      		<input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력해주세요" name="pwd" required style="width:54%; height:60px;">
						    	</div>
						    	<br>
						    	<br>
						    	<button type="submit" class="btn-form" style="background-color: rgb(255, 113, 0);font-family: 'login_font';">로그인</button>   	
							</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--// SLIDER -->

<jsp:include page="../common/footer.jsp"/>
