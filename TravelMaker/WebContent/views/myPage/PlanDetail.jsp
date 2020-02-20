<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="member.model.vo.Member" %>
<%@page import="member.model.vo.MyPlan" %>
<%@page import="java.util.ArrayList" %>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	ArrayList<MyPlan> planList = (ArrayList)request.getSession().getAttribute("planList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
<title>Document</title>
<style>
.background, .container {
	width: 100%;
	position: absolute;
	top: 0;
}

.container-scroll {
	position: absolute;
	left: 1px;
	width: 100%;
	height: 426px;
}

.card-plan {
	width: 200px;
	height: 100px;
	float: left;
	margin-top: 5%;
	margin-left: 37%;
}

h2 {
	margin-top: 60px;
	margin-left: 50%;
}

.week {
	width: 100%;
	position: absolute;
	top: 180px;
	left: 50%;
	transform: translateX(-50%);
	border: 1px solid #ECECEC;
}

.week-space {
	height: 526px;
}

.week-day {
	padding: 6px 12px;
	border-bottom: 1px solid #ECECEC;
	position: relative;
}

.week-day:nth-child(odd) {
	background-color: white;
}

.week-day:nth-child(even) {
	background-color: #F8F8F8;
}

.week-day:last-child {
	border-bottom: none;
}

.week-day--hover:nth-child(odd), .week-day--hover:nth-child(even) {
	background-color: #F2F2F2;
}

.week-day--hover .week-day-name {
	color: #666666;
}

.week-day--active:before {
	content: '';
	background-color: #ececec;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 0;
	animation-name: active;
	animation-duration: 500ms;
	animation-timing-function: ease-in-out;
	animation-fill-mode: forwards;
}

@
keyframes active { 0% {
	opacity: 0;
}

30%
{
opacity: 1;
}
100%
{
opacity: 0;
}
}
.week-day p {
	user-select: none;
}

.week-day-name {
	color: #999999;
	font-family: sans-serif;
	font-size: 12px;
	font-weight: bold;
	margin-right: 30px;
	position: relative;
	z-index: 1;
	pointer-events: none;
}

.week-day-task {
	width: 550px;
	padding: 0px 12px;
	position: absolute;
	top: 50%;
	right: 6px;
	transform: translateY(-50%);
	cursor: pointer;
	display: flex;
	justify-content: space-between;
	border-color: #DADADA;
	background-color: white;
	box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.07);
	font-size: 12px;
	font-family: sans-serif;
	z-index: 2;
}

.week-day-task-difficulty, .week-day-task-duration {
	
}

.week-day-task-difficulty {
	color: #4F9E00;
}

.week-day-task-difficulty--hard {
	color: #F26522;
}

.week-day-task-duration {
	color: #666666;
}

.holder {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.invisible {
	display: none;
}

.held {
	z-index: 3;
}

.held .week-day-task {
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
}

@media screen and (max-width: 414px) {
	.background, .container, .container-scroll, .card-plan {
		width: 100%;
	}
	.container-scroll {
		top: 28.98vw;
		left: 0;
		height: 103.14vw;
	}
	.card-plan {
		top: 1.45vw;
	}
	.week {
		top: 31.64vw;
		width: 90%;
	}
	.week-space {
		height: calc(358px + 40vw);
	}
	.week-day-task {
		width: calc(100% - 120px);
	}
	.box {
		width: 400px;
	}
	.plan-content {
		width: 100%;
	}
	
	input[type=text] {
		border: none; 
		border-right: 0px; 
		border-top: 0px; 
		boder-left: 0px; 
		boder-bottom: 0px;
	}
}
</style>
<script>
        (function($) {
  function collision($div) {
    var x1 = event.pageX;
    var y1 = event.pageY;
    var h1 = 0;
    var w1 = 0;
    var b1 = y1 + h1;
    var r1 = x1 + w1;
    var x2 = $div.offset().left;
    var y2 = $div.offset().top;
    var h2 = $div.outerHeight(true);
    var w2 = $div.outerWidth(true);
    var b2 = y2 + h2;
    var r2 = x2 + w2;

    if (b1 < y2 || y1 > b2 || r1 < x2 || x1 > r2) return false;
    return true;
  }
}); // Fully reference jQuery after this point.

    </script>
</head>
<body>
	<form  method="post" action="<%=request.getContextPath()%>/insert.pl" enctype="multipart/form-data">
		<div class="container">
			<div class="container-scroll">
				<div id="titleImgArea">
					<img class="card-plan" name="plan-img" id="plan-img" width="100px"
						height="100px;">
				</div>
				<div class="week">
					<div class="week-day">
						<p class="week-day-name">계획</p>
						<div class="holder">
							<div class="week-day-task">
								<input type="text" name="plan-name" class="plan-name"
									style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px; width: 100%; height: 100%;">
							</div>
						</div>
					</div>
					<div class="week-day">
						<p class="week-day-name">시작/종료 일자</p>
						<div class="holder">
							<div class="box">
								<div class="week-day-task">
									<p class="week-day-task-difficulty">
										시작 : <input type="date" name="plan-start-date">
									</p>
									<p class="week-day-task-difficulty">
										종료 : <input type="date" name="plan-end-date">
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="week-day">
						<p class="week-day-name">시작/종료 시간</p>
						<div class="holder">
							<div class="box">
								<div class="week-day-task">
									<p class="week-day-task-difficulty">
										시작 : <input type="time" name="plan-start-time" min="00:00" max="24:00">
									</p>
									<p class="week-day-task-difficulty">
										종료 : <input type="time" name="plan-end-time" min="00:00" max="24:00">
									</p>
								</div>
							</div>
						</div>
					</div>
					<button class="btn btn-success"
						style="margin-left: 45%"
						onclick="location.href='<%=request.getContextPath()%>'">취소</button>
					<button class="btn btn-success">추가</button>
				</div>
				<div class="week-space"></div>
			</div>
		</div>
		<div id="fileArea">
			<input type="file" id="thumbnailImg1" name="thumbnailImg1"
				onchange="LoadImg(this,1)" style="display:none">
		</div>
		<script>
		$(function() {
			$("#titleImgArea").click(function() {
				$("#thumbnailImg1").click();
			});
			var date = new Date();
			var hour = date.getHours();
			
			$('input[name=plan-start-date]').val(new Date().toISOString().substring(0,10));
			$('input[name=plan-end-date]').val(new Date().toISOString().substring(0,10));
			$('input[name=plan-start-time]').val(hour + ":00");
			$('input[name=plan-end-time]').val((hour + 1) + ":00");
		});
		
		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {

					switch (num) {
					case 1:
						// e.target.result -> data:URL (파일의 컨텐츠)
						$("#plan-img").attr("src", e.target.result);
						console.log(e.target.result);
						break;
					};
				}
				// 파일 내용을 읽어들여 dataURL 형식의 문자열로 설정
				reader.readAsDataURL(value.files[0]);
			}
		}
		</script>
	</form>
	<script src="https://hammerjs.github.io/dist/hammer.min.js"></script>

</body>
</html>