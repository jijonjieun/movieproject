<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.div-table{
	margin: 0 auto;
	display: table;
	width: 900px;
	height: auto;
}

.div-row{
	display: table-row;
	height: 30px;
	line-height: 30px;
}

.div-cell{
	display: table-cell;
	border-bottom: 1px solid gray;
	text-align: center;
}
.table-head{
	background-color: gray;
	font-weight: bold;
	text-align: center;
}
h1 {
text-align: center;
}

.poster {
    display: table-cell;
    border: 1px solid gray;
    text-align: center;
}

</style>
<script src="/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

/*
$(document).ready(function() {

$.ajax({
    url: '/admin/movieupload',
    type: 'GET',
    dataType: 'json',
    success: function (data) {
        // 서버로부터 받은 데이터를 사용하여 영화 목록을 생성하고 페이지에 표시
        displayMovieList(data);
    },
    error: function (error) {
        console.error('Failed to fetch movie data:', error);
    }
});

});

function displayMovieList(data) {
    // 데이터를 사용하여 게시판 형태의 목록 생성 및 출력
    var movieList = $('#movieList');
    movieList.empty(); // 기존 목록 초기화
    
    $.each(data, function (index, movie) {
        var listItem = $('<li></li>');
        listItem.html(movie.title + ' <button class="edit-button">수정</button> <button class="delete-button">삭제</button>');
        movieList.append(listItem);
        
        // 수정 및 삭제 버튼에 이벤트 리스너 추가
        listItem.find('.edit-button').click(function () {
            // 수정 로직 구현
        });
        
        listItem.find('.delete-button').click(function () {
            // 삭제 로직 구현
        });
    });
}


*/
</script>
</head>
<body>
<%@ include file="admenu.jsp"%>

	<div class="container">
		
		<div class="main">
			<div class="article">			
				<h1>영화목록관리</h1>
				<div class="div-table">
						<div class="div-row table-head">
							<div class="div-cell table-head">포스터</div>
							<div class="div-cell table-head">영화고유코드</div>
							<div class="div-cell table-head">제목</div>
							<div class="div-cell table-head">개봉일</div>
							<div class="div-cell table-head">제작사</div>
							<div class="div-cell table-head">개봉상태</div>
							<div class="div-cell table-head">누적관객순</div>
						
						</div>
						
					
						<div class="div-row"> 
					  
							<div class="poster">1</div>
							<div class="div-cell">2</div>
							<div class="div-cell">3</div>
							<div class="div-cell">4</div>
							<div class="div-cell">5</div>
							<div class="div-cell">6</div>
							<div class="au_acccnt">7</div>
					
						</div>
					
					</div>
				
				
			</div>
		</div>
</div>





</body>
</html>