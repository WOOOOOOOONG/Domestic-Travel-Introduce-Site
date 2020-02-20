<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, board.model.vo.*"%>

<%
	Board b = (Board) request.getAttribute("board");

	ArrayList<Attachment> fileList = (ArrayList<Attachment>) request.getAttribute("fileList");
	Attachment titleImg = fileList.get(0);
	Information in = (Information) request.getAttribute("in");

	ArrayList<Reply> rlist = (ArrayList<Reply>) request.getAttribute("rlist");
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
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<style>
body {
	background-color: white;
	width: 1500px;
	height: 2200px;
}

#choice1 {
	margin: auto;
	width: 1200px;
	height: 1300px;
	padding: 50px;
	
}

.travel {
	width: 100%;
	height: 30%;
}

.btn {
	width: 70px;
	height: 50px;
	margin: auto;
	font-size: 13px;
}

.tag {
	border-radius: 10px;
	opacity: 0.8;
	position: relative;
	margin-top: 120px;
}

.tag>p {
	color: white;
	text-align: center;
	font-size: 24px;
	font-weight: 400;
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

#fesTable {
	text-align: center;
	width: 100%;
	height: 100%;
}

#b1 {
	float: left;
	margin-top: 20px;
}

#b1 li {
	margin-left: 80px;
}

#b2 {
	float: right;
	margin-top: 20px;
}

#b2 li {
	margin-right: 80px;
}

#b {
	margin: auto;
	border-radius: 10px;
	height: 180px;
	width: 70%;
	border-style: double;
	font-family: 'Do Hyeon', sans-serif;
}

.t {
	border: 1px solid black;
	border-radius: 10px;
}

td {
	margin: 0;
	padding: 0;
}

.replyArea {
	width: 100%;
	margin: auto;
}

#replySelectArea {
	height: 500px;
}

#replyTable {
	width: 100%;
}

#titleArea button {
	float: right;
	font-family: 'Do Hyeon', sans-serif;
}

.detail td {
	text-align: center;
	width: 1000px;
	height: 300px;
}

.detail img {
	width: 310px;
	height: 220px;
}
.replyP1 {
      font-family: 'Do Hyeon', sans-serif;
      font-size:20px;
      margin:auto;
   }
   
   .replyP2 {
      font-family: 'Do Hyeon', sans-serif;
      font-size:13px;
      color:gray;
   }
   
   .replyBtn {
      width:70px;
      height:45px;
   }
</style>
</head>

<body>
	<%@ include file="../../common/menubar.jsp"%>


	<div id="choice1">
		<div class="tag">
			<h1 align="center" style="font-family: 'Black Han Sans', sans-serif; color:black;">축제
				상세 설명</h1>
		</div>
		<br> <br>

		<div id="festival" align="center">

			<img src="<%=request.getContextPath()%>/resources/images/목록.png"
				style="float: right; height: 30px;">
			<div id="titleArea">
				<h2 style="font-family: 'Do Hyeon', sans-serif;">
					<strong><%=b.getbTitle()%></strong>
				</h2>
				<% if(loginUser.getmId().equals("admin")) { %>
				<button type="button" class="btn btn-outline-danger"
					style="width: 100px; height: 35px; margin: 0;"
					onclick="deleteBoard();">삭제하기</button>
				<button type="button" class="btn btn-outline-info"
					style="width: 100px; height: 35px; margin: 0;"
					onclick="updateBoard();">수정하기</button>
				<% } %>
				<br> <br>

			</div>

			<h4 style="font-family: 'Do Hyeon', sans-serif;">
				위치 :
				<%=in.getAddress()%></h4>

			<div
				style="border: 1px solid black; text-align: center; border-radius: 10px; font-family: 'Do Hyeon', sans-serif; width: 80%;">대표사진</div>
			<br>

			<div align="center">
				<img
					src="<%=request.getContextPath()%>/resources/festival_uploadFile/<%=titleImg.getChangeName()%>"
					width="80%" height="800px">
			</div>
			<br>

			<div
				style="border: 1px solid black; text-align: center; border-radius: 10px; width: 80%;">
				<details>
					<summary
						style="margin-top: 30px; font-family: 'Do Hyeon', sans-serif;">
						축제 설명 보기<br> <br>
					</summary>
					<br>
					<p style="font-family: 'Do Hyeon', sans-serif;"><%=b.getbContent()%></p>
				</details>
			</div>

			<br>

			<div id="b" align="center">
				<div id="b1">
					<ul>
						<li>시작일 <br><%=in.getsDay()%></li>
						<li>전화번호 <br><%=in.getTel()%></li>
						<li>주소 <br><%=in.getAddress()%></li>
					</ul>
				</div>

				<div id="b2">
					<ul>
						<li>종료일 <br><%=in.geteDay()%></li>
						<li>홈페이지<br><%=in.getPage()%></li>
						<li>이용요금 <br><%=in.getPrice()%></li>
					</ul>
				</div>
			</div>
			<br>

			<div
				style="border: 1px solid black; text-align: center; border-radius: 10px; font-family: 'Do Hyeon', sans-serif; width: 80%;">내용
				사진</div>
			<table class="detail">
				<tr>
					<%
						for (int i = 1; i < fileList.size(); i++) {
					%>
					<td>
						<div class="detailImgArea">
							<img id="detailImg" class="detailImg"
								src="<%=contextPath%>/resources/festival_uploadFile/<%=fileList.get(i).getChangeName()%>">
						</div>
					</td>
					<%
						}
					%>
				</tr>
			</table>
			
			    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ca88425a9b2838d03cea5da7be46498&libraries=services"></script>
    <div id="map" style="width:800px;height:600px; z-index:0;" ></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ca88425a9b2838d03cea5da7be46498"></script>
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%= in.getAddress() %>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x),
        	content = '<div style="padding:5px;"><%=b.getbTitle()%><br><a href="https://map.kakao.com/link/search/<%=in.getAddress() %>" style="color:blue" text-decoration="none" target="_blank">검색하기</a></div>';

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            position : coords,
            content : content
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
		</div>
		
		

		<hr>



		<div class="replyArea">
			<!-- 댓글 작성하는 부분 -->
			<div class="replyWriterArea">
				<table align="center" id="replyTable">
					<tr>
						<td width="200px" align="center" style="font-family: 'Do Hyeon', sans-serif; font-size:25px;"><span><%=loginUser.getmName() %></span></td>
						<td><textarea rows="2" cols="85" id="replyContent"></textarea>
						<td><button type="button" class="btn btn-outline-info" id="addReply"
								style="font-family: 'Do Hyeon', sans-serif; font-size: 20px; width: 100px; height: 50px;">작성완료</button></td>
						<td><button type="button" class="btn btn-outline-info"
				style="font-family: 'Do Hyeon', sans-serif; font-size: 20px; width: 100px; height: 50px;"
				onclick="returnToList();">목록으로</button></td>
					</tr>
				</table>
			</div>
			
			<div id="replySelectArea">
			<table id="replySelectTable" border="1" align="center">
				<%
					if (rlist != null) {
				%>
				<%
					for (Reply r : rlist) {
				%>
				<tr align="center" id ="replyTr">
               <td width="300px"><p class="replyP1"><%=r.getrWriter()%></p><p class="replyP2">작성일자 : <%=r.getCreateDate()%></p></td>
               <td width="700px"><p class="replyP1"><%=r.getrContent()%></p></td>
               <td width="200px"><button type="button" class="btn btn-outline-danger replyBtn"
                  onclick="deleteReply();">삭제</button><input type="hidden" value="<%=r.getrId() %>" id="deleteBtn"></td>
            </tr>
				<%
					}
				%>
				<%
					}
				%>
			</table>
			</div>
		</div>
	</div>


	<form action="" id="detailForm" method="post">
		<input type="hidden" name="bId" value="<%=b.getbId()%>">
	</form>

	<script>
		function deleteReply(){
			var rId = $("#deleteBtn").val();
			var bId= $("input[name=bId]").val();
			location.href="<%=contextPath%>/deleteReply.fe?rId="+ rId + "&bId="+bId + "&flag=2";
		}
	
		function returnToList(){
			location.href="<%=contextPath%>/festivalall.fe?flag=2";
		}
			
		function updateBoard(){
			$("#detailForm").attr("action", "<%=contextPath%>/updateForm.fe?flag=2");
			$("#detailForm").submit();
		}
			
		function deleteBoard(){
			$("#detailForm").attr("action", "<%=contextPath%>/delete.fe");
			$("#detailForm").submit();
		}
		
		$(function(){
	         $("#addReply").click(function() {
	            var writer =<%=loginUser.getM_seq()%>;
	            var bid =<%=b.getbId()%>;
	            var content = $("#replyContent").val();
	            $.ajax({
	               url : "insertReply.fe",
	               type : "post",
	               dataType : "json",
	               data : {writer : writer,
	                     content : content,
	                     bid : bid},
	               success : function(data) {
	                     var $table = $("#replySelectTable");
	                     $table.html("");
	                     // 새로 받아온 갱신 된 댓글 리스트를 반복문을 통해 table에 추가
	                     for ( var key in data) {
	                        var $tr = $("<tr align='center'>");
	                        var $writerTd = $("<td><p>").text(
	                              data[key].rWriter).css({"font-family": 'Do Hyeon, sans-serif', "font-size":"20px" , "margin":"auto" , "width":"300px"});
	                        var $contentTd = $("<td><p>").text(
	                              data[key].rContent).css({"font-family": 'Do Hyeon, sans-serif', "font-size":"20px" ,"color":"black", "width":"700px"});
	                        var $dateTd = $("<td><p>").text(
	                              data[key].createDate).css({"font-family": 'Do Hyeon, sans-serif', "font-size":"20px" ,"color":"gray", "width":"200px"});
	                        
	                        $tr.append('<td width="300px"><p class="replyP1">'+ data[key].rWriter + '</p><p class="replyP2">작성일자 : ' + data[key].createDate + '</p></td>');
	                        $tr.append('<td width="700px"><p class="replyP1">' + data[key].rContent + '</p></td>');  
	                        $tr.append('<td width="200px"><button type="button" class="btn btn-outline-danger replyBtn" onclick="deleteReply();">삭제</button></td>');
	                        $table.append($tr);
	                     }
	                     // 댓글 작성 부분 리셋
	                     $("#replyContent").val("");
	                  },
	                  error : function() {
	                     console.log("통신 실패!");
	                  }
	               });
	            });
	      });

		
	</script>


	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>