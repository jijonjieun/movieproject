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
<script>
function register(){
	var registerData =common.serializeObject($("form[name=userRegisterForm]"));
	
	$.ajax({
		type : 'POST',
		url : '/login/naver/register',
		data : registerData,
		dataType : 'json',
		success : function(data){
			if(data.JavaData == "YES"){
				alert("가입되었습니다.");
				location.href = '/'
			}else{
				alert("가입에 실패했습니다.");
			}
		},
		error: function(xhr, status, error){
			alert("가입에 실패했습니다."+error);
		}
	});
}
</script>
</head>
<%@ include file="menu.jsp"%>
<body>

	<div class="login_box">
		<a href="/"> <img class="logo" src="/img/movielogin.png"
			alt="logo" height="100">
		</a>
		<form name="userRegisterForm" id="userRegisterForm" method="POST">
	<input type="hidden"  id="id" name="id"  value="${id}">
	<input type="hidden"  id="name" name="name"  value="${name}">

			<b>이메일</b>
			<div class="input_aera">
				<input type="text" name="email" class="email form-control"
					placeholder="이메일을 입력해 주세요"> <span class="msg_box">${errorMsg.email}</span>
			</div>
		
			<b>닉네임</b>
			<div class="input_aera">
				<input type="text" class="nickName form-control" name="nickName"
					maxlength="20" placeholder="사용하실 닉네임을 입력해 주세요"> <span
					class="msg_box">${errorMsg.nickName}</span>
			</div>

			<input type="submit" value="회원가입" class="btn btn-danger login_btn">
		</form>
</div>
	<script type="text/javascript" src="/js/common/util.js"></script>
	<script type="text/javascript" src="/js/member/join.js"></script>
</body>