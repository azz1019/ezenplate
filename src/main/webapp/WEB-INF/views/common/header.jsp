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

<!-- jQuery, Bootstrap JS. -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/resources/dist/js/jquery-3.2.1.min.js"></script>
<script src="/resources/dist/js/popper.min.js"></script>
<script src="/resources/dist/js/bootstrap.min.js"></script>

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