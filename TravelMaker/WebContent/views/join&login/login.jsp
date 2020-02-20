<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
	<!-- font-family: fontAwesome; -->
    <title>Document</title>
    <!-- <style>
           body {
        background: ghostwhite;
        display: table;
        margin-top: 0;
        margin-left: auto;
        margin-right: auto;
        width: 1000px;
        height: 100%;
    }

        form {
            height:100%;
        }

        .loginForm {
            width:500px;
            height:100%;
            margin-top:5%;
            margin-left:auto;
            margin-right:auto;
            border:1px solid darkgray;
            background-color:white;
            
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

        #mimg {
            margin-left:auto;
            margin-right:auto;
            width:100px;
            height:100px;
            margin-top:10px;
            cursor:pointer;
        }

        #mimg img {
            width: 100px;
            height:100px;
            border-radius: 50%;
        }

        #login {
            width:300px;
            margin-left:auto;
            margin-right:auto;
        }

        #login input {
            width:300px;
            height: 40px;
            box-sizing: border-box;
        }

        #loginBtn {
            width:350px;
            height:30px;
            margin-left:auto;
            margin-right:auto;
        }

        #lo, #insert{
            width:150px;
            height: 100%;
            color:white;
            background:skyblue;
        }

        #insert {
            padding:0;
            margin-right:0;
            margin-left:27px;
        }

        .log {
            width:250px;
            margin-left:auto;
            margin-right:auto;
        }

        .log button {
            width: 100%;
            height:50px;
            margin-left:auto;
            margin-right:auto;
        }

        #selectForm {
            width:200px;
            height:40px;
            margin-left:auto;
            margin-right:auto;
            
        }
        
        #select {
            width:200px;
            height:40px;
            margin-left:auto;
            margin-right:auto;
            color:white;
            background:darkturquoise;
        }

        .log :nth-of-type(1) {
            background:blue;
            color:white;
        }

        .log :nth-of-type(2) {
            background:green;
            color:white;
        }
        .log :nth-of-type(3) {
            background:gold;
            color:white;
        }
        .log :nth-of-type(4) {
            background:orangered;
            color:white;
            margin-bottom: 25px;
        }

        .log button {
            margin-bottom: 10px;
        }
    </style>
 -->
	<style>
	#mimg {
		margin-left: 23%;
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
	background: #f8f8f8;
	font-family: 'Do Hyeon', sans-serif;
}
.phone{
	width: 375px;
	height: 540px;
	background-color: #ffffff;
	border-radius: 10px;
	position:absolute;
	top:50%;
	left:50%;
	margin: -270px 0 0 -187px;
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

.phone .form-group label{
	width: 32px;
	height: 20px;
	color: #a6a6a6;
	font-family: "Segoe UI";
	font-size: 14px;
	font-weight: 400;
	letter-spacing: -0.34px;
	transition: 0.4s;
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
.phone .form-group button{
	width: 315px;
	height: 48px;
	background-image: linear-gradient(to right, #9cecfb, #65c7f7, #0052d4);
	border: none;
	border-radius: 10px;
	color: white;
	font-size: 14px;
	font-family: "Segoe UI";
	cursor: pointer;
}
.phone .form-group button:focus{
	outline: none;
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
	</style>
</head>
<body>
    <%-- <form method="post" class="loginForm" id="loginForm" action="<%= request.getContextPath() %>/login.me">
        <div class="login-form">
            <div id=mimg><img src="<%= request.getContextPath() %>/resources/images/로고.png" alt="" onclick="goMain();"></div>
            <div id="p">
            <p style="cursor:pointer" onclick="goMain();">TRAVEL MAKER</p> 
            </div>
            <br>
            <div id="login">
                <input type="text" id="" placeholder="ID" name="loginId"> <br>

                <input type="password" id="pwd" placeholder="****" name="loginPass"> <br> <br> 
            </div>
            <div id="loginBtn"> <button id="lo" onclick="goLogin();">로그인</button> &nbsp;&nbsp; 
            <input type="button" onclick="goJoin();" id="insert" value="회원가입">
            <script>
            	<% if(request.getSession().getAttribute("msg") != null) { %>
        			alert('<%=request.getSession().getAttribute("msg") %>');
        			<% request.getSession().setAttribute("msg", null); %>
        		<% } %>
        		
        		function goLogin() {
        			location.href="<%= request.getContextPath() %>/login.me";
        		}
        		
            	function goJoin() {
            		location.href="<%= request.getContextPath() %>/views/join&login/Join.jsp";
            	}
            	
            	function goMain() {
            		location.href="<%= request.getContextPath() %>";
            	}
            </script>
            </div> <br>
            <div id="selectForm">
            <button id="select">아이디/비밀번호 찾기</button>
            </div>
            <br>
            
        </div>
    </form> --%>
    
    <form method="post" class="loginForm" id="loginForm" action="<%= request.getContextPath() %>/login.me">
	<div class="phone">
		<div id=mimg style="margin-bottom:30px"><img src="<%= request.getContextPath() %>/resources/images/로고.png" alt="" onclick="goMain();"></div>
		<!-- <p id="p" style="cursor:pointer" onclick="goMain();">로그인</p>  -->
		<div class="form-group">
			<label class="label" for="">ID</label>
			<input type="text" name="loginId">
			<span class="focus-border"></span>
		</div>
		<div class="form-group">
			<label class="label" for="">Password</label>
			<input type="password" name="loginPass">
			<span class="focus-border"></span>
		</div>
		<div class="form-group">
			<button>로그인</button>
		</div>
		<h4 onclick="goJoin();">회원가입</h4>
		<br>
		<h4 onclick="goIdPwdFind();" style="margin-left: 90px;">아이디/비밀번호 찾기</h4>
	</div>
	<!-- <div class="log">
                <button name="fb">FaceBook 로그인</button>
                <button name="na">네이버 로그인</button>
                <button name="kk">Kakao 로그인</button>
                <button name="gg">Google 로그인</button>
    </div> -->
    <script>
            	<% if(request.getSession().getAttribute("msg") != null) { %>
        			alert('<%=request.getSession().getAttribute("msg") %>');
        			<% request.getSession().setAttribute("msg", null); %>
        		<% } %>
        		
        		function goLogin() {
        			location.href="<%= request.getContextPath() %>/login.me";
        		}
        		
            	function goJoin() {
            		location.href="<%= request.getContextPath() %>/views/join&login/Join.jsp";
            	}
            	
            	function goMain() {
            		location.href="<%= request.getContextPath() %>";
            	}
            	
            	function goIdPwdFind() {
            		location.href="<%= request.getContextPath() %>/views/join&login/FindIdPwd.jsp"
            	}
    </script>
	</form>
</body>
</html>