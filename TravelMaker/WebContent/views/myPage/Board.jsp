<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, board.model.vo.*"%>

<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

	ArrayList<Board> blist = (ArrayList<Board>) request.getAttribute("blist");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이페이지</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="js/bootstrap.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

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
body {
	width: 1500px;
	height: 1000px;
	margin-top: 180px;
	margin-left: auto;
	margin-right: auto;
}

#body {
	margin-top: 4%;
	display: flex;
	flex-direction: row;
}

aside {
	margin-left: 10%;
	width: 15%;
	height: 100%;
	margin-right: 5%;
}

#marginBody {
	width: 65%;
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

#my-info-section3 {
	width: 63%;
	float: left;
	margin-left: 2%;
	font-family: 'Do Hyeon', sans-serif;
}

ul a {
	color: black;
}

ul a {
	color: black;
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
	padding-left: 20%;
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

<!-- section3 -->
<style>
#total {
	width: 800px;
	height: 700px;
	background: white;
	box-shadow: 10px 5px 15px 5px gray;
	border-radius: 10px;
	margin: auto;
}

#top {
	width: 100%;
	height: 18%;
	border-bottom: 1px solid rgba(31, 10, 10, 0.162);
}

#bottom {
	width: 100%;
	height: 80%;
	border-radius: 10px;
}

.count {
	width: 100%;
	height: 40%;
	margin-right: 20px;
}

.count p {
	width: 50%;
	float: left;
}

#good {
	float: right;
}

#communityTable {
	width: 100%;
	height: 90%;
}

#write {
	width: 100%;
	height: 40%;
}

#insertBtn {
	border: none;
	background-color: ghostwhite;
	width: 40px;
	height: 40px;
	float: right;
	margin-right: 15px;
}

button {
	font-family: 'Do Hyeon', sans-serif;
}

span, p, input {
	font-family: 'Do Hyeon', sans-serif;
}

.navbar-search {
	width: 60%;
	height: 100%;
	margin: auto;
}

.btn-outline {
	background-color: transparent;
	color: inherit;
	transition: all .5s;
}

.nav {
	ailgn: center;
	width: 100%;
	height: 20%;
	ailgn: center;
}

.form-control {
	
}

#table {
	width: 100%;
	text-align: center;
}

th {
	border-top: 1px solid rgba(31, 10, 10, 0.162);
	border-bottom: 1px solid rgba(31, 10, 10, 0.162);
}

.page {
	cursor:pointer;
}
</style>
</head>

<body>
	<%@ include file="../common/menubar.jsp"%>
	<section id="body">
		<aside>
			<section id="my-info-section1">
				<div class="my-info" id="my-info">
					<h3 id="my-info-text">마이페이지</h3>
					<img onclick="profileUpdate();" id="profile"
						src="<%=request.getContextPath()%>/resources/myplan_upload/<%=loginUser.getProfile()%>"><br>
					<p id="name">
						&nbsp;&nbsp;&nbsp;<%=loginUser.getmName()%></p>
					<br> <br>
					<button class="myinfo-button" id="my-info-logout"
						onclick="logout();">로그아웃</button>
					<button class="myinfo-button" id="my-info-modify"
						onclick="infoModify();">회원정보 수정</button>
				</div>
				<script>
                	function logout() {
            			location.href="<%=request.getContextPath()%>/logout.me";
            		}
            	
            		function infoModify() {
            			location.href="<%=request.getContextPath()%>/views/myPage/Info-update.jsp"
            		}
            		
            		// 프로필 
            		function profileUpdate() {
            			var left = (screen.width/2)-135;
            	    	var top = (screen.height/2)-115;
            	   		var url = "<%=request.getContextPath()%>/views/myPage/ProfileUpdate.jsp";
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
						<li class="no"><a class="page" onclick="location.href='<%= contextPath %>/festivalMember.fe?=' + 2">
							나의계획</a></li>
						<li style="font-weight: bold"><a class="page"
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

		<section id="section3">
			<div id="total">
				<div id="top">
					<div class="nav nav-justified navbar-nav">
						<form class="navbar-form navbar-search"
							action="<%=contextPath%>/search.fe" method="get">
							<input type="hidden" name="flag" value="4">
							<div class="input-group" style="margin-top: 20px;">
								<input type="search" name="search" class="form-control"
									placeholder="검색어 입력">

								<div class="input-group-btn">
									<button type="submit" class="btn btn-search btn-default"
										style="border: 1px solid black;">검색</button>


								</div>
							</div>
						</form>
					</div>
					<script>
				function checkSearchCondition(){
					if($("#searchCondition option:selected").val() == '----'){
						alert("검색할 분야 선택");
						return false;
					}
					return true;
				}
			</script>

					<br>
					<br>

					<!-- 전체 글수 최신순 인기순 새로고침 -->
					<div class="count">
						<span style="text-align: left; margin-left: 20px;">전체 글 수 :
							<%=listCount%></span>
						<div id="good"></div>

					</div>
					<%
						if (loginUser != null) {
					%>
					
					<%
						}
					%>
				</div>
				<div id="bottom">
					<div id="communityTable">
						<br>
						<table id="table">
							<tr height="50px" style="background: rgba(31, 10, 10, 0.162)">
								<th width="8%">번호</th>
								<th width="50%">제목</th>
								<th width="10%">작성자</th>
								<th width="10%">작성일</th>
								<th colspan="2" width="13%">추천/비추천</th>
								<th width="9%">조회수</th>
							</tr>
							<%
								if (blist != null) {
							%>
							<%
								for (Board b : blist) {
							%>
							<%
								if(b.getmId() == loginUser.getM_seq()) {
							%>
							<tr class="bth">
								<th><%=b.getbId()%></th>
								<th><%=b.getbTitle()%></th>
								<th><%=b.getbWriter()%></th>
								<th><%=b.getwDate()%></th>
								<th><%=b.getGood()%></th>
								<th><%=b.getNgood()%></th>
								<th><%=b.getbCount()%></th>
							</tr>
							<%
								}
							%>
							<%
								}
							%>
							<%
								}
							%>
						</table>
					</div>

					<!-- 페이징 바 -->
					<div class="pagingArea" align="center">
						<!-- 맨 처음으로 (<<) -->
						<button
							onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=1&flag=4'">
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
							onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=<%=currentPage - 1%>&flag=4'">
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
						<button disabled>
							<%=p%>
						</button>
						<%
							} else {
						%>
						<button
							onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=<%=p%>&flag=4'"><%=p%></button>
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
							onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=<%=currentPage + 1%>&flag=4'">
							&gt;</button>
						<%
							}
						%>

						<!-- 맨 끝으로 (>>) -->
						<button
							onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=<%=maxPage%>&flag=4'">
							&gt;&gt;</button>
					</div>
				</div>
			</div>

			<script>
		$(function(){
			$(".bth").click(function(){
				var bId =  $(this).children().eq(0).text();
					location.href="<%=contextPath%>/detail.co?bId=" + bId;
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
			</script>


			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
				integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
				crossorigin="anonymous"></script>
		</section>
	</section>
	<br><br><br><br><br>
	<%@ include file="../common/footer.jsp"%>
</body>

</html>