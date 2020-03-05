# TravelMaker
Travel Maker는 KH 정보교육원생 4인으로 이루어진 세미 프로젝트로써, 최근 여행에 관한 관심이 부쩍 늘어난 만큼 더 쉽게 계획을 세우고
여행을 온전히 즐길 수 있도록 대한민국 곳곳 멋진 여행지들을 추천하고 주변 숙소까지 보기 쉽게 제공하고자 하는 목적으로 이루어진 사이트입니다.

## 개발 환경
* Programming Language    
Java
* DB  
Oracle 11g
* Web  
HTML5, CSS6, Javascript, jQuery
* Server  
Tomcat 8.5, JSP/Servlet

## 주요 기능
* 회원가입/로그인
* 마이페이지
* 일정 관리
* 여행지 list
* 숙박업체 list
* 숙박 결제 시스템
* 게시판
* 관리자 및 문의 페이지

## DB 설계
<div>
  <img width="100%" height="500" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FbQnR5q%2FbtqCrjXQPco%2F6iZf2FnONwKlVn3UTNHwiK%2Fimg.png">  
</div>

## 담당 역할
<div>
  <img align="left" width="410" height="400" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2Fb5GrRF%2FbtqCu0b7KzD%2FOTDk4pxtoCuPdVrcixE0Pk%2Fimg.png">
  <b align="right">회원가입</b>
  회원 가입을 위해 저장될 값들을 받아오고, 추가적인 기능으로 아이디 중복확인, 비밀번호를 비롯한 모든 내용에 정규화, 이메일 인증, 잘못 기입하거나 기입하지 않은 내용이 있을 경우 '가입하기'버튼이 눌리지 않는 내용에 대한 처리
</div>
   
<div>
  <img align="left" width="410" height="400" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FLm7TV%2FbtqCsHqu4NN%2FKgAUkXsLSvXHwa2GqoOaI1%2Fimg.png">
  <b>ID/PWD 찾기</b>
  ID 또는 Password를 잊은 사용자를 위한 ID/PWD 찾기 페이지로, DB에 저장되어 있는 사용자의 정보와 일치한다면 계정에 대한 정보를 알려주도록 구현.  
</div>  
  
<div>
  <img align="left" width="410" height="400" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FbFHlcF%2FbtqCtW1Zm81%2FDpvKWicogmT9j3yNT7hbbk%2Fimg.png">
  <b style="text-align:center;">Login</b>
  기입된 사용자의 ID 및 Password가 DB에 저장되어 있는 회원 정보와 일치한다면, 로그인이 정상적으로 처리되고 메인 페이지로 이동하도록 구현  
</div>  
  
<div>
  <img align="left" width="410" height="400" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2Fbrmqut%2FbtqCynKSAjH%2Ft2iGwi8Mt983LLiZK8eXjK%2Fimg.png">
  <b style="text-align:center;">MyPage</b>
  좌측 : 회원별 프로필 사진과 별명을 화면에 보여주고, 클릭을 통한 프로필 사진 교체 기능  
         로그아웃/회원정보 수정/내가 쓴 게시글 확인 등 홈페이지 내 사용자의 활동 내역 확인  
  중앙 : Google의 FullCalendar를 사용하여 일정을 나타내고, DB와 연동하여 저장된 여행 계획을 불러와 사용자에게 보여준다.  
</div>  
