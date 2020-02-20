<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, board.model.vo.*"%>

<%
 	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	ArrayList<Board> blist = (ArrayList<Board>)request.getAttribute("blist");
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
	width: 1500px;
	height: 1600px;
	margin-left: auto;
	margin-right: auto;
}

#total {
	width: 70%;
	height: 60%;
	background: white;
	box-shadow: 10px 5px 15px 5px gray;
	border-radius: 10px;
	margin: auto;
}

#top {
	width:100%; 
	height:20%;
	border-bottom:1px solid rgba(31, 10, 10, 0.162);
}

#bottom {
	width:100%;
	height:80%;
	border-radius: 10px;

}

.count {
	width: 100%;
	height: 40%;
	margin-right: 20px;

}

.count p {
	width: 50%;
	float: left;
}

#good {
	float: right;
}

#communityTable {

	width: 100%;
	height: 90%;

}

#write {
	width:100%;
	height:40%;
}

#insertBtn {
	border: none;
	background-color: ghostwhite;
	width:40px;
	height:40px;
	float:right;
	margin-right:15px;
}

button {
	font-family: 'Do Hyeon', sans-serif;
}

span, p, input {
	font-family: 'Do Hyeon', sans-serif;
}

.navbar-search {
	width:60%;
	height:100%;
	margin:auto;
}

.btn-outline {
	background-color: transparent;
	color: inherit;
	transition: all .5s;
}

.nav {

	ailgn: center;
	width: 100%;
	height:20%;
	ailgn: center;
}

.form-control {

}

#table {
	width:100%;
	text-align:center;
}
th {
	border-top:1px solid rgba(31, 10, 10, 0.162);
	border-bottom:1px solid rgba(31, 10, 10, 0.162);
}

.ho:hover {
	background:darkgray;
	cursor:pointer;
	color:white
}

</style>
</head>

<body>
	<%@ include file="../../common/menubar.jsp"%>
	<h1
		style="color: black; color: black; margin-top: 120px; margin-left: 40%; font-family: 'Black Han Sans', sans-serif;">커뮤니티게시판</h1>
	<br>
	<br>
	<div id="total">
		<div id="top">
			<div class="nav nav-justified navbar-nav">
				<form class="navbar-form navbar-search"
					action="<%=contextPath%>/search.fe" method="get">
					<input type="hidden" name="flag" value="4">
					<div class="input-group" style="margin-top: 20px;">
						<input type="search" name="search" class="form-control"
							placeholder="검색어 입력">

						<div class="input-group-btn">
							<button type="submit" class="btn btn-search btn-default"
								style="border: 1px solid black;">검색</button>


						</div>
					</div>
				</form>
			</div>
			<script>
				function checkSearchCondition(){
					if($("#searchCondition option:selected").val() == '----'){
						alert("검색할 분야 선택");
						return false;
					}
					return true;
				}
			</script>

			<br>

			<!-- 전체 글수 최신순 인기순 새로고침 -->
			<div class="count">
				<span style="text-align: left; margin-left: 20px;">전체 글 수 :
					<%= listCount %></span>
				<div id="good">
				
				</div>

			</div>
			<%
			if (loginUser != null) {
			%>
			<div id="write">
				<button type="button" id="insertBtn"
					onclick="location.href='<%=contextPath%>/views/board/community/communityInsert.jsp'">
					<img src="<%=contextPath%>/resources/images/edit.png" width="40px"
						height="40px">
				</button>
			</div>
			<%
				}
			%>

		</div>
		<div id="bottom">
			<div id="communityTable">
			<br>
				<table id="table">
					<tr height="50px" style="background:rgba(31, 10, 10, 0.162)">
						<th width="8%">번호</th>
						<th width="50%">제목</th>
						<th width="10%">작성자</th>
						<th width="10%">작성일</th>
						<th colspan="2" width="13%">추천/비추천</th>
						<th width="9%">조회수</th>
					</tr>
					<%  if(blist != null) { %>
						<% for(Board b : blist) { %>
							<tr class="bth ho">
								<th><%=b.getbId() %></th>
								<th><%=b.getbTitle() %></th>
								<th><%=b.getbWriter() %></th>
								<th><%=b.getwDate() %></th>
								<th><%=b.getGood() %></th>
								<th><%=b.getNgood() %></th>
								<th><%=b.getbCount() %></th>
							</tr>
						<% } %>
					<% } %>					
				</table>
			</div>
		
		<!-- 페이징 바 -->
		<div class="pagingArea" align="center">
				<!-- 맨 처음으로 (<<) -->
				<button
					onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=1&flag=4'">
					&lt;&lt;</button>

				<!-- 이전 페이지로 (<) -->
				<%
					if (currentPage == 1) {
				%>
				<button disabled>&lt;</button>
				<%
					} else {
				%>
				<button
					onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=<%=currentPage - 1%>&flag=4'">
					&lt;</button>
				<%
					}
				%>

				<!-- 10개의 페이지 목록 -->
				<%
					for (int p = startPage; p <= endPage; p++) {
				%>
				<%
					if (p == currentPage) {
				%>
				<button disabled>
					<%=p%>
				</button>
				<%
					} else {
				%>
				<button
					onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=<%=p%>&flag=4'"><%=p%></button>
				<%
					}
				%>
				<%
					}
				%>

				<!-- 다음 페이지로 (>) -->
				<%
					if (currentPage == maxPage) {
				%>
				<button disabled>&gt;</button>
				<%
					} else {
				%>
				<button
					onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=<%=currentPage + 1%>&flag=4'">
					&gt;</button>
				<%
					}
				%>

				<!-- 맨 끝으로 (>>) -->
				<button
					onclick="location.href='<%=contextPath%>/festivalall.fe?currentPage=<%=maxPage%>&flag=4'">
					&gt;&gt;</button>
			</div>
		</div>
	</div>

	<script>
		$(function(){
			$(".bth").click(function(){
				var bId =  $(this).children().eq(0).text();
				location.href="<%=contextPath%>/detail.co?bId=" + bId
			});
		});

		$(function() {

			$(".input-group-btn .dropdown-menu li a").click(
					function() {

						var selText = $(this).html();

						$(this).parents('.input-group-btn').find('.btn-search')
								.html(selText);

					});

		});
	</script>


	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
		<br><br><br><br><br><br>
		<%@ include file="../../common/footer.jsp"%>
		
</body>
</html>