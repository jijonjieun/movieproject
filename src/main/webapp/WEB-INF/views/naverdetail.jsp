<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV::join</title>
<link rel="stylesheet" href="./css/join.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<%@ include file="menu.jsp"%>
<body>

	<div class="login_box">
		<a href="/"> <img class="logo" src="/img/movielogin.png"
			alt="logo" height="100">
		</a>
		<form action="/userRegisterForm" id="userRegisterForm" method="POST">
	<input type="hidden"  id="id" name="id"  value="${id}">
	<input type="hidden"  id="name" name="name"  value="${name}">
	

			<b>이메일</b>
			<div class="input_aera">
				<input type="text" name="email" class="email form-control"
					placeholder="이메일을 입력해 주세요">
					</div>
		
			<b>닉네임</b>
			<div class="input_aera">
				<input type="text" class="nickName form-control" name="nickName"
					maxlength="20" placeholder="사용하실 닉네임을 입력해 주세요">
				
			</div>

			<input type="submit" value="회원가입" class="btn btn-danger login_btn">
		</form>
</div>

</body>