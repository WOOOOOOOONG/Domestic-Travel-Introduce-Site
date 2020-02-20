<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, member.model.vo.*, board.model.vo.*"%>
	
<% 
	ArrayList<Member> mList = (ArrayList<Member>)request.getAttribute("mList"); 
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

%>


	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial;
			width:1500px;
			margin-top:10%;
			margin-left:auto;
			margin-right:auto;
        }

    <!-- 영역 분할 -->
    <style>
        /* 헤더 */
        #menubar {
            width: 100%;
            height: 150px;
        }

        #body {
            margin-top: 4%;
            width: 1500px;
            height: 1000px;
            display: flex;
            overflow: auto;
            flex-direction: row;
            margin-left: auto;
            margin-right: auto;
        }

        aside {

            width: 15%;
            height: 100%;
        }

        #marginBody {
            width: 65%;
        }

        #my-info-section1 {
            width: 80%;
            height: 220px;
        }

        /* aside -> my-info-section2 */
        #my-info-section2 {
            width: 80%;
            height: 250px;
        }

        ul a {
            color: black;
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

    <!-- aside->section1 css -->
    <style>
        #my-info {
            width: 100%;
            height: 100%;
            background-color: cornflowerblue;
        }

        .bi-person {
            width: 40px;
            height: 40px;
            float: left;
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
            width: 100%;
            background-color: cornflowerblue;
            color: white;
            font-size: 13px;
            height: 40px;
        }

        #my-info-logout {
            float: left;
        }
    </style>

    <!-- aside->section2 css -->
    <style>
        #my-info-section2 {
            margin-top: 50px;
        }

        aside {
        margin-left: 10%;
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

    <!-- .notice -->
    <style>
            table {
              border-collapse: collapse;
              border-spacing: 0;
            }
        
            .page-title {
              margin-bottom: 60px;
            }
        
            .page-title h3 {
              font-size: 28px;
              color: #333333;
              font-weight: 400;
              text-align: center;
            }
        
            #board-search .search-window {
              padding: 15px 0;
              background-color: #f9f7f9;
            }
        
            #board-search .search-window .search-wrap {
              position: relative;
              /*   padding-right: 124px; */
              margin: 0 auto;
              margin-right:20px;
              width: 70%;
              max-width: 564px;
            }
        
            #board-search .search-window .search-wrap input {
              height: 40px;
              width: 100%;
              font-size: 14px;
              padding: 7px 14px;
              border: 1px solid #ccc;
            }
        
            #board-search .search-window .search-wrap input:focus {
              border-color: #333;
              outline: 0;
              border-width: 1px;
            }
         
            #board-search .search-window .search-wrap .btn {
              position: absolute;
              right: 0;
              top: 0;
              bottom: 0;
              width: 108px;
              padding: 0;
              
              font-size: 16px;
            }
        
            .board-table {
              font-size: 13px;
              width: 100%;
              border-top: 1px solid #ccc;
              border-bottom: 1px solid #ccc;
            }
        
            .board-table a {
              color: #333;
              display: inline-block;
              line-height: 1.4;
              word-break: break-all;
              vertical-align: middle;
            }
        
            .board-table a:hover {
              text-decoration: underline;
            }
        
            .board-table th {
              text-align: center;
            }
        
            .board-table .th-num {
              width: 100px;
              text-align: center;
            }
        
            .board-table .th-date {
              width: 200px;
            }
        
            .board-table th,
            .board-table td {
              padding: 14px 0;
            }
        
            .board-table tbody td {
              border-top: 1px solid #e7e7e7;
              text-align: center;
            }
        
            .board-table tbody th {
              padding-left: 28px;
              padding-right: 14px;
              border-top: 1px solid #e7e7e7;
              text-align: left;
            }
        
            .board-table tbody th p {
              display: none;
            }
        
            .btn {
              display: inline-block;
              padding: 0 30px;
              font-size: 15px;
              font-weight: 400;
              background: transparent;
              text-align: center;
              white-space: nowrap;
              vertical-align: middle;
              -ms-touch-action: manipulation;
              touch-action: manipulation;
              cursor: pointer;
              -webkit-user-select: none;
              -moz-user-select: none;
              -ms-user-select: none;
              user-select: none;
              border: 1px solid transparent;
              text-transform: uppercase;
              -webkit-border-radius: 0;
              -moz-border-radius: 0;
              border-radius: 0;
              -webkit-transition: all 0.3s;
              -moz-transition: all 0.3s;
              -ms-transition: all 0.3s;
              -o-transition: all 0.3s;
              transition: all 0.3s;
            }
        
            .btn-dark {
              background: #555;
              color: #fff;
            }
        
            .btn-dark:hover,
            .btn-dark:focus {
              background: #373737;
              border-color: #373737;
              color: #fff;
            }
        
            .btn-dark {
              background: #555;
              color: #fff;
            }
        
            .btn-dark:hover,
            .btn-dark:focus {
              background: #373737;
              border-color: #373737;
              color: #fff;
            }
        
            /* reset */
        
            * {
              list-style: none;
              text-decoration: none;
              box-sizing: border-box;
            }
        
            .clearfix:after {
              content: '';
              display: block;
              clear: both;
            }
        
            .container {
              width: 1100px;
              margin: 0 auto;
            }
        
            .blind {
              position: absolute;
              overflow: hidden;
              clip: rect(0 0 0 0);
              margin: -1px;
              width: 1px;
              height: 1px;
            }

            .container {
                width: 80%;
            }

            #write {
              margin-left: 85%;
              margin-top: 3%;
            }

            #inquire-type {
              height: 35px;
              margin-top: 2.5%;
              margin-left: 2%;
            }
            
            
            .mTable {
            	width:95%;
            	margin-left:auto;
            	margin-right:auto;
            }
            
            .btn1 {
            	width:95%;
            	height:10%;
            	margin-left:auto;
            	margin-right:auto;
            }
            
            .btn1 button {
            	width:10%;
            	height:50%;
            	float:right;
            	margin-top:1%;
            }
            
          </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<section id="body">
		<aside>
			<section id="my-info-section1">
				<div class="my-info" id="my-info">
					<h3 id="my-info-text">관리자페이지</h3>
					<img src="<%= request.getContextPath() %>/resources/images/smile.jpg"><br>
					<p id="name">&nbsp;&nbsp;&nbsp;관리자</p>
					<br>
					<button class="myinfo-button" id="my-info-logout"
						onclick="logout();">로그아웃</button>
				</div>
				<script>
                	function logout() {
                		location.href="<%= request.getContextPath() %>/logout.me";
                	}
                </script>
			</section>

			<section id="my-info-section2">
				<div id="mypage-menu">
					<ul>
						<li class="bigContent"><a href="#" onclick="location.href='<%= request.getContextPath() %>/select.mo'">회원 관리</a></li>
						<hr>
						<li class="bigContent"><a href="#" onclick="location.href='<%= request.getContextPath() %>/festivalall.fe?flag=4&no=2'">게시글 관리</a></li>
						
						<hr>
						
						<li class="bigContent"><a href="#" onclick="location.href='<%= request.getContextPath() %>/select.qa'">회원 문의 내역</a></li>
					</ul>
				</div>
			</section>
		</aside>

		<section id="marginBody">
			<div class="mTop" align="center" style="height:10%;">
				<br>
				<h2>회원 정보</h3>
			</div>
			<table border="1" class="mTable">
				<tr height="60">
					<th>선택</th>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>생년월일</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>가입일</th>
					<th>최근접속일</th>
					<th>경고횟수</th> 
					<th>STATUS</th>
				</tr>
				<% if(mList != null) {%>
					<% for(Member m : mList) { %>
						<tr height="40">
							<th><input type="checkbox" value="<%= m.getmId()%>" name="mSeq" id="mSeq"></th>
							<th><%= m.getM_seq()%></th>
							<th><%= m.getmName()%></th>
							<th><%= m.getmId()%></th>
							<th><%= m.getNickName()%></th>
							<th><%= m.getmNo()%></th>
							<th><%= m.getPhone() %></th>
							<th><%= m.getEmail()%></th>
							<th><%= m.getJoinDate()%></th>
							<th><%= m.getAccessDate() %></th>
							<th><%= m.getReport() %></th>
							<th><%= m.getStatus() %></th>
						</tr>
					<% } %>
				<% }else { %>
					<th colspan="8">회원 정보가 존재하지 않습니다.</th>
				<% } %>
			</table>
			<div class="btn1"><button type="button" class="deleteM">회원삭제</button></div>
			<div class="pagingArea" align="center">
						<!-- 맨 처음으로 (<<) -->
						<button
							onclick="location.href='<%=contextPath%>/select.mo?currentPage=1'">
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
							onclick="location.href='<%=contextPath%>/select.mo?currentPage=<%=currentPage - 1%>'">
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
							<%=p%></button>
						<%
							} else {
						%>
						<button
							onclick="location.href='<%=contextPath%>/select.mo?currentPage=<%=p%>'">
							<%=p%>
						</button>
						<%
							}
						%>
						<%
							}
						%>

						<!-- 다음 페이지로(>) -->
						<%
							if (currentPage == maxPage) {
						%>
						<button disabled>&gt;</button>
						<%
							} else {
						%>
						<button
							onclick="location.href='<%=contextPath%>/select.mo?currentPage=<%=currentPage + 1%>'">
							&gt;</button>
						<%
							}
						%>

						<!--  맨 끝으로 (>>) -->
						<button
							onclick="location.href='<%=contextPath%>/select.mo?currentPage=<%=maxPage%>'">
							&gt;&gt;</button>

					</div>
		</section>
	</section>
	
	<script>

		
	$(function(){
		$(".deleteM").click(function(){
			var a = $("input:checkbox[name='mSeq']:checked").val()
			console.log(a);
			location.href="<%= request.getContextPath() %>/drop.me?mId=" + a;
		})
	})
	
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>