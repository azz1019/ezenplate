<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="common/header.jsp"/>
<jsp:include page="common/nav.jsp"/>

<!-- SLIDER -->
<section class="slider d-flex align-items-center">
    <!-- <img src="images/slider.jpg" class="img-fluid" alt="#"> -->
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-md-12">
                <div class="slider-title_box">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slider-content_wrap">
                                <h1>Discover great places in New york</h1>
                                <h5>Let's uncover the best places to eat, drink, and shop nearest to you.</h5>
                            </div>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-10">
                            <form class="form-wrap mt-4">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <input type="text" placeholder="What are your looking for?" class="btn-group1">
                                    <input type="text" placeholder="New york" class="btn-group2">
                                    <button type="submit" class="btn-form"><span class="icon-magnifier search-icon"></span>SEARCH<i class="pe-7s-angle-right"></i></button>
                                </div>
                            </form>
                            <div class="slider-link">
                                <a href="/">Browse Popular</a><span>or</span> <a href="/">Recently Added</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--// SLIDER -->

<jsp:include page="common/footer.jsp"/>