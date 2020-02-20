<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.* , java.text.SimpleDateFormat"%>
    <%
    	SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
    	String today = format.format(new Date());
    	Board board = (Board)request.getAttribute("board");
    	Information info = (Information)request.getAttribute("info");
    	ArrayList<Attachment> fileList = (ArrayList<Attachment>) request.getAttribute("flist");
    	
    	System.out.println("fileList : " + fileList.get(0));
    	Attachment titleImg = fileList.get(0);
    	
    	System.out.println(fileList.get(1));
    
    	String lcode = board.getlCode();
    	int lc = 0;
    	switch(lcode){
    	case "서울특별시" : lc=10; break;
    	case "경기도" : lc=20; break;
    	case "강원도" : lc=30; break;
    	case "충청도" : lc=40; break;
    	case "경상도" : lc=50; break;
    	case "전라도" : lc=60; break;
    	}
    	
    	String[] selected = new String[6];
    	selected[(lc/10)] = "selected";
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
body{
	background:white;
}
.outer {
	width: 1500px;
	height: 1200px;
	margin: auto;
	margin-top: 150px;
}



.insertArea {
	width: 1000px;
	height: 1000px;
	margin: auto;
	background:white;
	box-shadow:10px 5px 15px 15px gray;
	border-radius:10px;
}

#titleImgArea {
	width: 350px;
	height: 200px;
	border: 2px dashed darkgray;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

#contentImgArea1, #contentImgArea2, #contentImgArea3 {
	width: 150px;
	height: 100px;
	border: 2px dashed darkgray;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

#titleImgArea:hover, #contentImgArea1:hover, #contentImgArea2:hover,
	#contentImgArea3:hover {
	cursor: pointer;
}

.btnArea {
	width: 250px;
	margin: auto;
}

button {
	height: 35px;
	width: 100px;
	background: black;
	border: black;
	color: white;
	border-radius: 5px;
	font-size:20px;
}

button:hover {
	cursor: pointer;
}

#detailArea{
	margin-left:70px;
	
}

td{
	font-size:16px;
}
label{
	font-size:16px;
	font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>
<body>

<%@ include file="../../common/menubar.jsp"%>

	<div class="outer">
		<br>
		<h1 align="center" style="font-family: 'Do Hyeon', sans-serif;">여행지 내용 수정</h1>

		<!-- 파일 업로드를 위해서는 enctype을 지정해줘야 함 -->
		<form action="<%= contextPath %>/update.fe" method="post">
		<input type="hidden" value="1" name="flag">
			<div class="insertArea">
				<table align="center">
					<br>
					<tr>
						<td width="100px" style="font-family: 'Do Hyeon', sans-serif;">제목<input type="hidden" name="bId" value="<%= board.getbId() %>"></td>
						
						<td colspan="3"><input type="text" size="100" name="title" value="<%= board.getbTitle() %>"></td>
					</tr>
					<tr>
						<td width="100px" style="font-family: 'Do Hyeon', sans-serif;">지역</td>
						<td colspan="3"><select name="lcode">
							<option>----</option>
							<option value="10" <%= selected[0] %>>서울특별시</option>
							<option value="20" <%= selected[1] %>>경기도</option>
							<option value="30" <%= selected[2] %>>강원도</option>
							<option value="40" <%= selected[3] %>>충청도</option>
							<option value="50" <%= selected[4] %>>경상도</option>
							<option value="60" <%= selected[5] %>>전라도</option>
						</select></td>
					</tr>
					
					<tr>
						<td style="font-family: 'Do Hyeon', sans-serif;">메인 이미지</td>
						<td colspan="3">
							<div id="titleImgArea">
								<img id="titleImg" src="<%=request.getContextPath()%>/resources/festival_uploadFile/<%=titleImg.getChangeName()%>" width="755" height="400">
							</div>
						</td>
					</tr>

					<tr>
						<td width="100px" style="font-family: 'Do Hyeon', sans-serif;">내용</td>
						<td colspan="3"><textarea name="content" rows="7" cols="102"
								style="resize: none;"><%= board.getbContent() %></textarea></td>
					</tr>
					
					
					<tr>
						<td style="font-family: 'Do Hyeon', sans-serif;">내용 사진</td>
						<td>
						
							<div id="contentImgArea1">
								<img id="contentImg1" width="245" height="150" src="<%= contextPath %>/resources/festival_uploadFile/<%= fileList.get(1).getChangeName() %>">
							</div>
						</td>
						<td>
							<div id="contentImgArea2">
								<img id="contentImg2" width="245" height="150" src="<%= contextPath %>/resources/festival_uploadFile/<%= fileList.get(2).getChangeName() %>">
							</div>
						</td>
						<td>
							<div id="contentImgArea3">
								<img id="contentImg3" width="245" height="150" src="<%= contextPath %>/resources/festival_uploadFile/<%= fileList.get(3).getChangeName() %>">
							</div>
						</td>
					</tr>
				

				</table>

				<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" name="thumbnailImg1"
						onchange="LoadImg(this,1)"> 
					<input type="file"
						id="thumbnailImg2" name="thumbnailImg2" onchange="LoadImg(this,2)">
					<input type="file" id="thumbnailImg3" name="thumbnailImg3"
						onchange="LoadImg(this,3)"> 
					<input type="file"
						id="thumbnailImg4" name="thumbnailImg4" onchange="LoadImg(this,4)">
				</div>
				<br><br>

				<div align="center" id="detailArea">
						<label>시작일&emsp; </label><input type="text" name="sdate" value="<%= today %>">&emsp;
						<label>종료일&emsp; </label><input type="text" name="edate" value="<%= today %>">&emsp;
						<label>전화번호&emsp; </label><input type="text" name="tel" value="<%= info.getTel() %>"><br>
						
						&emsp;<label>가 격&emsp; </label><input type="text" name="price" value="<%= info.getPrice() %>">&emsp;&nbsp;&nbsp;
						<label>주 소&emsp; </label><input type="text" name="address" value="<%= info.getAddress() %>">&emsp;
						<label>홈페이지&emsp; </label><input type="text" name="home" value="<%= info.getPage() %>"><br>
				</div>

				<script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function() {
						$("#fileArea").hide();

						$("#titleImgArea").click(function() {
							$("#thumbnailImg1").click();
						});

						$("#contentImgArea1").click(function() {
							$("#thumbnailImg2").click();
						});

						$("#contentImgArea2").click(function() {
							$("#thumbnailImg3").click();
						});

						$("#contentImgArea3").click(function() {
							$("#thumbnailImg4").click();
						});

					});

					// 파일 첨부 했을 때 미리보기 공간에 미리보기가 가능하게 하는 함수
					function LoadImg(value, num) {
						// value => input type="file"
						// num => 이후에 조건문 작성하여 번호에 맞춰서 img 적용 시킬 것

						// file이 존재하는지 확인
						if (value.files && value.files[0]) {
							// 파일을 읽어 들일 FileReader 객체 생성
							var reader = new FileReader();

							// 파일 읽기가 다 완료 되었을 때 실행되는 메소드
							reader.onload = function(e) {

								switch (num) {
								case 1:
									// e.target.result -> data:URL (파일의 컨텐츠)
									$("#titleImg").attr("src", e.target.result);
									break;
								case 2:
									$("#contentImg1").attr("src",
											e.target.result);
									break;
								case 3:
									$("#contentImg2").attr("src",
											e.target.result);
									break;
								case 4:
									$("#contentImg3").attr("src",
											e.target.result);
									break;
								}
							}
							// 파일 내용을 읽어들여 dataURL 형식의 문자열로 설정
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
			</div>
			<br>
			<div class="btnArea">
			
				<button type="submit" class="btn btn-outline-info"
					style="font-family: 'Do Hyeon', sans-serif;">작성완료</button>
				<button type="button" class="btn btn-outline-danger"
					style="font-family: 'Do Hyeon', sans-serif;"
					onclick="javascript:history.back();">취소하기</button>
				
			</div>
		</form>
		


	</div>

</body>
</html>