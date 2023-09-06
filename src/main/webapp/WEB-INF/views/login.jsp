<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/login.css">
<meta charset="UTF-8">
<title>CGV::login</title>
<script src="./js/jquery-3.7.0.min.js"></script>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	<div class="signin_wrap">
		<form action="/login" method="post" id="signInForm">
				<a href="/"> <img class="logo" src="/img/movielogin.png"
					alt="logo" height="100">
				</a>
			<div class="form-floating">
				<input type="text" class="form-control" placeholder="ID"
					name="username" maxlength="41"> <label for="id">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" placeholder="Password"
					name="password" maxlength="16"> <label for="pwd">비밀번호</label>
			</div>
			<div class="error_message text-start float-start" id="idErrorMsg"
				style="display: none;">아이디를 입력해주세요.</div>
			<div class="error_message text-start float-start" id="pwErrorMsg"
				style="display: none;">비밀번호를 입력해주세요.</div>
			<div class="btn-area pt-3">
				<button class="btn-lg col-7" type="submit">
					<span class="btn_text">LOGIN</span>
				</button>
							<div class="sns_wrap pt-2 col-8">
		
					<a href="/sign-in/kakao"> <img src="/img/kakao_login_small.png"
						alt="카카오 로그인" height="50">
					</a>

					<a href="/sign-in/naver"> <img src="/img/naver_login_small.png"
						alt="네이버 로그인" height="50">
					</a>

			</div>
			</div>
		</form>
		<div class="find">
			<ul class="find_wrap py-3">
				<li><a href="/sign-in/find-id" class="find_text">아이디 찾기</a></li>
				<li><a href="/sign-in/find-pw" class="find_text">비밀번호 찾기</a></li>
				<li><a href="/join" class="find_text">회원가입</a></li>
			</ul>

		</div>
		</div>
</body>
</html>