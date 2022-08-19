<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ezenplate</title>
<!-- 기본 부트스트랩 -->
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/bootstrap/js/bootstrap.bundle.min.js" ></script> -->

<!-- 폰트 네비(한글) font-family: 'Jua', sans-serif;-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- 폰트 네비(한글) font-family: 'SCoreDream';  -->
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<!-- 폰트 네비(한글) font-family: 'AritaDotum'; -->
<link href="https://webfontworld.github.io/amore/AritaDotum.css" rel="stylesheet">

<!-- 영어폰트(네비)  font-family: 'Fjalla One', sans-serif;-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fjalla+One&display=swap" rel="stylesheet">

<!-- 테마 부트스트랩, js -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resources/dist/css/bootstrap.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
<!-- Simple line Icon -->
<link rel="stylesheet" href="/resources/dist/css/simple-line-icons.css">
<!-- Themify Icon -->
<link rel="stylesheet" href="/resources/dist/css/themify-icons.css">
<!-- Hover Effects -->
<link rel="stylesheet" href="/resources/dist/css/set1.css">
<!-- Main CSS -->
<link rel="stylesheet" href="/resources/dist/css/style.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/0f4d545e13.js" crossorigin="anonymous"></script>

<!-- 맛집 검색 -->
<!-- Swipper Slider -->
    <link rel="stylesheet" href="/resources/dist/css/swiper.min.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="/resources/dist/css/magnific-popup.css">
<!-- 맛집 디테일-->
<!-- jQuery, Bootstrap JS. -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/resources/dist/js/jquery-3.2.1.min.js"></script>
<script src="/resources/dist/js/popper.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/dist/js/bootstrap.min.js"></script>

<!-- 부트스트랩 select -->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap-select.min.css">
<script src="/resources/bootstrap/js/bootstrap-select.min.js"></script>
<script src="/resources/bootstrap/js/defaults-ko_KR.min.js"></script>

<!-- <script src="/resources/mylist/js/common.style.js"></script> -->
<!-- <link rel="stylesheet" href="/resources/mylist/css/common.style.css"> -->
<script>
    $(window).scroll(function() {
        // 100 = The point you would like to fade the nav in.
        if ($(window).scrollTop() > 100) {
            $('.fixed').addClass('is-sticky');
        } else {
            $('.fixed').removeClass('is-sticky');
        };
    });
</script>
</head>
<body>
