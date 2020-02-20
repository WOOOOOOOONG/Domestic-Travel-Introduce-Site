<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<title>Insert title here</title>
<style>
	#mimg {
            margin-left:23%;
            width:100px;
            height:100px;
            margin-top:10px;
            cursor:pointer;
        }

        #mimg img {
            width: 200px;
            height:100px;
            border-radius: 50%;
        }
        
        #p {
            background-color:black;
            width:300px;
            height:40px;
            text-align: center;
            margin-left:auto;
            margin-right:auto;
            line-height: 40px;
        }

        p {
            color:white;
            font-size:15px;
        }
        
		body{
	height: 1000px;
	width: 1500px;
	margin: 0;
	display: flex;
	background: #f8f8f8;
}
.phone{
	width: 375px;
	height: 780px;
	background-color: #ffffff;
	border-radius: 10px;
	margin-left:562px;
	margin-top: 8%;
}

.phone h3{
width: 72px;
height: 41px;
color: #323232;
font-family: "Segoe UI";
font-size: 30px;
font-weight: 400;
letter-spacing: -0.72px;
margin-top: 50px;
margin-left: 30px;
margin-bottom: 50px;
}
.phone .form-group{
	display: grid;
	margin-bottom: 30px;
	justify-content: center;
}

.label {
	width: 52px;
	height: 20px;
	color: #a6a6a6;
	font-family: "Segoe UI";
	font-size: 14px;
	font-weight: 400;
	letter-spacing: -0.34px;
	transition: 0.4s;
}

.id-pwd {
	width:100%;
	height:20px;
	color : #a6a6a6;
	font-family: "Segoe UI";
	font-size: 14px;
	font-weight: 400;
	letter-spacing: -0.34px;
	transition: 0.4s;
	text-align:center;
}

.phone .form-group input{
	width: 327px;
	border:none;
	border-bottom: 1px solid #dadada;
	padding: 16px 0;
}

.phone .form-group input:focus{
	outline: none;
	
}
.phone .form-group .focus-border{
	
	bottom: 0; 
	left: 0; 
	width: 0; 
	height: 2px; 
	  background: linear-gradient(to right, #9cecfb, #65c7f7, #0052d4); 
	transition: 0.4s;
}
.phone .form-group input:focus ~ .focus-border{
	width: 327px; transition: 0.4s;
}
.phone h4{
	width: 200px;
height: 20px;
color: #3c3c3c;
font-family: "Segoe UI";
font-size: 14px;
font-weight: 400;
letter-spacing: -0.34px;
text-align: center;
color: #a3a3a3;
	margin: 0 auto;
	left: 0;
	right: 0;
	cursor: pointer;
}
button {
	margin-top: 10px;
	width:100px;
	height:30px;
	margin-left:210px;
	font-family: fontAwesome;
	
}
	</style>
</head>
<body>
	<div class="phone">
		<div id=mimg><img src="<%= request.getContextPath() %>/resources/images/로고.png" alt="" onclick="goMain();"></div>
		<p id="p" style="cursor:pointer" onclick="goMain();">ID 찾기</p> 
	<form method="post" class="loginForm" id="loginForm1" style="margin-bottom: 40px;">
		<div class="form-group">
			<label class="label">이름</label>
			<input type="text" name="findName1">
			<br>
			<label class="label" style="width:60px">생년월일</label>
			<input type="text" name="findNo1">
			<span class="focus-border"></span>
			<button onclick="findId();">ID 찾기</button>
		</div>
	</form>
	<form method="post" class="loginForm" id="loginForm2">
		<div class="form-group">
		<p id="p" style="cursor:pointer" onclick="goMain();">PWD 찾기</p> 
			<label class="label">ID</label>
			<input type="text" name="findID2">
			<br>
			<label class="label" >이름</label>
			<input type="text" name="findName2">
			<br>
			<label class="label" style="width:60px">생년월일</label>
			<input type="text" name="findNo2">
			<span class="focus-border"></span>
			<button onclick="findPwd();">PWD 찾기</button>
		</div>
	</form>
	</div>
	<!-- <div class="log">
                <button name="fb">FaceBook 로그인</button>
                <button name="na">네이버 로그인</button>
                <button name="kk">Kakao 로그인</button>
                <button name="gg">Google 로그인</button>
    </div> -->
    <script>
            	<% if(request.getSession().getAttribute("memberId") != null) { %>
        			alert('<%=request.getSession().getAttribute("memberId") %>');
        			<% request.getSession().setAttribute("memberId", null); %>
        		<% } %>
        		
        		<% if(request.getSession().getAttribute("memberPwd") != null) { %>
    				alert('<%=request.getSession().getAttribute("memberPwd") %>');
    				<% request.getSession().setAttribute("memberPwd", null); %>
    			<% } %>
    		
            	function goMain() {
            		location.href="<%= request.getContextPath() %>";
            	}
            	
            	function findId() {
            		$("#loginForm1").attr("method", "post");
            		$("#loginForm1").attr("action", "<%= request.getContextPath() %>/findID.me");
            	}
            	
            	function findPwd() {
            		$("#loginForm2").attr("method", "post");
            		$("#loginForm2").attr("action", "<%= request.getContextPath() %>/findPwd.me");
            	}
    </script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</body>
</html>