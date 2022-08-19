<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.nav_color {
	background-color: rgb(255, 113, 0);
	font-family: 'AritaDotum';
}
.navbar-light .navbar-nav .active > .nav-link {
    color: #fff;
    font-weight: 500;
    font-size: 18px;
}

</style>

<!--============================= HEADER =============================-->
<div class="sticky-top nav_color">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light">
					<a class="navbar-brand" href="/"><img src="../resources/mylist/photo/EZEN.jpg" style="width:100%;height:50px;"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-menu"></span>
 					</button>
					<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
 						<ul class="navbar-nav">
							<c:choose>
								<%-- 로그인 O 상태 --%>
								<c:when test="${ses.email ne null && ses.email ne '' }">
									<!-- 최신 리뷰 보기 -->
									<li class="nav-item active"><a class="nav-link" href="/list/reviewlist">최신 리뷰 보기</a></li>
								
									<!-- 지역게시판 -->
									<li class="nav-item active"><a class="nav-link" href="/board/list">지역게시판</a></li>
								
									<!-- 내정보 -->
									<li class="nav-item dropdown">
										<a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">내정보<span class="icon-arrow-down"></span></a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
											<a class="dropdown-item" href="/member/modify?email=${ses.email }">프로필 수정</a>
											<a class="dropdown-item" href="/review/mylist">내가 쓴 리뷰</a>
											<a class="dropdown-item" href="/board/mylist">내가 쓴 지역게시판</a>
											<a class="dropdown-item" href="/store/mylist">내가 등록한 식당</a>
											<a class="dropdown-item" href="/want/list?mno=${ses.mno }">내가 즐겨찾기한 식당</a>
											<a class="dropdown-item" href="/visited/list?mno=${ses.mno }">내가 방문한 식당</a>
											<a class="dropdown-item" href="/member/remove?email=${ses.email }">탈퇴</a>
										</div>
									</li>
									
									<!-- 관리자메뉴 -->
									<c:if test="${ses.grade eq 99 }">
										<li class="nav-item dropdown">
											<a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리자메뉴<span class="icon-arrow-down"></span></a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
												<a class="dropdown-item" href="/member/list">사용자 관리</a>
												<a class="dropdown-item" href="/store/approve">식당 관리</a>
												<a class="dropdown-item" href="/review/reportlist">신고 관리</a>
											</div>
										</li>
									</c:if>
									
									<!-- 로그아웃 -->
									<li class="nav-item active"><a class="nav-link" href="/member/logout">로그아웃</a></li>
					          	</c:when>
					          	
					          	<%-- 로그인 X 상태 --%>
				        		<c:otherwise>
				        			<!-- 최신 리뷰 보기 -->
									<li class="nav-item active"><a class="nav-link" href="/list/reviewlist">최신 리뷰 보기</a></li>
									
				        			<!-- 지역게시판 -->
									<li class="nav-item active"><a class="nav-link" href="/board/list">지역게시판</a></li>
				        		
				        			<!-- 회원가입 -->
				        			<li class="nav-item active"><a class="nav-link" href="/member/login">로그인</a></li>
	                                <li><a href="/member/register" class="btn btn-outline-light top-btn"><span class="ti-plus"></span>회원가입</a></li>
				        		</c:otherwise>
			        		</c:choose>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</div>
