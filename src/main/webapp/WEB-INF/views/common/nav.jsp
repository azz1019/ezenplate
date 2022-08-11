<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--============================= HEADER =============================-->
<div class="dark-bg sticky-top">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light">
					<a class="navbar-brand" href="/">EZEN PLATE</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-menu"></span>
 					</button>
					<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
 						<ul class="navbar-nav">
							<li class="nav-item dropdown">
								<a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티<span class="icon-arrow-down"></span></a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="/store/list">맛집 찾기</a>
									<a class="dropdown-item" href="/board/list">지역게시판</a>
									<a class="dropdown-item" href="/board/register">글쓰기</a>
								</div>
							</li>
 						 	<c:if test="${ses.grade == 99 }">
 							<li class="nav-item dropdown">
								<a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리자메뉴<span class="icon-arrow-down"></span></a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="/member/list">사용자 관리</a>
									<a class="dropdown-item" href="/">식당 관리</a>
									<a class="dropdown-item" href="/">게시판 관리</a>
									<a class="dropdown-item" href="/">신고 관리</a>
								</div>
							</li>
							</c:if>                           
							<c:choose>
								<c:when test="${ses.email ne null && ses.email ne '' }">
									<li class="nav-item dropdown">
										<a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">내정보<span class="icon-arrow-down"></span></a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
											<a class="dropdown-item" href="/member/modify?email=${ses.email }">프로필 수정</a>
											<a class="dropdown-item" href="/review/mylist">내가 쓴 리뷰</a>
											<a class="dropdown-item" href="/board/mylist">내가 쓴 지역게시판</a>
											<a class="dropdown-item" href="/store/mylist">내가 등록한 식당</a>
											<a class="dropdown-item" href="/want/list?mno=${ses.mno }">가고싶다</a>
											<a class="dropdown-item" href="/visited/list?mno=${ses.mno }">가봤어요</a>
										</div>
									</li>

									<li class="nav-item active"><a class="nav-link" href="/member/logout">로그아웃</a></li>
									<li><a href="/member/remove?email=${ses.email }" class="btn btn-outline-light top-btn"><span class="ti-minus"></span> 탈퇴</a></li>
					          	</c:when>
				        		<c:otherwise>
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
