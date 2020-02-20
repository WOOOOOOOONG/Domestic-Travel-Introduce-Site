<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
    
<%
	Board b = (Board)request.getAttribute("board");
	ArrayList<Reply> rlist = (ArrayList<Reply>) request.getAttribute("rlist");
	String message = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
	body {
		width:1500px;
		height:1800px;
		margin:auto;
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
	
	.board {
		margin-top:8%; 
		padding:1%;
		width:70%;
		height:90%;
		border:1px solid black;
		margin-left:auto;
		margin-right:auto;
	}
	
	.top {
		width:100%;
		height:15%;
	}
	
	.top1 {
		width:100%;
		height:20%;
	}
	
	.top1 button {
		float:left;
		width:80px;
		height:30px; 
		color:red;
		border-radius: 5px;
		font-weight:bolder;
		font-size:15px;
	}
	
	.top1 p {
		float:right;
		margin:0;

	}
	
	.top2 {
		width:100%;
		height:25%;
		background:darkgray;
	}
	
	.title {
		width:100%;
		height:55%;
		text-align:center;
	}
	
	.content {
		width:100%;
		height:65%;
		overflow:scroll;
	}
	
	.reply {
		width:100%;
		height:18%;

		overflow:scroll;
	}
	
	#replySelectArea {
		height: 300px;
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
	
	
	
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp"%>
	<script>
	var msg = "<%= message %>";
	$(function(){
		if(msg != "null"){
			alert(msg);
		}
	});
</script>
 	<div class="board">
 		<div class="top">
 			<div class="top1">
 				<input type="hidden" value="<%=b.getmId() %>">
 				<input type="hidden" value="<%=b.getbId() %>">
 				<% if(b.getmId() != loginUser.getM_seq()) { %>
 				<button type="button" onclick="report()">신고하기</button>
 				<% } %>
 				
 				<p>Travel Maker 커뮤니티 게시판</p>
 			</div>
 			<script>
 				function report() {
 					var mSeq = $(".top1").children().eq(0).val();
 					var bId = $(".top1").children().eq(1).val();
 					location.href="<%=contextPath%>/report.me?mSeq=" + mSeq + "&bId=" + bId;
 				}
 			</script>
 			<table class="top2">
 				<tr>
 					<th width="15%"><%=b.getbWriter() %></th>
 					<th width="55%"><%=b.getwDate() %></th>
 					<th width="9%">조회:<%=b.getbCount() %></th>
 					<th width="7%">추천:<%=b.getGood() %></th>
 					<th width="7%">비추천:<%=b.getNgood() %></th>
 				</tr>
 			</table>
 			
 			<div class="title"><h1><%=b.getbTitle() %></h1></div>
 		</div>
 		<div class="content"><%=b.getbContent() %></div>
 		<hr> 
 		<div class="reply">
 		
 			<!-- 댓글 작성하는 부분 -->
			<div class="replyWriterArea">
				<table align="center" id="replyTable">
					<tr>
						<td width="200px" align="center" style="font-family: 'Do Hyeon', sans-serif; font-size:25px;"><span><%=loginUser.getmName() %></span></td>
						<td><textarea rows="3" cols="85" id="replyContent"></textarea>
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
 	<%if(b.getmId() == loginUser.getM_seq()) { %>
 	<button type="button" onclick="updateBtn()" style="float:right; margin-right:14%; margin-top:1%; width:100px; height:50px;">수정하기</button>
 	<button type="button" onclick="deleteBtn()" style="float:right; margin-top:1%; width:100px; height:50px;">삭제하기</button>
 	<% } %>
 	<form action="" id="detailForm" method="post">
		<input type="hidden" name="bId" value="<%=b.getbId()%>">
	</form>

	<script>
		function deleteReply(){
			var rId = $("#deleteBtn").val();
			var bId= $("input[name=bId]").val();
			location.href="<%=contextPath%>/deleteReply.fe?rId="+ rId + "&bId="+bId + "&flag=4";
		}	
	
		function updateBtn() {
			location.href="<%=contextPath%>/form.co?bId=<%= b.getbId()%>"	
		}
		
		function deleteBtn() {
			location.href="<%=contextPath%>/delete.co?bId=<%= b.getbId()%>&no=10"
		}
	
		function returnToList(){
			location.href="<%=contextPath%>/festivalall.fe?flag=4";
		}
			
		function updateBoard(){
			$("#detailForm").attr("action", "<%=contextPath%>/updateForm.fe");
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
	<br><br><br><br><br>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>