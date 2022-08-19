<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<!-- login Style Css-->
<link rel="stylesheet" href="/resources/member/css/login.style.css">

<!-- SLIDER -->
<section class="slider d-flex" style="background-image: url('/resources/member/photo/background1.jpg');">
    <div class="container">
        <div class="row d-flex backgroundC">
            <div class="col-md-12">
                <div class="slider-title_box">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slider-content_wrap logo" style="font-family: 'login_font';">
                                <img src="../resources/mylist/photo/EZEN(no-bg)_v2.png" >
                            </div>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-10">
						  	<form action="/member/login" method="post">
								<div class="mb-3" style="position: relative;left:20%;" >
						      		<input type="email"class="form-control" id="email" placeholder="이메일을 입력해주세요" name="email" required>
						    	</div>
						    	<div class="mb-3" style="position: relative;left:20%;border-bottom:40px">	
						      		<input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력해주세요" name="pwd" required>
						    	</div>
						    	<br>
						    	<button type="submit" class="loginBtn">로그인</button>   	
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
