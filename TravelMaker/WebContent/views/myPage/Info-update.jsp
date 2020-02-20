<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style>
		#mypage-menu li {
			
		}
		
		.page {
			cursor:pointer;
		}
	</style>

<!-- 메뉴바 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

#my-info-section4 {
	width: 63%;
	float: left;
	margin-left: 2%;
	font-family: 'Do Hyeon', sans-serif;
}

#my-info-section5 {
	width: 40%;
	float: left;
	font-family: 'Do Hyeon', sans-serif;
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

<style>
	.outer {
	width: 900px;
	height: 100%; 
	background: white;
	color: black;
	margin-left: auto;
	margin-right: auto;
}

table {
	height: 100%;
}

#joinForm {
	height: 67%;
}

#passExp, #passCorrect, #nameExp, #noExp, #nickNameExp, #nickNameExp2, #phoneExp {
	font-size: 12px;
	color: red;
	display: none;
}

input {
	margin-top: 2px;
}

button {
	height: 26px;
	width: 90px;
	background: darkgray;
	border: darkgray;
	color: white;
	border-radius: 5px;
}

button:hover {
	cursor: pointer;
	background: salmon;
}



#logo {
	margin-left: auto;
	margin-right: auto;
	cursor: pointer;
}

.mimg {
	margin-left: auto;
	margin-right: auto;
	margin-top:30px;
	width: 150px;
	height: 30%;
}

.mimg img {
	width: 300px;
	height: 60%;
	border-radius: 50%;
	transform:translateX(-75px);
}

#email {
	width: 76px;
}

.btns {
	width: 100%;
	height: 10%;
}

.btns button {
	background: skyblue;
	width: 200px;
	height: 40px;
	float: left;
	border-radius: 0px;
	box-sizing: border-box;
	margin-top:50px;
}

.btns button:hover {
	background: salmon;
}

.outer tr label {
	color:red;
}

.outer tr input {
	width: 250px; /* 원하는 너비 설정 */ 
	height: 10px; /* 높이값 초기화 */ 
	line-height : normal; /* line-height 초기화 */ 
	padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */ 
	border: 1px solid #999; 
	border-radius: 4px;
	/* outline-style: none; */ 
	-webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ 
	-moz-appearance: none; 
	appearance: none;

}

.outer td:first-child {
	padding: .8em .5em;
	cursor: text;
	width:300px;
	text-align:right;
	font-family: fontAwesome;
}

#logo {
	margin-bottom:30px;
}

#title {
	font-size:30px;
}
</style>

</head>

<body>
	<%@ include file="../common/menubar.jsp" %>
	<section id="body">
		<aside>
			<section id="my-info-section1">
				<div class="my-info" id="my-info">
					<h3 id="my-info-text">마이페이지</h3>
					<img onclick="profileUpdate();" id="profile"
						src="<%= request.getContextPath() %>/resources/myplan_upload/<%= loginUser.getProfile() %>"><br>
					<% System.out.println(request.getContextPath()); %>
					<p id="name">&nbsp;&nbsp;&nbsp;<%= loginUser.getmName() %></p>
					<br> <br>
					<button class="myinfo-button" id="my-info-logout"
						onclick="logout();">로그아웃</button>
					<button class="myinfo-button" id="my-info-modify"
						onclick="infoModify();">회원정보 수정</button>
				</div>
				<script>
                	function logout() {
            			location.href="<%= request.getContextPath() %>/logout.me";
            		}
            	
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
						<li class="no"><a class="page" onclick="location.href='<%= contextPath %>/festivalMember.fe?=' + 2">
							나의계획</a></li>
						<li><a class="page"
							onclick="location.href='<%= contextPath %>/festivalall.fe?flag=4&no=1'">내가
								쓴 게시글</a></li><hr>
						<li class="bigContent no">개인정보 관리</li>
						<li style="font-weight: bold"><a class="page"
							onclick="location.href='<%= request.getContextPath() %>/views/myPage/Info-update.jsp';">회원정보
								수정</a></li><hr>
						<li class="bigContent no">고객센터</li>
						<li><a class="page"
							onclick="location.href='<%= request.getContextPath() %>/select.qa?mSeq=' + <%= loginUser.getM_seq()%>">문의
								내역</a></li>
					</ul>
				</div>
			</section>
		</aside>

		<!-- 1. 회원 가입 -->
		<!-- 1_1. 회원가입 폼 작성 -->
		<section id="outer">
			<div class="outer">
				<p style="font-size:30px; float:left">회원정보 수정</p>
				<button id="deleteMember" style="margin-left:40%; margin-bottom:-100px; background:white; color:black;">회원탈퇴</button>
				<hr style="width:650px; margin-left:0px;">
				<form id="updateForm" name="updateForm" style="margin-left:-100px;">
					<table style="margin-top:60px;">
						<tr>
							<td>이름</td>
							<td><input type="text" disabled
								value="<%=loginUser.getmName()%>" style="margin-left: 20px;"></td>
						</tr>

						<tr>
							<td>아이디</td>
							<td><input type="text"
								value="<%=loginUser.getmId()%>" style="margin-left: 20px;" readonly
								id="upId" name="upId">
							</td>
						</tr>

						<tr>
							<td>비밀번호</td>
							<td><input type="password" maxlength="15" id="upPass" value="<%= loginUser.getPass() %>" name="upPass" style="margin-left: 20px"> <label id="passExp">비밀번호는
									9자리 이상 13자리 이하, 영문과 숫자 조합입니다</label>
							</td>
						</tr>


						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" maxlength="15" name="upPass2"
								id="upPass2" style="margin-left: 20px"> <label
								id="passCorrect">비밀번호가 일치하지 않습니다</label>
								
							</td>
						</tr>

						<tr>
							<td>닉네임</td>
							<td><input type="text" id="upNick" name="upNick" maxlength="6"
								value="<%=loginUser.getNickName()%>"
								style="margin-left: 20px;"> <label id="nickNameExp">이미
									존재하는 닉네임입니다</label><label id="nickNameExp2">한글, 숫자, 영어로 2~6글자까지 작성할 수 있습니다</label>
								
							</td>
						</tr>

						<tr>
							<td>휴대폰 번호</td>
							<td><input type="text"
								value="<%=loginUser.getPhone()%>" id="upPhone" name="upPhone"
								style="margin-left: 20px;"> <label id="phoneExp">휴대폰
									번호는 010, 011로 시작하며 11자리여야 합니다</label>
								
							</td>
						</tr>

						<tr>
							<td>이메일 </td>
							<td><input style="margin-left: 19px; width:200px;" type="text" name="upEmail" id="upEmail" value="<%= loginUser.getEmail().substring(0, loginUser.getEmail().indexOf("@")) %>" required> @ 
							<select
								id="upEmail2" name="upEmail2">
									<option value="naver.com">naver.com</option>
									<option value="naver.com">daum.net</option>
									<option value="naver.com">hanmail.net</option>
									<option value="naver.com">google.com</option>
							</select>
							</td>
						</tr>
						<tr style="position:absolute">
							<td>
								<div style="margin-left:450px; margin-top:-12px; float:left;"><input type="text" id="key" style="width:100px; font-size:13px;" placeholder="인증번호입력"></div>
								<div style="margin-top:-27px; margin-left:560px; float:left;"><button id="emailCheck" type="button" style="font-size:12px;">이메일 인증</button></div>
							</td>
						</tr>
					</table>
					<br><br>
					<div class="btns" align="center" style="margin-left:21%;">
						<div style="height: 50%"></div>
						<button id="toMain" onclick="returnToMain()" type="button">취소</button>
						<button id="updateBtn">변경</button>
						<br><br>
					</div>
				</form>
				
                <script>
                	$(function() {
                		$("#deleteMember").click(function() {
                			console.log("클릭");
                			if(window.confirm("정말 회원을 탈퇴하시겠습니까 ?\n" +
                					"한번 탈퇴한 회원은 복구가 불가능합니다")) {
                				location.href="<%= request.getContextPath() %>/delete.me";
                				window.alert("회원을 탈퇴하셨습니다");
                			}else {
                				window.alert("회원 탈퇴들 취소하셨습니다");
                			}
                		});
                	});
                </script>
			</div>

			<script>
				<% if(request.getSession().getAttribute("msg") != null) { %>
					alert('<%=request.getSession().getAttribute("msg") %>');
					<% request.getSession().setAttribute("msg", null); %>
				<% } %>
				function returnToMain() {
					location.href="<%= request.getContextPath() %>";
				}
			
				var checkPwd1, checkPwd2, checkNickName, checkPhone, checkEmail;
				checkPwd1 = true;
				checkPwd2 = true;
				checkNickName = true;
				checkPhone = true;
				checkEmail = true;
				
						// pwd 정규식
						var passExp = /^[a-zA-Z0-9]{9,13}$/;
				    	 $("#upPass").focusout(function() {
				    		 if(passExp.test($(this).val())) {	
				    			 $('#passExp').css('display', 'none');
				    			 checkPwd1 = true;
				    		 }else {
				    			 $('#passExp').css('display', 'unset');
				    			 checkPwd1 = false;
				    		 }
				    	 });
						
						// pwd 일치 여부 확인
				    	 $("#upPass2").focusout(function() {
					    	 var pass1 = $("#upPass").val();
					    	 var pass2 = $("#upPass2").val();
				    		 
					    	 if(pass1 == pass2) {
					    		 $('#passCorrect').css('display', 'none');
					    		 checkPwd2 = true
					    	 }else {
					    		 $('#passCorrect').css('display', 'unset');
					    		 checkPwd2 = false;
					    	 }
				    	 });
						
				    	// 닉네임 길이 확인 및 중복확인
				    	 $("input[name=upNick]").focusout(function() {
				    		 var nick = $("#joinForm input[name=upNick]");
				    		 console.log(nick.val());
				    		 $.ajax({
									url : "<%= request.getContextPath() %>/nicknameCheck.me",
									type : "post",
									data : nick,
									success : function(data) {
										if(nick.val().length < 2) {
										}else {
											if(data == "fail") {
												$("#nickNameExp").css('display', 'unset');
												checkNickName = false;
											}else {
												$("#nickNameExp").css('display', 'none');
												checkNickName = true;
											}
										}
									},
									error : function() {
										console.log('서버 통신 안됨');
									}
								});
				    	 });
				    	 
				    	// 닉네임 제약조건
				    	 var nickExp = /^[0-9a-zA-Z가-힣]{2,6}$/;
				    	 $("input[name=upNick]").focusout(function() {
				    		 if(nickExp.test($(this).val())) {	
				    			$('#nickNameExp2').css('display', 'none');
				    			checkNickName = true;  
				    		 }else {
				    			 $('#nickNameExp2').css('display', 'unset');
				    			 checkNickName = false;
				    		 }
				    	 });
				    	 
				    	 // 연락처 글자 11자리, 앞은 010 또는 011로 시작
				    	 $('#upPhone').focusout(function() {
				    		 var phone = $('#upPhone');
				    		 if(phone.val().length == 11 && (phone.val().substring(0,3) == "010" || phone.val().substring(0,3) == "011")) {
				    			 $("#phoneExp").css('display', 'none');
				    			 checkPhone = true;
				    		 }else {
				    			 $("#phoneExp").css('display', 'unset');
				    			 checkPhone = false;
				    		 }
				    		 
				    	 });
				    	 
				    	 // 이메일
				    	 var key;
					 		$(function() {
					 			$("#emailCheck").click(function(){
					 				var email = $("#upEmail").val() + '@' + $("#upEmail2").val();
					 					$.ajax({
					 						// url : 데이터를 전송할 url(필수!!!)
					 						url : "<%= request.getContextPath() %>/mail.mo",
					 					
					 						// data : 요청 시 전달할 파라미터 설정
					 						data : {email:email},
					 						// key:value
					 					
					 						// type : 전송 방식(GET / POST)
					 						type : "get",
					 					
					 						// success : Ajax 통신 성공 시 처리할 함수를 지정하는 속성
					 						success : function(result){
					 							// result 매개변수 : 서버에서 응답이 왔을 때 그 값이 저장 되는 변수
					 							// 매개변수명 임의 지정 가능
					 							key = result;
					 							checkEmail = true;
					 						},
					 					
					 						// error : Ajax 통신 실패 시 처리할 함수를 지정하는 속성
					 						error : function(){
					 							console.log('Ajax 통신 실패...');
					 							checkEmail = false;
					 						}					
					 					});
						    		 
					 			});
					 		})
				    	 
				    	 
				    	 $("#updateBtn").click(function() {
				    		 if(checkPwd1 == true && checkPwd2 == true && 
				    				 checkNickName == true && checkPhone == true && checkEmail) {
				    			 	$("#updateForm").attr("method", "post");
					    			$("#updateForm").attr("action", "<%=request.getContextPath()%>/update.me");
					    			
					    	}else { 
					    			if(checkPwd1 == false) {
					    				alert("비밀번호를 체크해주세요");
					    				location.href="#upPass";
					    			}else if(checkPwd2 == false) {
					    				alert("비밀번호 확인을 체크해주세요");
					    				location.href="#upPass2";
					    			}else if(checkNickName == false) {
					    				alert("닉네임을 체크해주세요");
					    				location.href="#upNick";
					    			}else if(checkPhone == false) {
					    				alert("연락처를 체크해주세요");
					    				location.href="#upPhone";
					    			}else if($("#key").val() != key){
					    				alert("이메일 및 인증번호를 체크해주세요");
					    			}else {
					    				
					    			}
					    	} 
				 		});
			</script>
		</section>
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>

</html>