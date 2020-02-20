<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<style>
	* {
		box-sizing: border-box;
	}
    body {
    	width: 100%;
    	height: 900px;
        margin: 0;
        padding: 0;
        font-family: Arial;
    }

    ul{
        margin: 0;
        padding: 0; 
    }
    ul,li{list-style:none;}
  #slide{height:100%;position:relative;overflow:hidden;}
  #slide ul{width:400%;height:100%;transition:1s;}
  #slide ul:after{content:"";display:block;clear:both;}
  #slide li{float:left;width:25%;height:100%;}
  #slide li:nth-child(1){background:#faa;}
  #slide li:nth-child(2){background:#ffa;}
  #slide li:nth-child(3){background:#faF;}
  #slide li:nth-child(4){background:#aaf;}
  #slide li:nth-child(5){background:rgb(36, 36, 102);}
  #slide input{display:none;}
  #slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
  #slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
  #pos1:checked~ul{margin-left:0%;}
  #pos2:checked~ul{margin-left:-100%;}
  #pos3:checked~ul{margin-left:-200%;}
  #pos4:checked~ul{margin-left:-300%;}
  #pos5:checked~ul{margin-left:-400%;}
  #pos1:checked~.pos>label:nth-child(1){background:#666;}
  #pos2:checked~.pos>label:nth-child(2){background:#666;}
  #pos3:checked~.pos>label:nth-child(3){background:#666;}
  #pos4:checked~.pos>label:nth-child(4){background:#666;}
  #pos5:checked~.pos>label:nth-child(5){background:#666;}


	img{

		height:950px;
	}
	.dd {
		width:100%;
		height:100%;
	}

	h1{
		font-size:130px;
		margin-bottom: 30%;
	}

	#logo{
		width:500px;
		height:500px;
	}
	
	.carousel-control-prev, .carousel-control-next {
		height:50%;
		margin-top:auto;
		margin-bottom:auto;	
	}
	
	.d-none {
		top:40%;
		width:70%;
	}
	
	
	@media only screen and (max-width: 1200px){
            .dd h1 {
            font-size: 125px;}
    }
    @media only screen and (max-width: 1150px){
            .dd h1 {
            font-size: 120px;}
    }
    @media only screen and (max-width: 1100px){
            .dd h1 {
            font-size: 115px;}
    }
    @media only screen and (max-width: 1050px){
            .dd h1 {
            font-size: 110px;}
    }
    @media only screen and (max-width: 1000px){
            .dd h1 {
            font-size: 105px;}
    }
    @media only screen and (max-width: 950px){
            .dd h1 {
            font-size: 100px;}
    }
    @media only screen and (max-width: 900px){
            .dd h1 {
            font-size: 95px;}
    }
    @media only screen and (max-width: 850px){
            .dd h1 {
            font-size: 90px;}
    }
    @media only screen and (max-width: 800px){
            .dd h1 {
            font-size: 85px;}
    }
    @media only screen and (max-width: 750px){
            .dd h1 {
            font-size: 80px;}
    }
    @media only screen and (max-width: 700px){
            .dd h1 {
            font-size: 75px;}
    }
    @media only screen and (max-width: 650px){
            .dd h1 {
            font-size: 700px;}
    }
	

    </style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp" %>
	<div class="box">
        <div class="bd-example">
            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="4"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="5"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active dd">
						<img src='<%= request.getContextPath() %>/resources/images/서울2.jpg' class="d-block w-100" alt="..."></a>
                        <div class="carousel-caption d-none d-md-block">

                            <h1>서울 특별시</h1>
                          
						</div>
						
                    </div>
                    <div class="carousel-item dd">
                            <img src='<%= request.getContextPath() %>/resources/images/경기도2.jpg' class="d-block w-100" alt="..."></a>
                        <div class="carousel-caption d-none d-md-block">
                            <h1>경기도</h1>
                          
                        </div>
                    </div>

                  
                    <div class="carousel-item dd">
                            <img src='<%= request.getContextPath() %>/resources/images/강원도.jpg' class="d-block w-100" alt="..."></a>
                        <div class="carousel-caption d-none d-md-block">
                            <h1>강원도</h1>
                          
                        </div>
                    </div>
                    <div class="carousel-item dd">
                        <img src='<%= request.getContextPath() %>/resources/images/충청도11.jpg' class="d-block w-100" alt="..."></a>
                        <div class="carousel-caption d-none d-md-block">
                            <h1>충청도</h1>
                           
                        </div>
					</div>
					
					<div class="carousel-item dd">
                        <img src='<%= request.getContextPath() %>/resources/images/경상도3.jpg' class="d-block w-100" alt="..."></a>
                        <div class="carousel-caption d-none d-md-block">
                            <h1>경상도</h1>
                           
                        </div>
					</div>
					
					<div class="carousel-item dd">
                        <img src='<%= request.getContextPath() %>/resources/images/전라도.jpg' class="d-block w-100" alt="..."></a>
                        <div class="carousel-caption d-none d-md-block">
							
                            <h1>전라도</h1>
                           
                        </div>
                    </div>
				</div>
				


                <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <script>
        <% if(request.getSession().getAttribute("msg") != null) { %>
		alert('<%=request.getSession().getAttribute("msg") %>');
		<% request.getSession().setAttribute("msg", null); %>
	<% } %>
        </script>
    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        
</body>
</html>