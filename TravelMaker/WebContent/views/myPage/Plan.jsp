<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, board.model.vo.*"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	ArrayList<Board> blist = (ArrayList<Board>) request.getAttribute("blist");
	ArrayList<Attachment> flist = (ArrayList<Attachment>) request.getAttribute("flist");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Information> in = (ArrayList<Information>)request.getAttribute("in");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

	String lname = (String) request.getAttribute("lname");
	String mname = (String) request.getAttribute("mname");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이페이지</title>
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/bootstrap.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style>
#mypage-menu li {
	
}

.page {
	cursor: pointer;
}

.no {
	user-select: none;
}
</style>

<!-- 메뉴바 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="external.css">
<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial;
}

/*nav part*/
nav {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100px;
	padding: 10px 90px;
	box-sizing: border-box;
	background: rgba(54, 51, 51, 0.5);
	z-index: 1;
}

nav .logo {
	padding: 22px 20px;
	height: 80px;
	float: left;
	font-size: 24px;
	font-weight: bold;
	text-transform: uppercase;
	color: #fff;
}

nav ul {
	list-style-type: none;
	float: right;
	padding: 0;
	margin: 0;
	display: flex;
	z-index: 1;
}

nav li {
	z-index: 1;
}

nav ul li a {
	line-height: 80px;
	color: #fff;
	padding: 12px 30px;
	text-decoration: none;
	text-transform: uppercase;
	font-size: 15px;
	font-weight: bold;
	z-index: 1;
}

nav ul li a:hover {
	background: rgba(0, 0, 0, 0.7);
	border-radius: 5px;
	text-decoration: none;
	color: #fff;
}

nav ul li a.active {
	background: #e2472f;
	color: #fff;
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
@media ( max-width :820px) {
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

/*time line*/
</style>


<!-- 영역 분할 -->
<style>
/* 몸체 */
#body {
	margin-top: 180px;
	width: 1500px;
	height: 1400px;
	display: flex;
	overflow: auto;
	flex-direction: row;
	margin-left: auto;
	margin-right: auto;
}

aside {
	margin-left:10%;
	width: 15%;
	height: 100%;
	margin-right: 5%;
}

#my-info-section1 {
	width: 80%;
	height: 220px;
	font-family: 'Do Hyeon', sans-serif;
}

/* aside -> my-info-section2 */
#my-info-section2 {
	width: 80%;
	height: 460px;
	font-family: 'Do Hyeon', sans-serif;
}

#section3 {
	width: 900px;
	height: 800px;
	position:absolute;
	margin-left:400px;
}

#section4 {
	width: 600px;
	height: 400px;
	position:absolute;
	margin-left:530px;
	margin-top:660px;
	font-family: 'Do Hyeon', sans-serif;
}
</style>

<!-- aside->section1 css -->
<style>
#my-info {
	width: 100%;
	height: 100%;
	background-color: cornflowerblue;
}

#my-info-text {
	text-align: center;
	color: white;
	margin-bottom: 40px;
}

#my-info-section1 img {
	margin-left: 35px;
	width: 80px;
	height: 80px;
	float: left;
}

#name {
	font-size: 24px;
	font-weight: bold;
}

.myinfo-button {
	border: 1px solid white;
	width: 50%;
	background-color: cornflowerblue;
	color: white;
	font-size: 13px;
	height: 40px;
}

#my-info-logout {
	float: left;
}

@media only screen and (max-width: 2000px) {
	#my-info-section1 {
		width: 220px;
	}
	#my-info-section2 {
		width: 220px;
	}
}
</style>

<!-- aside->section2 css -->
<style>
#my-info-section2 {
	margin-top: 50px;
}

aside {
	float: left;
}

#mypage-menu {
	border: 1px solid black;
	margin-top: 30px;
	width: 100%;
	height: 80%;
}

#mypage-menu ul {
	text-decoration: none;
	list-style-type: none;
	font-size: 18px;
}

#mypage-menu ul {
	margin: 0;
}

#mypage-menu ul li {
	margin-bottom: 15px;
}

.bigContent {
	font-size: 23px;
	font-weight: bold;
	margin-top: 13px;
	color: cornflowerblue;
}
</style>

<!-- 캘린더 -->
<style>
@import url(https://fonts.googleapis.com/css?family=Open+Sans:600);

@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css)
	;

.time {
	box-sizing: border-box;
	border-radius: 2px;
	border: 1px solid #999;
	cursor: pointer;
	outline: none;
	box-shadow: 3px 3px 0px #ddd;
}

.date {
	font-family: 'Open Sans', sans-serif;
	color: #111;
	max-width: 110px;
	min-height: 32px;
	text-align: center;
	font-size: 14px;
	color: #222;
	position: relative;
}

.time {
	min-width: 110px;
}

.date:focus {
	border-color: #333;
}

.date::-webkit-inner-spin-button, .date::-webkit-outer-spin-button,
	.date::-webkit-calendar-picker-indicator, .date::-webkit-clear-button {
	-webkit-appearance: none;
	display: none;
	margin: 0;
}

.date::-webkit-datetime-edit-text, .date::-webkit-datetime-edit-hour-field,
	.date::-webkit-datetime-edit-minute-field, .date::-webkit-datetime-edit-second-field,
	.date::-webkit-datetime-edit-ampm-field {
	color: #666;
}
</style>

<!-- board -->
<style>
#total {
}

#choice1 {
	float: left;
	width: 600px;
	height: 300px;
	border: 1px solid black;
	padding: 0;
	background: white;
	border-radius: 10px;
}

#ct {
	width: 380px;
}

#choice2 {
	position: fixed;
	margin-left: 600px;
	top: 220px;
	border-radius: 12px;
	border: 3px solid white;
	background-color: white;
	color: black;
	width: 17%;
	height: 520px;
	text-align: center;
	box-shadow: 5px 5px 5px 5px gray;
}

.btn-outline-info {
	width: 100px;
	height: 40px;
	margin: auto;
	font-size: 17px;
	border: none;
	color: black;
}

.btn-outline-info:hover {
	background-color: black;
	color: white;
}

.tag>h3 {
	color: white;
	margin: auto;
	margin-top: auto;
	text-align: center;
	margin: 6px 0px;
	height: 20px;
	font-size: 25px;
}

.info-btn {
	float: right;
	font-weight: 700;
	color: black;
	background-color: white;
	border-radius: 10px;
	margin: 6px 0px;
	height: 38px;
}

.in-wrap {
	width: 100%;
	height: 100%;
}

.thumb-pic {
	box-sizing: border-box;
	margin: auto;
	width: 30%;
	height: 100%;
}

.stage {
	box-sizing: border-box;
	width: 70%;
	height: 150px;
}

.stage>h2, p {
	color: black;
	vertical-align: top;
	text-align: center;
}

.stage>h2 {
	margin: auto;
}

.thumb-pic>img {
	box-sizing: border-box;
	width: 100%;
	height: 30%;
}

.wrap>a>* {
	padding: 16px 0 16px;
	float: left;
}

.count {
	width: 100%;
	margin-right: 20px;
}

.count p {
	width: 50%;
	float: left;
}

#good {
	float: right;
}

#festivalTable {
	width: 100%;
	height: 50px;
	margin-left: 20px;
	magin-right: 20px;
}

.month-choice {
	font-family: 'Do Hyeon', sans-serif;
	margin-top: 20px;
	margin-bottom: 50px;
}

#section4 ul {
	list-style-type: none;
	padding: 0;
}

#section4 li {
	margin-top: 3px;
}

$
section4 li button {
	width: 50px;
}

#section4 th {
	font-size: 25px;
	font-weight: 400;
}

#write {
	float: right;
	background: white;
}

#insertBtn {
	border: none;
	background-color: white;
}

#section4 button {
	font-family: 'Do Hyeon', sans-serif;
}

#section4 span, p, input {
	font-family: 'Do Hyeon', sans-serif;
}

.navbar .navbar-search .dropdown-menu {
	min-width: 25px;
}

.dropdown-menu .label-icon {
	margin-left: 5px;
}

.btn-outline {
	background-color: transparent;
	color: inherit;
	transition: all .5s;
}

#section4 .nav {
	margin: auto;
	ailgn: center;
	width: 600px;
	ailgn: center;
}

.form-control {
	border: 1px solid black;
}

.pagingArea {
	position:absolute;
	top:555px;
	left:36%;
	
}

.pagingArea button {
	background-color: white;
	width: 30px;
	height: 28px;
	margin: 0 1px;
	border: 1px solid #dbdbdb;
	color: #767676;
	font-size: 15px;
	font-weight: bold;
	text-decoration: none;
}

.pagingArea button:hover, .pagingArea button:active, .pagingArea button:focus
	{
	border: 1px solid #4c8500;
}

.no-drag {
	-ms-user-select: none; 
	-moz-user-select: -moz-none; 
	-webkit-user-select: none; 
	-khtml-user-select: none; 
	user-select:none;
}

#profile {
	cursor:pointer;
}
</style>

</head>

<body>
	<%@ include file="../common/menubar.jsp"%>
	<section id="body">
		<aside id="aside1">
			<section id="my-info-section1">
				<div class="my-info" id="my-info">
					<h3 id="my-info-text">마이페이지</h3>
					<img onclick="profileUpdate();" id="profile"
						src="<%= request.getContextPath() %>/resources/myplan_upload/<%= loginUser.getProfile() %>"><br>
					<p id="name"><%= loginUser.getmName() %></p>
					<br> <br>
					<button class="myinfo-button" id="my-info-logout"
						onclick="logout();">로그아웃</button>
					<button class="myinfo-button" id="my-info-modify"
						onclick="infoModify();">회원정보 수정</button>
				</div>
				<script>
					// 로그아웃 이동 
                	function logout() {
                		location.href="<%= request.getContextPath() %>/logout.me";
                	}
                	
					// 정보수정 이동 
                	function infoModify() {
                		location.href="<%= request.getContextPath() %>/views/myPage/Info-update.jsp"
                	}
            		
            		// 프로필 
            		function profileUpdate() {
            			var left = (screen.width/2)-135;
            	    	var top = (screen.height/2)-115;
            	   		var url = "<%= request.getContextPath() %>/views/myPage/ProfileUpdate.jsp";
            	    	var uploadWin = window.open(url,"Upload","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=270px, height=230px" + ",top=" + top + ",left=" + left);
            	    	uploadWin.moveTo(left, top);
            	    	uploadWin.focus();
            		}
                </script>
			</section>

			<section id="my-info-section2">
				<div id="mypage-menu">
					<ul>
						<li class="bigContent no">나의 활동</li>
						<li style="font-weight: bold" class="no"><a class="page" onclick="location.href='<%= contextPath %>/festivalMember.fe?=' + 2">
							나의계획</a></li>
						<li><a class="page"
							onclick="location.href='<%= contextPath %>/festivalall.fe?flag=4&no=1'">내가
								쓴 게시글</a></li>
						<hr>
						<li class="bigContent no">개인정보 관리</li>
						<li><a class="page"
							onclick="location.href='<%= request.getContextPath() %>/views/myPage/Info-update.jsp';">회원정보
								수정</a></li>
						<hr>
						<li class="bigContent no">고객센터</li>
						<li><a class="page"
							onclick="location.href='<%= request.getContextPath() %>/select.qa?mSeq=' + <%= loginUser.getM_seq()%>">문의
								내역</a></li>
					</ul>
				</div>
			</section>
		</aside>

		<section id="section3" class="margin-body">
			<%@ include file="./PlanCalendar.jsp"%>
			<form  action="<%= request.getContextPath() %>/dragDrop.pl" method="post" style="display:none;"  enctype="multipart/form-data" >
				<input name="addtitle" value="0">
				<input name="filename">
				<input name="startDate" value="0">
				<input name="url" value="0">
				<button class="drag-drop-form">btn</button>
			</form>
		</section>
		<section id="section4" class="margin-body">
			<h1 style="color: black; margin-top: 100px; margin-left: 40%; font-family: 'Black Han Sans', sans-serif;">게시글</h1>
			<br> <br>
			<div id="total">
				<div id="choice1" class="no-drag" style="height:400px">
					<div class="nav nav-justified navbar-nav no-drag">
						<form class="navbar-form navbar-search"
							action="<%=contextPath%>/search.fe" method="get">
						
						</form>
					</div>
					<br>
					<!-- 전체 글수 최신순 인기순 새로고침 -->
					<div class="count no-drag">
						<span style="text-align: left; margin-left: 20px;">전체 글 수 :
							<%=listCount%></span>

						<%
							if (loginUser != null) {
						%>
						<%
							}
						%>

					</div>
					<hr>
					<div id="festivalTable" class="no-drag"">
						<div class="thumbnailArea no-drag" style="width: 100px; height: 100px;">
							<%
								for (Board b : blist) {
							%>
							<div class="cli" style="height: 50px; width:580px; cursor:pointer; margin-bottom:15px;" draggable="true">
								<input type="hidden" value="<%=b.getbId()%>">
								<div class="board-img" style="float: left; width: 570px; box-sizing: border-box;">

									<%
										for (Attachment at : flist) {
									%>
									<%
										if (b.getbId() == at.getbId()) {
									%>
									<img
										src="<%=contextPath%>/resources/festival_uploadFile/<%=at.getChangeName()%>"
										width="40px" height="40px">
									<%
										}
									%>
									<%
										}
									%>
								</div>
								<div class="board-title"
									style="float: left; width: 350px; box-sizing: border-box;">
									<p class="board-title2" style="font-size: 25px; margin-top:-40px; margin-left:40px; width:500px;"><%=b.getbTitle()%></p>
									<hr style="width:600px; margin-left:-20px;">
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>
					
					<!-- 페이징 바 -->
					<div class="pagingArea">
						<!-- 맨 처음으로 (<<) -->
						<button
							onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=1&flag=2'">
							&lt;&lt;</button>

						<!-- 이전 페이지로 (<) -->
						<%
							if (currentPage == 1) {
						%>
						<button disabled>&lt;</button>
						<%
							} else {
						%>
						<button
							onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=<%=currentPage - 1%>&flag=2'">
							&lt;</button>
						<%
							}
						%>

						<!-- 10개의 페이지 목록 -->
						<%
							for (int p = startPage; p <= endPage; p++) {
						%>
						<%
							if (p == currentPage) {
						%>
						<button disabled style="background-color: black; color: white;">
							<%=p%>
						</button>
						<%
							} else {
						%>
						<button
							onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=<%=p%>&flag=2'"><%=p%></button>
						<%
							}
						%>
						<%
							}
						%>

						<!-- 다음 페이지로 (>) -->
						<%
							if (currentPage == maxPage) {
						%>
						<button disabled>&gt;</button>
						<%
							} else {
						%>
						<button
							onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=<%=currentPage + 1%>&flag=2'">
							&gt;</button>
						<%
							}
						%>

						<!-- 맨 끝으로 (>>) -->
						<button
							onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=<%=maxPage%>&flag=2'">
							&gt;&gt;</button>
					</div>
				</div>
			</div>
			
			<script>
				var bId;
        		$(function(){
        			$(".month-choice li").click(function(){
        				var month = $(this).children().eq(1).val();
        				location.href="<%=contextPath%>/month.fe?month=" + month;
        			});
        		});
        	
        		$(function(){
        			$(".location-choice li").click(function(){
        				var lId = $(this).children().eq(1).val();
        				location.href="<%=contextPath%>/location.fe?lId=" + lId;
        			});
        		});
        	
        		$(function(){
        			
        			$(".cli").mouseenter(function() {
        				bId =  $(this).children().eq(0).val();
        			});
        			
        			$(".cli").click(function(){
        				bId =  $(this).children().eq(0).val();
        				<%if (loginUser != null) {%>
        				location.href="<%=contextPath%>/detail.fe?bId=" + bId;
        				<%} else {%>
        				alert('상세보기는 로그인이 필요합니다');
        				location.href="<%= request.getContextPath() %>/views/join&login/login.jsp";
						<%}%>
				});
				});

				$(function() {

					$(".input-group-btn .dropdown-menu li a").click(
							function() {

								var selText = $(this).html();

								$(this).parents('.input-group-btn').find(
										'.btn-search').html(selText);

							});

				});
				
				
				<!-- drag & drop evnet -->
				$('.margin-body')
				  .on("dragstart", dragStart)
				  .on("dragover", dragOver)
				  .on("dragleave", dragLeave)
				  .on("drop", uploadContent);

				var $startEvent;
				var filename;
				var title;
				var arr;
				var startDate;
				var url;
				function dragStart(e) {
					$startEvent = $(e.target);
					filename = $startEvent.children('.board-img').find('img').attr("src");
					title = $startEvent.children('.board-title').find('.board-title2').html();
				}
				
				function dragOver(e){
				    e.stopPropagation();
				    e.preventDefault();
				    
				}
				
				function dragLeave(e) {
					e.stopPropagation();
				    e.preventDefault();
				   /*  $(e.target).css("background-color", "white"); */
				}

				function uploadContent(e) {
				    e.stopPropagation();
				    e.preventDefault();
				    dragOver(e);
				    startDate = $(e.target).attr('data-date');
				    
				    var date = $(e.target).attr('data-date');
				    arr = [{'title':title, 'imageurl':filename, 'start':startDate, 'end':startDate, 
				    	'url':<%if (loginUser != null) {%>
								"<%=contextPath%>/detail.fe?bId=" + bId
							  <%}%>}];
				    $('input[name=addtitle]').val(arr[0].title);
				    $('input[name=filename]').val(arr[0].imageurl);
				    $('input[name=startDate]').val(arr[0].start);
				    $('input[name=url]').val(arr[0].url);
				   	console.log("event : " + arr[0]);
				    calendar.addEvent(arr[0]);
				    
				    if(arr[0].title != null && arr[0].imageurl != null && arr[0].start != null && arr[0].url != null) {
				    	
				    	$('.drag-drop-form').trigger("click");
				    } 
				}
			</script>
		</section>
	</section>

	<%@ include file="../common/footer.jsp"%>
</body>

</html>