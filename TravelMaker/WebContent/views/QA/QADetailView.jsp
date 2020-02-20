<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, QA.model.vo.*, member.model.vo.*, board.model.vo.*"%>

<%
	QA q = (QA) request.getAttribute("q");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<title>Insert title here</title>

<!-- 영역 분할 -->
<style>
/* 몸체 */
#body {
	margin-top: 180px;
	width: 1500px;
	height: 700px;
	display: flex;
	flex-direction: row;
	margin-left: auto;
	margin-right: auto;
}

aside {
	margin-left: 10%;
	width: 15%;
	height: 100%;
	margin-right: 2%;
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

#marginBody {
	width: 65%;
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


<!-- .notice -->
<style>
.notice {
	width: 80%;
	height: 90%;
	margin-left: auto;
	margin-right: auto;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

.page-title {
	width: 100%;
	height: 8%;
	border: 1px solid rgba(31, 5, 5, 0.158);
	background: rgba(31, 5, 5, 0.158);
}

.title {
	width: 100%;
	height: 5.5%;
	border: 1px solid rgba(31, 5, 5, 0.158);
	background: rgba(31, 5, 5, 0.158);
	font-size: 22px;
	line-height: 45px;
}

.page-title h3 {
	width: 100%;
	font-size: 29px;
	color: #333333;
	font-weight: bolder;
	text-align: center;
	line-height: 30px;
}

.content {
	width: 100%;
	height: 41%;
	border: 1px solid rgba(31, 5, 5, 0.158);
	background: rgba(31, 5, 5, 0.158);
}

.inContent {
	width: 97%;
	height: 93%;
	margin: auto;
	background: white;
	border: 1px solid black;
	margin-top: 1.5%;
}

#board-search .search-window {
	padding: 15px 0;
	background-color: #f9f7f9;
}

#board-search .search-window .search-wrap {
	position: relative;
	/*   padding-right: 124px; */
	margin: 0 auto;
	margin-right: 20px;
	width: 70%;
	max-width: 564px;
}

#board-search .search-window .search-wrap input {
	height: 40px;
	width: 100%;
	font-size: 14px;
	padding: 7px 14px;
	border: 1px solid #ccc;
}

#board-search .search-window .search-wrap input:focus {
	border-color: #333;
	outline: 0;
	border-width: 1px;
}

#board-search .search-window .search-wrap .btn {
	position: absolute;
	right: 0;
	top: 0;
	bottom: 0;
	width: 108px;
	padding: 0;
	font-size: 16px;
}

.board-table {
	font-size: 13px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	text-align: center;
}

.board-table .th-num {
	width: 100px;
	text-align: center;
}

.board-table .th-date {
	width: 200px;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}

.btn {
	display: inline-block;
	padding: 0 30px;
	font-size: 15px;
	font-weight: 400;
	background: transparent;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	text-transform: uppercase;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-ms-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

/* reset */
* {
	list-style: none;
	text-decoration: none;
	box-sizing: border-box;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
}

.container {
	width: 1100px;
	margin: 0 auto;
}

.blind {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
}

.container {
	width: 80%;
}

#write {
	margin-left: 85%;
	margin-top: 3%;
}

#inquire-type {
	height: 35px;
	margin-top: 2.5%;
	margin-left: 2%;
}

.page {
	cursor:pointer;
	color:black;
}


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<section id="body">
		
		<% if(loginUser.getmId().equals("admin")) {%>
		<aside>
			<section id="my-info-section1">
				<div class="my-info" id="my-info">
					<h3 id="my-info-text">관리자페이지</h3>
					<img src="<%= request.getContextPath() %>/resources/images/smile.jpg"><br>
					<p id="name">&nbsp;&nbsp;&nbsp;관리자</p>
					<br>
					<br>
					<br>
					<button class="myinfo-button" id="my-info-logout"
						onclick="logout();" style="width:100%">로그아웃</button>
				</div>
				<script>
                	function logout() {
                		location.href="<%= request.getContextPath() %>/logout.me";
                	}
                </script>
			</section>
			<section id="my-info-section2">
				<div id="mypage-menu">
					<ul>
						<li class="bigContent"><a href="#" onclick="location.href='<%= request.getContextPath() %>/select.mo'">회원 관리</a></li>
						
						<hr>
						
						<li class="bigContent"><a href="#" onclick="location.href=''">게시글 관리</a></li>
						
						<hr>
						
						<li class="bigContent"><a href="#" onclick="location.href='<%= request.getContextPath() %>/select.qa'">회원 문의 내역</a></li>
					</ul>
				</div>
			</section>
		</aside>
		<% } else {%>
		<aside id="aside1">
			<section id="my-info-section1">
				<div class="my-info" id="my-info">
					<h3 id="my-info-text">마이페이지</h3>
					<img onclick="profileUpdate();" id="profile"
						src="<%= request.getContextPath() %>/resources/myplan_upload/<%= loginUser.getProfile() %>"><br>
					<p id="name">
						&nbsp;&nbsp;&nbsp;<%= loginUser.getmName() %></p>
					<br> <br>
					<button class="myinfo-button" id="my-info-logout" style="margin-top:10px;"
						onclick="logout();">로그아웃</button>
					<button class="myinfo-button" id="my-info-modify" style="margin-top:10px;"
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
						<li class="no"><a class="page"
							onclick="location.href='<%= contextPath %>/festivalMember.fe?=' + 2">
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
						<li style="font-weight: bold"><a class="page"
							onclick="location.href='<%= request.getContextPath() %>/select.qa?mSeq=' + <%= loginUser.getM_seq()%>">문의
								내역</a></li>
					</ul>
				</div>
			</section>
		</aside>
		<% } %>

		<section id="marginBody">

			<section class="notice" style="border: 1px solid black">
				<div class="page-title">
					<h3>문의 내역</h3>
				</div>
				<div class="title">
					&nbsp;&nbsp;&nbsp;&nbsp;제목 :
					<%=q.getqTitle()%></div>
				<div class="content">
					<div class="inContent">
						<%=q.getqContent()%>
					</div>
				</div>
				<div class="title">&nbsp;&nbsp;&nbsp;&nbsp;답변</div>
				<div class="content">
					<div class="inContent">
						<%
							if (q.getAnswer() != null) {
						%>
						<%=q.getAnswer()%>
						<%
							}
						%>
					</div>
				</div>
			</section>
			<%if(loginUser.getmId().equals("admin")) {%>
				<% if(q.getAnswer() == null) { %>
					<div style="width:80%; height:10%; margin-left:auto; margin-right:auto;">
						<button type="submit" class="sub" style="float:right; margin-top:1%; width:15%; height:30%" onclick="Answer()">답변하기</button>
					</div>
				<% } else { %>
					<div style="width:80%; height:10%; margin-left:auto; margin-right:auto;">
						<button type="submit" class="sub" style="float:right; margin-top:1%; width:15%; height:30%" onclick="Answer()">답변수정하기</button>
					</div>	
				<% } %>
			<% }else { %>
			<div style="width:80%; height:10%; margin-left:auto; margin-right:auto;">
				<button type="submit" class="sub" style="float:right; margin-top:1%; width:15%; height:30%" onclick="QDelete()">삭제하기</button>
				<button type="submit" class="sub" style="float:right; margin-top:1%; width:15%; height:30%" onclick="QUpdate()">수정하기</button>	
			</div>
			<% } %>
		</section>
	</section>

	<script>
		function Answer() {
			location.href="<%= request.getContextPath() %>/form.an?qId=<%= q.getqId()%>";
		}
		
		function QUpdate() {
			location.href="<%= request.getContextPath() %>/form.qa?qId=<%= q.getqId()%>";
		}
		
		function QDelete() {
			location.href="<%= request.getContextPath() %>/delete.qa?qId=<%= q.getqId()%>";
		}
	</script>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>