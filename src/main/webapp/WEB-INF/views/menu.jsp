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

	/* 서브 메뉴 */
	$(function(){
		$(".menu_wrap > li").mouseover(function(){
			$(this).find(".sub_menu").show();
			$(".menu_nav").css("height", "100px");
		});
		
		$(".menu_wrap > li").mouseout(function(){
			$(this).find(".sub_menu").hide();
		});
	})
	
	$(function(){
		$(".xi-search").click(function(){
			$.ajax({
	              url: "./menu",
	              type: "get",
	              dataType: "json",
	              success: function(data){
	            	  
	            	  for (let i = 0; i < data.mlist.length; i++) {
	            		  $(".m_mlist" + (i+1) ).text(data.mlist[i].mv_name);
	            	  }
	            	  
	            	  $(".m_mall > li").mouseover(function(){
	            		  for (let i = 0; i < data.mlist.length; i++) {
	            			  if(data.mlist[i].mv_name == $(this).text()) {
	            				  $(".m_mposter img").attr("src", data.mlist[i].mv_poster);
	            			  }
		            	  }
	            	  });
	            	  
	               
	              },
	              error: function(error){
	                  alert("Error");
	              }
	          });
		});
	});
</script>
<link rel="icon" href="./img/dream_favicon.ico" type="image/x-icon">
<nav>
	<div class="menu">
		<div class="menu_header">
			<div class="header_logo">
				<a href="./"><img alt="" src="./img/logo.png"></a>
			</div>
			<div class="header_wrap">
				<div class="aside">
					<ul class="aside_list">
					
						<c:choose>
							<c:when test="${sessionScope.id eq null}">
								<li onclick="link('login')">
									<span class="xi-lock-o icon"></span> 
									<span class="text">로그인</span>
								</li>
								<li onclick="link('join')">
									<span class="xi-user-plus-o icon"></span>
									<span class="text">회원가입</span>
								</li>
							</c:when>
							<c:otherwise>
								<c:if test="${sessionScope.status eq 0 }">
									<li onclick="link('admin/admin')">
										<span class="xi-cog icon"></span>
										<span class="text">관리자</span>
									</li>
								</c:if>
								<li onclick="logout()">
									<span class="xi-unlock-o icon"></span>
									<span class="text">로그아웃</span>
								</li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${sessionScope.id eq null}">
								<li onclick="login()">
									<span class="xi-profile-o icon"></span>
									<span class="text">MY DREAM</span>
								</li>
							</c:when>
							<c:otherwise>
								<li onclick="link('mypage')">
									<span class="xi-profile-o icon"></span>
									<span class="text">MY DREAM</span>
								</li>	
							</c:otherwise>
						</c:choose>
							<li onclick="link('입력하시오')">
								<span class="xi-forum-o icon"></span>
								<span class="text">고객센터</span>
							</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="menu_nav">
			<div class="menu_map">
				<div class="xi-bars icon" style="padding-right: 10px"></div>
				<div class="xi-search icon"></div>
			</div>
			<div class="menu_side">
				<ul class="menu_wrap">
					<li onclick="link('movie')" class="list"><span class="text">영화</span>
						<ul class="sub_menu">
							<li onclick="link('movie')">현재 상영작</li>
							<li onclick="link('movie')">상영 예정작</li>
						</ul>
					</li>
					<li onclick="link('reservation')" class="list"><span class="text">예매</span>
						<ul class="sub_menu">
							<li onclick="link('movie')">예매하기</li>
							<li onclick="link('movie')">상영 시간표</li>
						</ul>
					</li>
					<li onclick="link('theater')" class="list"><span class="text">극장</span>
						<ul class="sub_menu">
							<li onclick="link('movie')">드림 영화관</li>
							<li onclick="link('movie')">특별 영화관</li>
						</ul>
					</li>
					<li onclick="link('event')" class="list"><span class="text">이벤트</span>
						<ul class="sub_menu">
							<li onclick="link('movie')">SEPCIAL</li>
							<li onclick="link('movie')">시사회</li>
						</ul>
					</li>
					<li onclick="link('benefit')" class="list"><span class="text">혜택</span>
						<ul class="sub_menu">
							<li onclick="link('movie')">드림박스 멤버십</li>
							<li onclick="link('movie')">제휴/할인</li>
						</ul>
					</li>
				</ul>
			</div>
			
		</div>
		


	</div>

</nav>
<div id="m_mallbox">
	<div class="m_mrate">
		<h3>예매 순위</h3>
		<div class="m_mposter">
			<img src="">
		</div>
		<div class="m_mlist">
			<ul class="m_mall">
				<li class="m_mlist1"></li>
				<li class="m_mlist2"></li>
				<li class="m_mlist3"></li>
				<li class="m_mlist4"></li>
				<li class="m_mlist5"></li>
			</ul>
		
		</div>
	
	</div>
	
	<div class="m_msearch">
		<div class="mm_1">
			<img src="./img/logo_white.png">
		</div>
		<div class="mm_2">
			<form >
				<input placeholder="영화를 검색하세요"><span class="xi-search"></span>
			</form>
		</div>
		<div class="mm_3">
			<img src="./img/logo_slogan.png">
		</div>
	
	</div>
</div>


<script>
	function link(url) {
		location.href = "./" + url;
	}
	
	function login() {
		alert("로그인을 해주세요.");
		location.href="./login";
	}
	
	function logout() {
		if(confirm("로그아웃 하시겠습니까?")) {
			location.href="./logout";
		}
	}
</script>