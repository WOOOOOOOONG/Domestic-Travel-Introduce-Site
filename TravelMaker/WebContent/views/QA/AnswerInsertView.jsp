<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="QA.model.vo.*"%>

<%
	QA q = (QA) request.getAttribute("q");
	System.out.println(q.getAnswer());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Summernote</title>
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
<style>
body {
	width: 1400px;
	height: 1200px; 
	margin-left: auto;
	margin-right: auto;
}

form {
	width: 70%;
	height: 80%;
	margin-left: auto;
	margin-right: auto;

}

.Q {
	width: 100%;
	height: 40%;
}

.A {
	width: 100%;
	height: 60%;
}

.page-title {
	width:100%;
	height:15%;
	text-align:center;
	border: 1px solid rgba(31, 5, 5, 0.158);
	background: rgba(31, 5, 5, 0.158);
}

.page-title h3 {
	width: 100%;
	font-size: 29px;
	color: #333333;
	font-weight: bolder;
	text-align: center;
	line-height: 12px;
}

.title {
	width:100%;
	height:10%;
	border: 1px solid rgba(31, 5, 5, 0.158);
	background: rgba(31, 5, 5, 0.158);
	font-size: 22px;
	line-height: 35px;
}

.content {
	width:100%;
	height:75%;
	border: 1px solid rgba(31, 5, 5, 0.158);
	background: rgba(31, 5, 5, 0.158);
}

.inContent {
	width:97%;
	height:90%;
	margin:auto;
	margin-top:1.5%;
	background:white;
}

.title1 {
	width:100%;
	height:7%;
	border: 1px solid rgba(31, 5, 5, 0.158);
	background: rgba(31, 5, 5, 0.158);
	font-size: 22px;
	line-height: 35px;
}

.content1 {
	width:100%;
	height:93%;
}

.note-editable {
        height:470px;
    }

</style>
</head>
<body>
	<form action="<%=request.getContextPath()%>/insert.an">
		<div class="Q">
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
			<input type="text" name="qId" value="<%= q.getqId() %>" hidden>
			<input type="text" id="HC" name="content" hidden>
		</div>
		<div class="A">
			<div class="title1">&nbsp;&nbsp;&nbsp;&nbsp;답변</div>
			<div class="content1">
				<div id="summernote">
					<p></p>
				</div>
			</div>
		</div>


		<div style="width:100%; height:10%; margin-left:auto; margin-right:auto;">
				<button type="submit" class="sub" style="float:right; margin-top:1%; width:10%; height:50%" onclick="QUpdate()">답변완료</button>
			</div>

	</form>
	<script>
		$(document).ready(function() {
			$('#summernote').summernote();
		});
	</script>

	<script>	
		$(document).ready(function() {
			<% if(q.getAnswer() != null) { %>
			$(".note-editable").html('<%= q.getAnswer() %>')
			<% } %>
			$("button").mouseenter(function() {
				$("#HC").val($(".note-editable").html())
			})
		})
	</script>
</body>
</html>