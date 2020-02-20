<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>마이페이지</title>

    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<style>
		#mypage-menu li {
			
		}
		
		.page {
			cursor:pointer;
		}
		
		.no {
			user-select:none;
		}
	</style>
	
    <!-- 메뉴바 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="external.css">
    <style>
        body {
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
        @media(max-width:820px) {
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
            height: 800px;
            display: flex;
            overflow: auto;
            flex-direction: row;
            margin-left: auto;
            margin-right: auto;
        }

        aside {
            margin-left: 5%;
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
            height: 460px;
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
            width: 50%;
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
            .notice table {
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
            
            #profile {
			cursor:pointer;
		}
          </style>
</head>

<body>
	<%@ include file="../common/menubar.jsp" %>
    <section id="body">
        <aside>
            <section id="my-info-section1">
                <div class="my-info" id="my-info">
                    <h3 id="my-info-text">
                        마이페이지</h3>
                    <img onclick="profileUpdate();" id="profile"
						src="<%= request.getContextPath() %>/resources/myplan_upload/<%= loginUser.getProfile() %>"><br>
                    <p id="name">&nbsp;&nbsp;&nbsp;<%= loginUser.getmName() %></p>
                    <br><br>
                    <button class="myinfo-button" id="my-info-logout" onclick="logout();">로그아웃</button>
                    <button class="myinfo-button" id="my-info-modify" onclick="infoModify();">회원정보 수정</button>
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
								쓴 게시글</a></li>
						<hr>
						<li class="bigContent no">개인정보 관리</li>
						<li><a class="page"
							onclick="location.href='<%= request.getContextPath() %>/views/myPage/Info-update.jsp';">회원정보
								수정</a></li>
						<hr>
						<li class="bigContent no">고객센터</li>
						<li style="font-weight: bold"><a class="page"
							onclick="location.href='<%= request.getContextPath() %>/select.qa?mSeq=' + <%= loginUser.getM_seq()%>">문의
								내역</a></li>
                    </ul>
                </div>
            </section>
        </aside>

        <section id="marginBody">

            <section class="notice">
                    <div class="page-title">
                      <div class="container">
                        <h3>문의내역</h3>
                      </div>
                    </div>

                    <!-- board search area -->
                    <div id="board-search">
                      <div class="container">
                          <select id="inquire-type" style="float:left;">
                              <option value="여행지" selected>여행지</option>
                              <option value="숙박">숙박</option>
                              <option value="회원">회원</option>
                              <option value="시스템">시스템</option>
                            </select>
                        <div class="search-window">
                          <form action="">
                            <div class="search-wrap">
                              <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                              <button type="submit" class="btn btn-dark">검색</button>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                
                    <!-- board list area -->
                    <div id="board-list">
                      <div class="container">
                        <table class="board-table">
                          <thead>
                            <tr>
                              <th scope="col" class="th-num">번호</th>
                              <th scope="col" class="th-title">제목</th>
                              <th scope="col" class="th-date">등록일</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>1</td>
                              <th>
                                <a href="#!">안녕하세요. 서비스 이용에 문제가 있어 문의 드립니다.</a>
                                <p>테스트</p>
                              </th>
                              <td>2017.07.13</td>
                            </tr>
                
                            <tr>
                              <td>2</td>
                              <th><a href="#!">왜 답장 안주세요 ?</a></th>
                              <td>2017.06.15</td>
                            </tr>
                
                            <tr>
                              <td>3</td>
                              <th><a href="#!">벌써 세 번째 문의입니다. 지긋지긋하네요..</a></th>
                              <td>2017.06.15</td>
                            </tr>
                          </tbody>
                        </table>
                        <button type="submit" class="btn btn-dark" id="write">글쓰기</button>
                      </div>
                    </div>
            </section>
        </section>
    </section>
    <%@ include file="../common/footer.jsp" %>
</body>

</html>