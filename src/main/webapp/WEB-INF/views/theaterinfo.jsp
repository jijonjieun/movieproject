<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV::mypage</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="./css/theaterinfo.css" />
<script type="text/javascript">
	$(function() {
		$(".theater").show();
		$(".IMAXDetail").hide();
		$(".FDXDetail").hide();
		$(".TDXDetail").hide();
		$(".seatdetail").hide();

		$(".mhome").click(function() {
			$(".mhome").addClass("selected");
			$(".mimax").removeClass("selected");
			$(".mfdx").removeClass("selected");
			$(".mtdx1").removeClass("selected");
			$(".mseat").removeClass("selected");

			$(".theater").show();
			$(".IMAXDetail").hide();
			$(".FDXDetail").hide();
			$(".TDXDetail").hide();
			$(".seatdetail").hide();

		});

		$(".mimax").click(function() {
			$(".mhome").removeClass("selected");
			$(".mimax").addClass("selected");
			$(".mfdx").removeClass("selected");
			$(".mtdx1").removeClass("selected");
			$(".mseat").removeClass("selected");

			$(".theater").hide();
			$(".IMAXDetail").show();
			$(".FDXDetail").hide();
			$(".TDXDetail").hide();
			$(".seatdetail").hide();
		});

		$(".mfdx").click(function() {
			$(".mhome").removeClass("selected");
			$(".mimax").removeClass("selected");
			$(".mfdx").addClass("selected");
			$(".mtdx1").removeClass("selected");
			$(".mseat").removeClass("selected");

			$(".theater").hide();
			$(".IMAXDetail").hide();
			$(".FDXDetail").show();
			$(".TDXDetail").hide();
			$(".seatdetail").hide();
		});
		$(".mtdx1").click(function() {
			$(".mhome").removeClass("selected");
			$(".mimax").removeClass("selected");
			$(".mfdx").removeClass("selected");
			$(".mtdx1").addClass("selected");
			$(".mseat").removeClass("selected");

			$(".theater").hide();
			$(".IMAXDetail").hide();
			$(".FDXDetail").hide();
			$(".TDXDetail").show();
			$(".seatdetail").hide();
		});

		$(".mseat").click(function() {
			$(".mhome").removeClass("selected");
			$(".mimax").removeClass("selected");
			$(".mfdx").removeClass("selected");
			$(".mtdx1").removeClass("selected");
			$(".mseat").addClass("selected");

			$(".theater").hide();
			$(".IMAXDetail").hide();
			$(".FDXDetail").hide();
			$(".TDXDetail").hide();
			$(".seatdetail").show();
		});

	});
</script>

<script>
	$(function() {

		let currentIndex = 0;

		setInterval(function() { //3초에 한번씩 실행
			let nextIndex = (currentIndex + 1) % 3; // 1 2 0 1 2 무한반복

			$(".slider").eq(currentIndex).fadeOut(1200); //첫번째 이미지 사라짐
			$(".slider").eq(nextIndex).fadeIn(1200); //두번째 이미지 나타남

			currentIndex = nextIndex; //두번째 인덱값을 현재 인덱값에 저장
		}, 3000);

	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>

	<h1>THEATER INFO</h1>
	<div class="box">
		<div class="menubar">
			<div class="mhome">HOME</div>
			<div class="mimax">IMAX관</div>
			<div class="mfdx">4D관</div>
			<div class="mtdx1">2D(일반관)</div>
			<div class="mseat">좌석정보</div>
		</div>


		<div class="theater">
			<article id="slider">
				<div class="sliderWrap">
					<div class="slider s1">
						<img src="../img/dolby.png" alt="">
					</div>
					<div class="slider s2">
						<img src="../img/IMAX.png" alt="이미지 설명">
					</div>
					<div class="slider s3">
						<img src="../img/boutique.png" alt="이미지 설명">
					</div>
				</div>
			</article>
		</div>


		<div class="IMAXDetail">
			<div class="row">
				<div class="imaxin1"></div>

				<div class="imaxin2"></div>
			</div>
			<div class="row">
				<div class="imaxin3"></div>

				<div class="imaxin4"></div>
			</div>
		</div>


		<div class="FDXDetail">
			
			<div class="fdxdetail2">
				<div class="fdx-center">
					<img src="../img/FDX1.png"> <img src="../img/FDX2.png">
				</div>
			</div>
			<div>
				<div class="fdxdetail1"></div>
			</div>
		</div>


		<div class="TDXDetail">
			<div>
				<div class="tdxdetail1"></div>
			</div>
			<div class="tdxdetail2">
				<div class="tdx-center">
					<img src="../img/TDX2.png"> <img src="../img/TDX3.png">
					<img src="../img/TDX4.png">
				</div>
			</div>
		</div>



		<div class="seatdetail">
			<div class="seat-center">
				<div class="seat-item">
					<img src="../img/seat1.jpg">
					<div class="description">
						2DX(1관)<br>좌석 수 : 88석 <br>가격<br>성인 : 14,000원<br>청소년
						: 11,000원 <br> 우대 : 8,000원
					</div>
				</div>
				<div class="seat-item">
					<img src="../img/seat2.jpg">
					<div class="description">
						2DX(2관)<br>좌석 수 : 108석 <br>가격<br>성인 : 14,000원<br>청소년
						: 11,000원 <br> 우대 : 8,000원
					</div>
				</div>
				<div class="seat-item">
					<img src="../img/seat3.jpg">
					<div class="description">
						4DX<br>좌석 수 : 142석 <br>가격<br>성인 : 20,000원<br>청소년
						: 15,000원 <br> 우대 : 12,000원
					</div>
				</div>
				<div class="seat-item">
					<img src="../img/seat4.jpg">
					<div class="description">
						IMAX<br>좌석 수 : 154석 <br>가격<br>성인 : 22,000원<br>청소년
						: 17,000원 <br> 우대 : 14,000원
					</div>
				</div>
			</div>
		</div>


	</div>


















</body>
</html>


