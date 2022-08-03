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
							<c:choose>
								<c:when test="${ses.email ne null && ses.email ne '' }">
									<li class="nav-item dropdown">
										<a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">내정보<span class="icon-arrow-down"></span></a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
											<a class="dropdown-item" href="/member/modify?email=${ses.email }">프로필 수정</a>
											<a class="dropdown-item" href="/">내가 쓴 리뷰</a>
											<a class="dropdown-item" href="/store/mylist">내가 등록한 식당</a>
											<a class="dropdown-item" href="/">가고싶다</a>
											<a class="dropdown-item" href="/">가봤어요</a>
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