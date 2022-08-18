<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="common/header.jsp"/>
<jsp:include page="common/nav.jsp"/>

	<!-- today  -->
	<c:set var="now" value="<%=new java.util.Date() %>"></c:set>
<fmt:formatDate value="${now}" pattern="E" var="today" />
	<c:set var="now_today" value="${today }요일"></c:set>
	<!-- //today  -->
	
    <!-- <img src="images/slider.jpg" class="img-fluid" alt="#"> -->
    <section class="slider d-flex align-items-center">
    
    <div class="container">
   <div class="row d-flex justify-content-center"role="group">
   <div class="col-md-10">
   		<form class="form-wrap mt-4" action="/store/list" method="get">
			<input type="hidden" name="pageNo" value="${pgn.pgvo.pageNo }">
			<input type="hidden" name="qty" value="9">
				<div class="input-group" style="font-family: 'Jua', sans-serif;">
				<c:set value="${pgn.pgvo.type }" var="typed"/>
					<select class="form-select" name="type" >
						<option value="nl" ${typed eq null ? 'selected' : '' }>전체 검색</option>
						<option value="n" ${typed eq 'n' ? 'selected' : '' }>식당 이름</option>
						<option value="l" ${typed eq 'l' ? 'selected' : '' }>지역</option>
						
					</select> 
					<input class="form-control me-2" type="search"
						placeholder="Search" aria-label="Search" name="kw" value="${pgn.pgvo.kw }">
					<button class="btn-form btn-font" type="submit"><span class="icon-magnifier search-icon" > Search</span><i class="pe-7s-angle-right"></i> 
					
					</button>
				</div>
			</form>	
			</div>
   </div>
   </div>
   </section>
   
<jsp:include page="common/footer.jsp"/>