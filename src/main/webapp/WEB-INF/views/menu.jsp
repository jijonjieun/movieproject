<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".sub_menu").hide();
	});	

</script>
<link rel="icon" href="./img/dream_favicon.ico" type="image/x-icon">
<nav>
	<div class="menu">
		<div class="menu_header">
			<div class="header_logo">
				<a href="./"><img alt="" src="./img/logo.png"></a>
			</div>
			<div class="header_warp">
				<div class="aside">
					<ul class="aside_list">
						<li onclick="link('login')"><span class="xi-lock-o icon"></span> <span class="text">로그인</span>
						</li>
						<li onclick="link('join')"><span class="xi-user-plus-o icon"></span>
							<span class="text">회원가입</span></li>
						<li onclick="link('mypage')"><span class="xi-profile-o icon"></span>
							<span class="text">MY DREAM</span></li>
						<li onclick="link('입력하시오')"><span class="xi-forum-o icon"></span>
							<span class="text">고객센터</span></li>
					</ul>
				</div>
			</div>
		</div>
		<hr>
		<div class="menu_nav">
			<div class="menu_map">
				<div class="xi-bars icon"></div>
				<div class="xi-search icon"></div>
			</div>
			<div class="menu_warp">
				<ul>
					<li onclick="link('movie')"><span class="text">영화</span>
						<div class="sub_menu">
							<ul>
								<li onclick="link('movie')">현재 상영작</li>
								<li onclick="link('movie')">상영 예정작</li>
							</ul>
						</div>
					</li>
					<li onclick="link('reservation')"><span class="text">예매</span>
						<div class="sub_menu">
							<ul>
								<li onclick="link('movie')">예매하기</li>
								<li onclick="link('movie')">상영 시간표</li>
							</ul>
						</div>
					</li>
					<li onclick="link('theater')"><span class="text">극장</span>
						<div class="sub_menu">
							<ul>
								<li onclick="link('movie')">드림 영화관</li>
								<li onclick="link('movie')">특별 영화관</li>
							</ul>
						</div>
					</li>
					<li onclick="link('event')"><span class="text">이벤트</span>
						<div class="sub_menu">
							<ul>
								<li onclick="link('movie')">SEPCIAL</li>
								<li onclick="link('movie')">시사회</li>
							</ul>
						</div>
					</li>
					<li onclick="link('benefit')"><span class="text">혜택</span>
						<div class="sub_menu">
							<ul>
								<li onclick="link('movie')">드림박스 멤버십</li>
								<li onclick="link('movie')">제휴/할인</li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>


	</div>

</nav>
<script>
	function link(url) {
		location.href = "./" + url;
	}
</script>