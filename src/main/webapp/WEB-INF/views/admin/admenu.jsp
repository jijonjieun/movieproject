<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin/adminmenu.css">

<body>

<div class="continer">
	<div class="header">
		
		<div class="menu">
			<!-- <div class="logo">logo</div> -->
			<div class="hi">관리자<br>${sessionScope.mid}님</div>
			<div class="hi">--------------------</div>
			<div class="menu-item" onclick="url('member')"><i class="xi-home xi-2x"></i> 홈</div>
			<div class="menu-item" onclick="url('member')"><i class="xi-users xi-2x"></i> 회원 관리</div>
			<div class="menu-item" onclick="url('movieupload')"><i class="xi-movie xi-2x"></i> 영화 관리</div>
			<div class="menu-item" onclick="url('')"><i class="xi-coupon xi-2x"></i> 예매현황</div>
			<div class="menu-item" onclick="url('')"><i class="xi-calendar-check xi-2x"></i> 상영 스케줄 관리</div>
			<c:if test="true"><div class="menu-item" onclick="url('logout')"><i class="xi-flag  xi-2x"></i>로그아웃</div></c:if>
		</div>
<script>function url(link){location.href='./'+link;}</script>
</div>
</div>



</body>
</html>

