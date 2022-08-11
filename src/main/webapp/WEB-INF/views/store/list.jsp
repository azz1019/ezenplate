<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<!-- SLIDER -->

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
				<div class="input-group">
				<c:set value="${pgn.pgvo.type }" var="typed"/>
					<select class="form-select" name="type">
						<option value="nl" ${typed eq null ? 'selected' : '' }>전체 검색</option>
						<option value="n" ${typed eq 'n' ? 'selected' : '' }>식당 이름</option>
						<option value="l" ${typed eq 'l' ? 'selected' : '' }>지역</option>
						
						
						
						
					</select> 
					<input class="form-control me-2" type="search"
						placeholder="Search" aria-label="Search" name="kw" value="${pgn.pgvo.kw }">
					<button class="btn-form" type="submit"><span class="icon-magnifier search-icon">Search</span><i class="pe-7s-angle-right"></i> 
					
					</button>
				</div>
			</form>	
			</div>
   </div>
   </div>
   </section>
   
   
   		
   			
	   
   			
   		
   		
   
   <section class="main-block light-bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="styled-heading">
                        <h3>Featured Places</h3>
                    </div>
                </div>
            </div>
            <div class="row" id="list_zone">
            <c:choose>
            	<c:when test="${list ne null }">
            	
            	<c:if test="${pgn.totalCount eq 0 }">
            		<div class="row justify-content-center">
            		
            		<h3 class="text-dark text-center ">검색 결과가 없습니다.</h3>
            		<c:choose>
            <c:when test="${ses.email ne null && ses.email ne '' }">
            <div class="justify-content-center">
                <div class="col-md-4">
                    <div class="featured-btn-wrap">
                        <a href="/store/myregister" class="btn btn-danger"><span class="ti-plus"></span> New Store</a>
                    </div>
                </div>
            </div>
            </c:when>
            <c:otherwise>
            	<div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="featured-btn-wrap">
                        <a href="/store/myregister" class="btn btn-danger disabled"><span class="ti-plus"></span> New Store</a>
                    </div>
                </div>
            </div>
            </c:otherwise>
            </c:choose>
            		</div>
            	</c:if>
            <c:forEach items="${list }" var ="list">
            <%-- <c:if test="${list.svo.approve ne 0  }"> --%>
                <div class="col-md-4 featured-responsive">
                    <div class="featured-place-wrap">
                        <a href="/store/detail?sno=${list.svo.sno }">
                        
                        <c:forEach items="${list.fileList }" var="fvo">
                        
                            <img src="/upload/${fn:replace(fvo.saveDir, '\\','/')}/${fvo.uuid}_th_${fvo.fileName}" class="img-fluid">
                            
                        </c:forEach>    
                            <c:choose>
                            	<c:when test="${list.svo.rateAvg <= 2.0 }">
                            	
                            		<span class="featured-rating">${Math.round(list.svo.rateAvg*10)/10.0 }</span>	
                            	</c:when>
                            	<c:when test="${list.svo.rateAvg > 2.0 && list.svo.rateAvg < 4.0}">
                            		<span class="featured-rating-orange">${Math.round(list.svo.rateAvg*10)/10.0 }</span>
                            	</c:when>
                            	<c:when test="${list.svo.rateAvg >= 4.0}">
                            		<span class="featured-rating-green">${Math.round(list.svo.rateAvg*10)/10.0 }</span>
                            	</c:when>
                            </c:choose>
                            <div class="featured-title-box">
                                <h6>${list.svo.sname }</h6>
                                <p>${list.svo.category } </p> <span>• </span>
                                <p>${list.svo.cmtQty }</p> <span> • </span>
                                <fmt:parseNumber var="rate" value="${list.svo.rateAvg }" integerOnly="true"/>
                                <c:choose>
                                	<c:when test="${rate == 0 }">
                                		<p>$$$$$</p>
                                	</c:when>
                                	<c:when test="${rate == 1 }">
                                		<p><span>$</span>$$$$</p>
                                	</c:when>
                                	<c:when test="${rate == 2 }">
                                		<p><span>$$</span>$$$</p>
                                	</c:when>
                                	<c:when test="${rate == 3 }">
                                		<p><span>$$$</span>$$</p>
                                	</c:when>
                                	<c:when test="${rate == 4 }">
                                		<p><span>$$$$</span>$</p>
                                	</c:when>
                                	<c:when test="${rate == 5 }">
                                		<p><span>$$$$$</span></p>
                                	</c:when>
                                </c:choose>
                                <ul>
                                    <li><span class="icon-location-pin"></span>
                                        <p>${list.svo.locate }</p>
                                    </li>
                                    <li><span class="icon-screen-smartphone"></span>
                                        <p>${list.svo.tel }</p>
                                    </li>
                                    

                                </ul>
                                <div class="bottom-icons">
                                	<c:choose>
                                		<c:when test="${list.svo.holiday eq now_today}">
                                			<div class="closed-now">CLOSED NOW</div>
                                		</c:when>
                                		<c:otherwise>
                                			<div class="open-now">OPEN NOW</div>
                                		</c:otherwise>
                                	</c:choose>
                                    <span class="ti-heart"></span>
                                    <span class="ti-bookmark"></span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                
                </c:forEach>
                
            <%-- </c:if> --%>
            </c:when>
            
            <c:otherwise>
            	<h2 class="text-center">게시글이 없습니다 내용을 추가해주세요</h2>
            <c:choose>
            <c:when test="${ses.email ne null && ses.email ne '' }">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="featured-btn-wrap">
                        <a href="/store/myregister" class="btn btn-danger"><span class="ti-plus"></span> New Store</a>
                    </div>
                </div>
            </div>
            </c:when>
            <c:otherwise>
            	<div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="featured-btn-wrap">
                        <a href="/store/myregister" class="btn btn-danger disabled"><span class="ti-plus"></span> New Store</a>
                    </div>
                </div>
            </div>
            </c:otherwise>
            </c:choose>
            </c:otherwise>
        </c:choose> 
            
            
        </div>
        </div>
        
        <c:if test="${pgn.totalCount > 0 && pgn.totalCount > 10}">
        
        <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="featured-btn-wrap">
                        <a href="/store/list?pageNo=${pgn.startPage }&qty=${pgn.pgvo.qty+9}&kw=${pgn.pgvo.kw}" class="btn btn-danger" id="view_all">VIEW ALL</a>
                    </div>
                </div>
            </div>
            </c:if>
    </section>
   

<!--// SLIDER -->

<!-- <script src="/resources/js/store.list.js"></script> 만들고나니 쓸 때가 없네  -->
<jsp:include page="../common/footer.jsp"/>