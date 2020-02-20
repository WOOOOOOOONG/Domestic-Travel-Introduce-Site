<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700);

        footer {
            font-family: Rubik, sans-serif;
            position: absolute;
            font-weight: 400;
            font-size: 15px;
            width:100%;
            height:440px;
            left:0;
        }
        
        .footer-area {
        	position: absolute;
        }

        footer-area ul {
            padding: 0;
            margin: 0
        }

        footer-area li {
            list-style: none
        }

        footer-area a:focus,
        footer-area a:hover {
            text-decoration: none;
            -webkit-transition: .3s ease;
            -o-transition: .3s ease;
            transition: .3s ease
        }

        footer-area a:focus {
            outline: 0
        }

        footer-area img {
            max-width: 100%
        }

        footer-area p {
            font-size: 16px;
            line-height: 30px;
            color: #898b96;
            font-weight: 300
        }

        footer-area h4 {
            font-family: Rubik, sans-serif;
            margin: 0;
            font-weight: 400;
            padding: 0;
            color: #363940
        }

        footer-area a {
            color: #5867dd
        }

        .no-padding {
            padding: 0 !important
        }

        .go_top {
            line-height: 40px;
            cursor: pointer;
            width: 40px;
            background: #5867dd;
            color: #fff;
            position: fixed;
            -webkit-box-shadow: 0 4px 4px rgba(0, 0, 0, .1);
            box-shadow: 0 4px 4px rgba(0, 0, 0, .1);
            -webkit-border-radius: 50%;
            border-radius: 50%;
            right: -webkit-calc((100% - 1140px)/ 2);
            right: calc((100% - 1140px)/ 2);
            z-index: 111;
            bottom: 80px;
            text-align: center
        }

        .go_top span {
            display: inline-block
        }

        .footer-big {
            padding: 35px 0 40px 0
        }

        .footer-big .footer-widget {
            margin-bottom: 0px;
        }

        .footer--light {
            background: #e7e8ed
        }

        .footer-big .footer-menu ul li a,
        .footer-big p,
        .footer-big ul li {
            color: #898b96
        }

        .footer-menu {
            padding-left: 48px
        }

        .footer-menu ul li a {
            font-size: 15px;
            line-height: 32px;
            -webkit-transition: .3s;
            -o-transition: .3s;
            transition: .3s
        }

        .footer-menu ul li a:hover {
            color: #5867dd
        }

        .footer-menu--1 {
            width: 100%
        }

        .footer-widget-title {
            line-height: 42px;
            margin-bottom: 10px;
            font-size: 18px
        }

        .mini-footer {
            background: #192027;
            text-align: center;
            padding: 32px 0
        }

        .mini-footer p {
            margin: 0;
            line-height: 26px;
            font-size: 15px;
            color: #999
        }

        .mini-footer p a {
            color: #5867dd
        }

        .mini-footer p a:hover {
            color: #34bfa3
        }

        .widget-about img {
            display: block;
            margin-bottom: 30px
        }

        .widget-about p {
            font-weight: 400
        }

        .widget-about .contact-details {
            margin: 30px 0 0 0
        }

        .widget-about .contact-details li {
            margin-bottom: 10px
        }

        .widget-about .contact-details li:last-child {
            margin-bottom: 0
        }

        .widget-about .contact-details li span {
            padding-right: 12px
        }

        .widget-about .contact-details li a {
            color: #5867dd
        }

        @media (max-width:991px) {
            .footer-menu {
                padding-left: 0
            }
        }

        #sm1 {
        }

        #sm1, #sm2, #sm3{
            width: 380px;
            height: 270px;
            float: left;
        }

        .img-fluid {
            margin-left: 10px;
            width: 300px;
            height: 120px;
        }

        .logo-about {
            margin-left: 10px;
            margin-top: -30px;
        }
    </style>
</head>

<body>
    <footer class="footer-area footer--light">
        <div class="footer-big">
            <!-- start .container -->
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-12" id="sm1">
                        <div class="footer-widget">
                            <div class="widget-about">
                                <img src="<%= request.getContextPath() %>/resources/images/로고.png" alt="" class="img-fluid">
                                <br>
                                <p class="logo-about">국내 여행지를 소개해드립니다.<br>
                                   원하는 지역과 여행지를 선택하고, 자기만의 계획을 만들어 보세요.
                                </p>
                                <ul class="contact-details" style="margin-top:0">
                                    <li>
                                        <span class="icon-earphones"></span> Call Us:
                                        <a href="tel:344-755-111">010-2824-8934</a>
                                    </li>
                                    <li>
                                        <span class="icon-envelope-open"></span>
                                        <a href="mailto:xzxz3456@naver.com">xzxz3456@naver.com</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Ends: .footer-widget -->
                    </div>
                    <!-- end /.col-md-4 -->
                    <div class="col-md-3 col-sm-4" id="sm2">
                        <div class="footer-widget">
                            <div class="footer-menu footer-menu--1">
                                <h4 class="footer-widget-title">Category</h4>
                                <ul>
                                    <li>
                                        <a href="<%= request.getContextPath() %>">Home</a>
                                    </li>
                                    <li>
                                    	<a href="<%= request.getContextPath() %>">Travel</a>
                                    </li>
                                    <li>
                                        <a href="<%= request.getContextPath() %>/views/board/festival/festivalAllList.jsp">Festival</a>
                                    </li>
                                    <li>
                                        <a href="<%= request.getContextPath() %>/views/Sleep/SleepAll.jsp">Stay</a>
                                    </li>
                                    <li>
                                        <a href="<%= request.getContextPath() %>/views/board/community/communityAllList.jsp">Community</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- end /.footer-menu -->
                        </div>
                        <!-- Ends: .footer-widget -->
                    </div>
                    <!-- end /.col-md-3 -->

                    <div class="col-md-3 col-sm-4" id="sm3">
                        <div class="footer-widget">
                            <div class="footer-menu">
                                <h4 class="footer-widget-title">My Page</h4>
                                <ul>
                                    <li>
                                        <a href="<%= request.getContextPath() %>/views/myPage/Plan.jsp">Plan</a>
                                    </li>
                                    <li>
                                        <a href="<%= request.getContextPath() %>/views/myPage/Board.jsp">Post</a>
                                    </li>
                                    <li>
                                        <a href="<%= request.getContextPath() %>/views/myPage/Basket.jsp">Basket</a>
                                    </li>
                                    <li>
                                        <a href="<%= request.getContextPath() %>/views/myPage/Info-update.jsp">Information Modify</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- end /.footer-menu -->
                        </div>
                        <!-- Ends: .footer-widget -->
                    </div>
                    <!-- end /.col-lg-3 -->

                    <div class="col-md-3 col-sm-4" id="sm4" style="padding-top:1px;">
                        <div class="footer-widget">
                            <div class="footer-menu no-padding">
                                <h4 class="footer-widget-title">Help Support</h4>
                                <ul>
                                    <li>
                                        <a href="#">Support Forum</a>
                                    </li>
                                    <li>
                                        <a href="#">Terms &amp; Conditions</a>
                                    </li>
                                    <li>
                                        <a href="#">Support Policy</a>
                                    </li>
                                    <li>
                                        <a href="#">Refund Policy</a>
                                    </li>
                                    <li>
                                        <a href="#">FAQs</a>
                                    </li>
                                    <li>
                                        <a href="#">Contact Us</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- end /.footer-menu -->
                        </div>
                        <!-- Ends: .footer-widget -->
                    </div>
                    <!-- Ends: .col-lg-3 -->

                </div>
                <!-- end /.row -->
            </div>
            <!-- end /.container -->
        </div>
        <!-- end /.footer-big -->
        <div class="mini-footer">
                <div class="container">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="copyright-text">
                        <p>© 2018
                          <a href="#">DigiPro</a>. All rights reserved. Created by
                          <a href="#">AazzTech</a>
                        </p>
                      </div>
            
                      <!-- <div class="go_top">
                        <span class="icon-arrow-up"></span>
                      </div> -->
                    </div>
                  </div>
                </div>
              </div>
    </footer>
</body>

</html>