<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function idValue(){
		var mId;
		
		if("<%= request.getAttribute("result") %>" == "null"){
			mId = opener.document.Join.mId.value;
		}else{
			mId = "<%= request.getAttribute("mId") %>";
			
			if(<%= request.getAttribute("result") %> == 0){
				document.getElementById("confirm").removeAttribute("disabled");
			}else{
				document.getElementById("confirm").setAttribute("disabled", "disabled");
			}
			
		}
		
		document.getElementById("mId").value = mId;
		
	}
	
	function confirm(){
		if(<%= request.getAttribute("result") %> == 0){
			opener.document.Join.mId.value = document.getElementById("mId").value;
			opener.document.Join.mId.setAttribute("readonly", "readonly");
		}
		
		if(opener != null){
			self.close();
		}
	}
</script>
<title>Insert title here</title>
</head>
<!-- onload를 이용해 idValue() 실행 -->
<body onload="idValue();">
	<b>아이디 중복 체크</b>
	<br>
	<form action="<%= request.getContextPath() %>/idCheck.me" id="idCheckForm" method="post">
		<input type="text" id="mId" name="mId">
		<input type="submit" value="중복확인">
	</form>
	<br>
	<!-- idCheckServlet 만든 뒤 -->
	<%
		if(request.getAttribute("result") != null) {
			int result = (int)request.getAttribute("result");
			
			if(result > 0){
	%>
				이미 사용중인 아이디입니다.
	<% 
			} else {
	%>
				사용 가능한 아이디입니다.
	<%
			}
		}
	%>
	
	<br>
	<br>
	<input type="button" id="cancel" value="취소" onclick="window.close();">
	<input type="button" id="confirm" value="확인" onclick="confirm();" disabled="disabled">
	
</body>
</html>