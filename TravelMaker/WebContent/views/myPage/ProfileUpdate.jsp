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
<style>
body {
	background: #333 !important;
}

* {
	margin: 0px;
	padding: 0px;
	font-family: 'Lato';
}

a {
	text-decoration: none !important;
	color: #333;
}

ul, ol {
	margin: 0px;
}

.container {
	max-width: 960px;
}

.row {
	margin-bottom: 50px;
}

/***item-1 Login box*********************************************************************/
.item-1 {
	width: 320px;
	height: 200px;
	background: #25A9CC;
	margin: 0;
	margin-left:-15px;
	-moz-box-shadow: 0 0 5px #000;
	-webkit-box-shadow: 0 0 5px #000;
	box-shadow: 0 0 5px #000;
}

.item-1 h1 {
	font-size: 24px;
	margin-top: 0px;
}

.img-container {
	width: 100%;
	height: 150px;
	text-align: center;
}

.img-container a {
	margin: 0px auto;
	text-align: center;
}

.img-container a img {
	border-radius: 50%;
	border: 3px solid #fff;
	margin-top: 20px;
	width: 96px;
}

.robin-key {
	width: 100%;
	height: auto;
	background: #fff;
}

.robin-key p {
	font-size: 15px;
	color: #828282;
	line-height: 42px;
	margin-bottom: 0px;
	text-align:center;
}

.robin-key ul {
}

.robin-key ul li {
	padding: 4px 12px;
	margin-top: 6px;
	border-right: 1px solid #ddd;
	color: #3f4c6b;
	list-style: none;
}

.robin-key ul li a {
	color: #3f4c6b;
}

.robin-key ul li a:hover {
	color: #242D3F;
}

.robin-key ul li:last-child {
	border-right: none;
}

ul.follow-list {
	margin: 0px;
	padding: 0px;
	background: #3f4c6b;
	width: 100%;
}

ul.follow-list li {
	width: 25%;
	float: left;
	list-style: none;
	padding: 8px 0px;
	background: #111F28;
}

ul.follow-list li a {
	padding: 2px 14px;
	display: inline-block;
	color: #fff;
	font-size: 13px;
	border-right: 1px solid #1C3544;
}

ul.follow-list li:last-child a {
	border-right: none;
}

center, center * {
	color: #ffffff !important;
	font-size: 14pt;
}

.update {
	left:60%:
	position: absolute;
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-2.2.4.js">
	</script>
	<link
		href="https://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css"
		rel="stylesheet" media="screen">


	<link
		href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
		rel="stylesheet">
	<script
		src="https://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
	<link href='//fonts.googleapis.com/css?family=Lato:100,300'
		rel='stylesheet' type='text/css'>
	<div class="container">
		<form method="post"
			action="<%=request.getContextPath()%>/insertProfile.me"
			enctype="multipart/form-data">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"></div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">

					<div class="item-1">
						<div class="img-container" id="titleImgArea">
							<img name="member-profile" id="img" width="100" height="100" style="margin-top:20px; cursor:pointer;"
								src="<%= request.getContextPath() %>/resources/myplan_upload/<%= loginUser.getProfile() %>" />
						</div>
						<div class="robin-key">
							<p><%= loginUser.getmName() %></p>
							<button class="update" style="margin-left:47%; margin-bottom:20%;">변경</button>
						</div>
					</div>
				</div>
				
			</div>
			<div id="fileArea">
					<input type="file" id="thumbnailImg1" name="thumbnailImg1"
					onchange="LoadImg(this,1)" style="display:none">
				</div>
		</form>
	</div>
	
	<script>
	// 사진 넣기 
	$(function() {
		$("#titleImgArea").click(function() {
			$("#thumbnailImg1").click();
		});
	});
	
	function LoadImg(value, num) {
		if (value.files && value.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {

				switch (num) {
				case 1:
					// e.target.result -> data:URL (파일의 컨텐츠)
					$("#img").attr("src", e.target.result);
					break;
				};
			}
			// 파일 내용을 읽어들여 dataURL 형식의 문자열로 설정
			reader.readAsDataURL(value.files[0]);
		}
	}
	</script>
</body>
</html>