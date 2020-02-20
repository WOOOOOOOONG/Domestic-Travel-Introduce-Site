<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="QA.model.vo.*"%>

<%
	QA q = (QA)request.getAttribute("q");
	String Up = (String)request.getAttribute("Up");
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

.titleDiv {
	border: 1px solid gainsboro;
	width: 100%;
	height: 10%;
	background: rgba(31, 5, 5, 0.075);
	box-sizing: border-box;
}

.note-editable {
	height: 800px;
}

.top1 {
	width: 100%;
	height: 100%;
	box-sizing: border-box;
	margin-top: 1%;
}

.top1 input {
	width: 80%;
	height: 40px;
}

label {
	width: 10%;
	height: 70%;
}

.note-insert, .note-table, .note-view {
	display: none;
}

.top1 select {
	height: 50%;
}

.sub {
	width: 15%;
	height: 5%;
	margin: auto;
	margin-left: 830px;
}
</style>
</head>
<body>
	<% if(Up == null) { %>
	<form action="<%= request.getContextPath() %>/insert.qa" onsubmit="return joinValidate();" method="post">
	<% } else { %>
	<form action="<%= request.getContextPath() %>/update.qa" onsubmit="return joinValidate();" method="post">	
	<% } %>
		<div class="titleDiv">
			<div class="top1">
				<div>
					<label>&nbsp;&nbsp;&nbsp;문의 타입</label> <select name="type">
						<option value="10">글쓰기</option>
						<option value="20">여행지</option>
						<option value="30">숙박</option>
						<option value="40">회원</option>
						<option value="50">시스템</option>
					</select>
				</div> 
				<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목
					&nbsp;&nbsp;&nbsp;</label><input type="text" name="title"> <br>
			</div>
			<input type="text" id="HC" name="content" hidden>
			<input type="text" id="qId" name="qId" hidden>
		</div>
		<div id="summernote">
			<p></p>
		</div>
		<button type="submit" class="sub">작성완료</button>

	</form>
	<script>
    $(document).ready(function() {
        $('#summernote').summernote({
        	callbacks: {
        		onlmageUpload: function(files) {
        			sendFile(files[0]);
        		}
        	}
        });
        
        function sendFile(file) {
        	data = new FormData();
        	data.append("file", file);
        	$.ajax({
        		url: 'GetFile.aspx',
        		data: data,
        		cache: false,
        		type: "POST",
        		contentType: false,
        		processData: false,
        		success: function(url){
        			$("#summernote").summernote('insertImage', url);
        		}
        	});
        }
    });
 

  </script>

	<script>
		$(document).ready(function() {
			
			<% if(q != null) { %>
				$("#qId").val(<%= q.getqId() %>)
    	  		<% if(q.getqContent() != null) { %>
					$(".note-editable").html('<%= q.getqContent() %>')
				<% } %>
				<% if(q.getqTitle() != null) { %>
					$("input[name=title]").val('<%= q.getqTitle() %>')
				<% } %>
			<% } %>
<%-- 			<% if(q.getqType() != 0) { %>
				$("select").
			<% } %> --%>
          $("button").mouseenter(function(){
            $("#HC").val($(".note-editable").html())
            console.log($('#summernote').summernote('code'))
          })
      })
      function joinValidate(){
			if($("input[name=title]").val().length < 1){
				alert('제목을 입력해주세요');
				$("input[name=title]").select();
				return false;
			}
			
			if($(".note-editable").html().length < 10){
				alert("내용을 입력해주세요")
				return false;
			}
			
			return true;
		}
  </script>
</body>
</html>