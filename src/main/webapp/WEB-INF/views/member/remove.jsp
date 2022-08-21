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
                            <h4 class="removeCon"><span id="emailVal">${mdto.mvo.email }</span>님 탈퇴 전 아래의 내용을 꼭 확인해 주세요.</h4>
							<p>
								탈퇴 시 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는 복구가 불가능 합니다.<br>
								탈퇴 후 재가입 하더라도 탈퇴 전의 정보 및 서비스 이용 기록은 복구되지 않습니다.
							</p>                        
							<div class="btn-form" style="margin: auto; background-color: rgb(255, 113, 0);border-radius:10px;">
								<a id="memberRemove">탈퇴하기</a>
							</div>
							<form action="" id="memberRmForm" style="display: none;" method="post">
								<input type="hidden" id="email" value="" name="email">
							</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--// SLIDER -->

<script src="/resources/js/member.remove.js"></script>

<jsp:include page="../common/footer.jsp"/>