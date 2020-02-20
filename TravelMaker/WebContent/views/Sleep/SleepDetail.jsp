<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.* ,sleep.model.vo.*, member.model.vo.*"%>


 

<%
	Sleep s = (Sleep) request.getAttribute("sleep");;

	ArrayList<Attachment> fileList = (ArrayList<Attachment>) request.getAttribute("fileList");
	Member m = (Member) request.getAttribute("member");
	ArrayList<Room> RList = (ArrayList<Room>) request.getAttribute("RList");
	System.out.println(fileList);
	System.out.println(s);
	System.out.println(RList);
%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/views/Sleep/swiper-4.5.1/dist/css/swiper.min.css">

<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="external.css">
<style>
body {
	width: 1500px;
	height: 2000px;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
}

.total{
	width:1300px;
	height:1500px;
	margin-left:0;
	margin-right:auto;
}

#div1 {
	float:left;
	width: 75%;
	height: 600px;
	margin-left: 0;
	margin-top: 120px;
	box-sizing: border-box;
	z-index: 10;
}

#div2 {
	float: left;
	width: 20%;
	height: 600px;
	margin-top: 120px;
	box-sizing: border-box;
}

#head {
	width: 100%;
	height: 15%;
}

.swiper-container {
	width: 100%;
	height: 300px;
	margin-left: 30%;
	margin-top: 2%;
}

.swiper-slide {
	background-size: cover;
	background-position: left;
}

.gallery-top {
	height: 60%;
	width: 70%;
}

.gallery-thumbs {
	height: 20%;
	width: 70%;
	box-sizing: border-box;
	padding: 5px 0;
}

.gallery-thumbs .swiper-slide {
	height: 100%;
	opacity: 0.4;
}

.gallery-thumbs .swiper-slide-thumb-active {
	opacity: 1;
}

.badge {
	float: left;
	font-size: 30px;
	margin-top: 2%;
}

.sub {
	font-size: 20px;
	margin-top: 10%;
}

.badge1 {
	float: left;
	font-size: 20px;
	margin-top: 20px;
}

.sub3 {
	width: 70%;
	height: 340px;
	border: 1px solid white;
	margin-left: 300px;
	margin-top:40px;
	border: 1px solid rgb(235, 223, 223);
	border-radius: 6px;
	float:left;
}

#subimg {
	width: 40%;
	height: 260px;
	margin-left: 3%;
	margin-top: 2%;
	box-sizing: border-box;
	float: left;
}

#subimg1 {
	width: 50%;
	margin-left: 50%;
}

#subimg2 {
	widows: 50%;
	margin-left: 47%;
}

.last {
	width: 100%;
	height: 40%;
	background: rgb(248, 235, 235);
	text-align: center;
}

#over {
	line-height: 40px;
	padding: 12px 30px;
	text-decoration: none;
	text-transform: uppercase;
	font-size: 30px;
	font-weight: bold;
	z-index: 1;
	color: gray;
}

#over:hover {
	background: rgb(241, 56, 56);
	border-radius: 5px;
	text-decoration: none;
	color: white;
}

#over.active {
	background: rgb(241, 56, 56);
	color: rgb(241, 56, 56);
	border-radius: 6px;
}

.tab {
	float: left;
	clear: both;
	overflow: hidden;
	margin-left:200px;
}

.tab button {
	float: left;
	width: 200px;
	height: 48px;
	border: none;
	border-bottom: 2px solid #fff;
	background: none;
	font-size: 14px;
}

.tab button:nth-child(0) {
	float: left;
	width: 200px;
	height: 48px;
	border: none;
	border-bottom: 2px solid #fff;
	background: none;
	font-size: 14px;
}

.tab .on {
	float: left;


	font-weight: bold;
	color: rgb(230, 28, 81);
}

.sub2 {
	float:left;
	margin-left:100px;;
	width:100%;
	height: 100px;
}
.deleteBtn{
	float:right;
}
</style>
</head>
<body>

	<%@ include file="../../views/common/menubar.jsp"%>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
		crossorigin="anonymous">
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<!-- Swiper -->
	<div class="total">
		<div id="div1" style="width:70%;">

			<div class="swiper-container gallery-top">

				<div class="swiper-wrapper">
					<div class="swiper-slide"
						style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(0).getChangeName()%>')"></div>
					<div class="swiper-slide"
						style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(1).getChangeName()%>')"></div>
					<div class="swiper-slide"
					<%-- 	style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(1).getChangeName()%>')"></div>
					<div class="swiper-slide" --%>
						style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(2).getChangeName()%>')"></div>
					<div class="swiper-slide"
						style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(3).getChangeName()%>')"></div>
					<div class="swiper-slide"
						style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(4).getChangeName()%>')"></div>
					<div class="swiper-slide"
						style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(5).getChangeName()%>')"></div>

				</div>
				<!-- Add Arrows -->
				<div class="swiper-button-next swiper-button-white"></div>
				<div class="swiper-button-prev swiper-button-white"></div>
			</div>
			<div class="swiper-container gallery-thumbs">
				<div class="swiper-wrapper">
					<div class="swiper-slide"
						style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(0).getChangeName()%>')"></div>
					<div class="swiper-slide"
						style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(1).getChangeName()%>')"></div>
					<div class="swiper-slide"
						style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(2).getChangeName()%>')"></div>
					<div class="swiper-slide"
						style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(3).getChangeName()%>')"></div>
					<div class="swiper-slide"
						style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(4).getChangeName()%>')"></div>
					<div class="swiper-slide"
						style="background-image:url('<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(5).getChangeName()%>')"></div>
				</div>
			</div>

		</div>

		<div id="div2" style="witdh:30%;">

			<div class="badge1">
				<span class="build_badge"
					style="color: rgba(255, 255, 255, 1); background-color: rgb(230, 68, 27); font-size: 35px; margin-left: 50px;"><%=s.getsName()%></span>
			</div>

			<h2 style="margin-top: 30px;">
				(<%=s.getEnName()%>)
				
				
			</h2>

			<h3 class="sub" style="margin-left: 50px;">
				위치 :
				<%=s.getAddress()%>
				
				
				</h3>

		</div>




		<div class="sub2">

			<div class="tab">
				<button id="hide1" onclick="hide1(1);" class="on">
					<span>객실안내/예약</span>
				</button>
				<button id="hide2" onclick="hide2(2);" class="on">
					<span>숙소정보</span>
				</button>
			</div>
			<div class="deleteBtn">
			<% if(loginUser.getmId().equals("admin")) { %>
				<button type="button" class="btn btn-outline-danger" onclick="deleteSleep();" style="float: right; margin-right:200px;">삭제하기</button>
			<% } %>
			</div>

		</div>
		<br> <br>



		<div id="subtotal">
			<%
				for (int i = 0; i < RList.size(); i++) {
			%>
			<div class="sub3">
				<img id="subimg"
					src="<%=contextPath%>/resources/sleep_uploadFile/<%=fileList.get(i + 6).getChangeName()%>">
				<div id="subimg1" style="font-size: 30px;">
					<%=RList.get(i).getrContent()%>
					<hr>
				</div>
				<br> <br>
				<div id="subimg2" style="font-size: 25px; margin-left: 50%;">
					가격
					<div style="text-align: right; font-size: 20px;">
						<strong><%=RList.get(i).getPrice()%>~원</strong>
					</div>
					<br>
					<form action="<%=contextPath%>/reser.re" method="post">
						<input type="hidden" name="sId" value="<%=s.getsId()%>">
						<input type="hidden" name="rId"  value="<%=RList.get(i).getrId()%>">
						<input type="hidden" name="rContent"
							value="<%=RList.get(i).getrContent()%>"> <input
							type="hidden" name="price" value="<%=RList.get(i).getPrice()%>">
						<button
							style="background: rgb(235, 60, 60); color: white; text-align: center; border-radius: 4px; width: 100%; height: 40px;">
							<a style="font-size: 25px;">예약</a>
						</button>
					</form>
				</div>
			</div>
			<%
				}
			%>
			
		</div>

	
	<div id="subtotal2" style="display:none; float:left; width:700px; margin-left:300px; margin-top:100px;">
		<h3><%= s.getsContent() %></h1>
	
	</div>
	
	</div>


	<form action="" id="detailForm" method="post">
      <input type="hidden" name="sId" value="<%= s.getsId()%>">
   </form>


	<br>
	<br>
	<br>




	<!-- Swiper JS -->
	<script
		src="<%=request.getContextPath()%>/views/Sleep/swiper-4.5.1/dist/js/swiper.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var galleryThumbs = new Swiper('.gallery-thumbs', {
			spaceBetween : 10,
			slidesPerView : 4,
			loop : true,
			freeMode : true,
			loopedSlides : 5, //looped slides should be the same
			watchSlidesVisibility : true,
			watchSlidesProgress : true,
		});
		var galleryTop = new Swiper('.gallery-top', {
			spaceBetween : 10,
			loop : true,
			loopedSlides : 5, //looped slides should be the same
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			thumbs : {
				swiper : galleryThumbs,
			},
		});

		function deleteSleep(){
			$("#detailForm").attr("action", "<%=contextPath%>/delete.sl");
	         $("#detailForm").submit();
		}
		
		function hide1(target){
       	 $('#subtotal').css("display","unset");
       	$('#subtotal2').css("display","none");
       }
		
		function hide2(target){
			$('#subtotal').css("display","none");
			$('#subtotal2').css("display","unset");
	       }
	
		
		/* .tab button:nth-child(2) {
	float: left;
	width: 200px;
	height: 48px;
	border: none;
	border-bottom: 2px solid #fff;
	background: none;
	font-size: 14px;
} */
		
	</script>

</body>
</html>