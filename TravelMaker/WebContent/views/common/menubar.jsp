<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 -->    <link rel="stylesheet" type="text/css" href="external.css">
<style>

/*nav part*/
nav {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100px;
	padding: 10px 90px;
	box-sizing: border-box;
	background: white;
	z-index: 20;
	border-bottom:2px solid gray;
}

nav .logo {
	padding: 22px 20px;
	height: 80px;
	float: left;
	font-size: 24px;
	font-weight: bold;
	text-transform: uppercase;
	color: black;
}

nav ul {
	list-style-type: none;
	float: right;
	padding: 0;
	margin: 0;
	display: flex;
	z-index: 20;
}

nav li {
	z-index: 20;
}

nav ul li a {
	line-height: 80px;
	color: black;
	padding: 12px 30px;
	text-decoration: none;
	text-transform: uppercase;
	font-size: 15px;
	font-weight: bold;
	z-index: 20;
}

nav ul li a:hover {
	background: rgba(0, 0, 0, 0.7);
	border-radius: 5px;
	text-decoration: none;
	color: white;
}

nav ul li a.active {
	background: #e2472f;
	color: black;
	border-radius: 6px;
}

#guestBook {
	background: url("images/s3bg1.jpg");
	position: relative;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
}

/* section2 timeline*/
/*responsive web part*/
@media ( max-width :1130px) {
	.menuToggle {
		position: absolute;
		width: 40px;
		height: 40px;
		display: block;
		float: right;
		top: 25px;
		right: 35px;
		text-align: center;
		font-size: 35px;
		cursor: pointer;
	}
	.menuToggle:before {
		line-height: 40px;
		content: '\f0c9';
		font-family: fontAwesome;
		color: white;
	}
	.menuToggle.active:before {
		line-height: 40px;
		content: '\f00d';
		font-family: fontAwesome;
		color: white;
	}
	.menuToggle:before {
		line-height: 40px;
		content: '\f0c9';
		font-family: fontAwesome;
		color: white;
	}
	#navUl {
		display: none;
	}
	#navUl.active {
		display: block;
		width: 100%;
		background: rgba(54, 51, 51, 0.5);
		margin-top: 10px;
	}
	#navUl.active li {
		text-align: center;
	}
	#navUl.active li a {
		display: block;
	}
	nav {
		padding: 10px 30px;
	}
}
</style>
</head>
<body>
	<header>
		<div id="wrap">
			<nav>
				<div class="logo" onclick="location.href='<%= contextPath %>'" style="cursor:pointer;">Travel Maker</div>
				<div class="menuToggle"></div>
				<ul id="navUl">
					<li><a id="a0" class="active" href="<%= contextPath %>">Home</a></li>
					<li><a id="a1" href="#" onclick="goFes();">축제</a></li>
					<li><a id="a2" href="#guestBook" onclick="goTrip();">여행</a></li>
					<li><a id="a3" href="#"onclick="goSleep();">숙박</a></li>
					<li><a id="a3" href="#gallery" onclick="goCom();">커뮤니티</a></li>
					<% if(loginUser != null) { %>
						<% if(loginUser.getmId().equals("admin")) { %>
							<li><a id="a4" href="#" onclick="goManager();">관리자페이지</a></li>
						<% } else {%>
							<li><a id="a4" href="#" onclick="goMyPage();">마이페이지</a></li>
						<% } %>
					<% }else { %>
						<li><a id="a4" href="#login" onclick="goLogin();">LOGIN</a></li>
					<% } %>
				</ul>
			</nav>
		</div>
	</header>
	<!--한 화면 단위로 스크롤 이동-->

	<!--responsive nav bar-->
	<script>
		$(document).ready(function() {
			$(".menuToggle").click(function() {
				$(this).toggleClass('active');

				$("#navUl").toggleClass('active');
				if ($(this).hasClass('active')) {
					$("#skill-wrapper").hide()
					$(".html").animate({
						"width" : "0"
					}, 'slow')
					$(".js").animate({
						"width" : "0"
					}, 'slow')
					$(".java").animate({
						"width" : "0"
					}, 'slow')
					$(".C").animate({
						"width" : "0"
					}, 'slow')
					$(".android").animate({
						"width" : "0"
					}, 'slow')
				} else {
					$("#skill-wrapper").show();
					$(".html").animate({
						"width" : "80%"
					}, 'slow')
					$(".js").animate({
						"width" : "70%"
					}, 'slow')
					$(".java").animate({
						"width" : "80%"
					}, 'slow')
					$(".C").animate({
						"width" : "40%"
					}, 'slow')
					$(".android").animate({
						"width" : "80%"
					}, 'slow')

				}
			})
		});
	</script>

	<script type="text/javascript">
		window.onload = function() {
			var elm = ".screen";
			$(elm).each(function(index) {
				// 개별적으로 Wheel 이벤트 적용
				$(this).on("mousewheel DOMMouseScroll", function(e) {
					e.preventDefault();
					var delta = 0;
					if (!event)
						event = window.event;
					if (event.wheelDelta) {
						delta = event.wheelDelta / 120;
						if (window.opera)
							delta = -delta;
					} else if (event.detail)
						delta = -event.detail / 3;
					var moveTop = $(window).scrollTop();
					var elmSelecter = $(elm).eq(index);
					console.log(index);
					// 마우스휠을 위에서 아래로
					if (delta < 0) {
						if ($(elmSelecter).next() != undefined) {
							try {
								moveTop = $(elmSelecter).next().offset().top;

							} catch (e) {
							}
						}
						// 마우스휠을 아래에서 위로
					} else {
						if ($(elmSelecter).prev() != undefined) {
							try {
								moveTop = $(elmSelecter).prev().offset().top;
							} catch (e) {
							}
						}
					}
					if (moveTop >= 667 && moveTop < 1300) {
						$(".html").animate({
							"width" : "80%"
						}, 'slow')
						$(".js").animate({
							"width" : "70%"
						}, 'slow')
						$(".java").animate({
							"width" : "80%"
						}, 'slow')
						$(".C").animate({
							"width" : "40%"
						}, 'slow')
						$(".android").animate({
							"width" : "80%"
						}, 'slow')
					} else {
						$(".html").animate({
							"width" : "0"
						}, 'slow')
						$(".js").animate({
							"width" : "0"
						}, 'slow')
						$(".java").animate({
							"width" : "0"
						}, 'slow')
						$(".C").animate({
							"width" : "0"
						}, 'slow')
						$(".android").animate({
							"width" : "0"
						}, 'slow')
					}
					// 화면 이동 0.8초(800)
					$("html,body").stop().animate({
						scrollTop : moveTop + 'px'
					}, {
						duration : 800,
						complete : function() {

						}
					});
				});
			});
		}
		
		<%-- function goBest(){
			location.href="<%= contextPath %>/best.th";
		}
		
		
		
		
		--%>
		function goSleep(){

	         location.href="<%= contextPath %>/list.sl";
	      }
	      function goCom(){
				location.href="<%= contextPath %>/festivalall.fe?flag=" + 4;
			} 
			function goMyPage() {
				location.href="<%= contextPath %>/festivalMember.fe?=" + 2;
			}
	      
	      function goManager() {
	         location.href="<%= contextPath %>/select.mo";
	      }
	      
	      function goLogin() {
	         location.href="<%= contextPath %>/views/join&login/login.jsp";
	      }
	      function goFes(){
	         location.href="<%= contextPath %>/festivalall.fe?flag=" + 2;
	      }
	      function goTrip(){
	         location.href="<%= contextPath %>/festivalall.fe?flag=" + 1;
	      }

	</script>


	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>