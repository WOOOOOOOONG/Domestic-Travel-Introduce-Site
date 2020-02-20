<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
   <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
.outer { 
   width: 1500px;
   height: 3000px;
   background: white;
   margin: auto;
   margin-top: 150px;
}

 

.insertArea {
   width: 1000px;
   height: 2800px   ;
   margin: auto;
   background:ghostwhite;
	border:1px solid gray;
   border-radius:10px;
   float
}

#titleImgArea {
   width: 350px;
   height: 200px;
   border: 2px dashed darkgray;
   text-align: center;
   display: table-cell;
   vertical-align: middle;
}

#contentImgArea1, #contentImgArea2, #contentImgArea3, #contentImgArea4, #contentImgArea5, #contentImgArea6,
#contentImgArea7,#contentImgArea8,#contentImgArea9,#contentImgArea10,#contentImgArea11,#contentImgArea12,
#contentImgArea13,#contentImgArea14,#contentImgArea15,#contentImgArea16,#contentImgArea17,#contentImgArea18,
#contentImgArea19,#contentImgArea20{
   width: 150px;
   height: 100px;
   border: 2px dashed darkgray;
   text-align: center;
   display: table-cell;
   vertical-align: middle;
}

#titleImgArea:hover, #contentImgArea1:hover, #contentImgArea2:hover,
   #contentImgArea3:hover,#contentImgArea4:hover,#contentImgArea5:hover,#contentImgArea6:hover,#contentImgArea7:hover,
   #contentImgArea8:hover,#contentImgArea9:hover,#contentImgArea10:hover,#contentImgArea11:hover,#contentImgArea12:hover,
   #contentImgArea13:hover,#contentImgArea14:hover,#contentImgArea15:hover,#contentImgArea16:hover,#contentImgArea17:hover,
   #contentImgArea18:hover,#contentImgArea19:hover,#contentImgArea20:hover{
   cursor: pointer;
}

.btnArea {
   width: 250px;
   margin: auto;
}

button {
   height: 35px;
   width: 100px;
   background: black;
   border: black;
   color: white;
   border-radius: 5px;
   font-size:20px;
}

button:hover {
   cursor: pointer;
}


td{
   font-size:16px;
}
label{
   font-size:16px;
   font-family: 'Do Hyeon', sans-serif;
}



</style>
</head>
<body>
   <%@ include file="../../views/common/menubar.jsp" %>

   <div class="outer">
      <br>
      <h1 align="center" style="font-family: 'Do Hyeon', sans-serif;">숙박 작성</h1>

      <!-- 파일 업로드를 위해서는 enctype을 지정해줘야 함 -->
      <form action="<%= contextPath %>/insert.sl" method="post"
         enctype="multipart/form-data"> 
         <div class="insertArea">
            <table align="center">
               <br>
               <tr>
                  <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">숙박 이름 </td>
                  <td>
                  <input name="sName"><br>
                  </td>
               </tr>
               <tr>
                <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">영어 이름 </td>
                  <td>
                  <input name="enName">
               </tr>
               
               <tr>
               <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">주소</td>
                  <td colspan="3"><textarea name="address" rows="3" cols="60"
                        style="resize: none;"></textarea></td>
               </tr>
                 <tr>
                  <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">숙박 타입</td>
                  <td colspan="3"><select name="sType">
                     <option>----</option>
                     <option value=1>호텔</option>
                     <option value=2>모텔</option>
                     <option value=3>펜션</option>
                  </select></td>
                  </tr>
               <tr>
                  <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">지역</td>
                  <td colspan="3"><select name="lCode">
                     <option>----</option>
                     <option value=10>서울특별시</option>
                     <option value=20>경기도</option>
                     <option value=30>강원도</option>
                     <option value=40>충청도</option>
                     <option value=50>경상도</option>
                     <option value=60>전라도</option>
                  </select></td>
               </tr>
               
               <tr>
                  <td style="font-family: 'Do Hyeon', sans-serif;">메인 이미지</td>
                  <td colspan="3">
                     <div id="titleImgArea">
                        <img id="titleImg" width="755" height="400">
                     </div>
                  </td>
               </tr>

               <tr>
                  <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">객실 정보</td>
                  <td colspan="3"><textarea name="sContent" rows="7" cols="104"
                        style="resize: none;"></textarea></td>
                  
                      
               </tr>
               <tr>
         <td width="100px" name="price" style="font-family: 'Do Hyeon', sans-serif; ">가격</td>
                  <td colspan="3"><textarea name="price" rows="1" cols="15"
                        style="resize: none;"></textarea></td></tr>
					<br><br><br><br><br>
               
                              

               <tr>
                  <td style="font-family: 'Do Hyeon', sans-serif;">객실 사진</td>
                  <td>
                     <div id="contentImgArea1">
                        <img id="contentImg1" width="245" height="150">
                     </div>
                  </td>
                  <td>
                     <div id="contentImgArea2">
                        <img id="contentImg2" width="245" height="150">
                     </div>
                  </td>
                  <td>
                     <div id="contentImgArea3">
                        <img id="contentImg3" width="245" height="150">
                     </div>
                  </td>
                </tr>
                <tr>
                
                
                <td></td>
                  <td>
                     <div id="contentImgArea4">
                        <img id="contentImg4" width="245" height="150">
                     </div>
                  </td>
                  <td>
                     <div id="contentImgArea5">
                        <img id="contentImg5" width="245" height="150">
                     </div>
                  </td>
                  <td>
                     <div id="contentImgArea6">
                        <img id="contentImg6" width="245" height="150">
                     </div>
                  </td>
                
               </tr>
               </tr>
               
                     <tr>
                  <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">객실 내용</td>
                  <td colspan="3"><textarea name="scontent" rows="7" cols="104"
                        style="resize: none;"></textarea></td>
               </tr>

            </table>

            <!-- 파일 업로드 하는 부분 -->
            <div id="fileArea">
               <input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="LoadImg(this,1)"> 
               <input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="LoadImg(this,2)">
               <input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="LoadImg(this,3)"> 
               <input type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="LoadImg(this,4)">
               <input type="file" id="thumbnailImg5" name="thumbnailImg5" onchange="LoadImg(this,5)">
               <input type="file" id="thumbnailImg6" name="thumbnailImg6" onchange="LoadImg(this,6)">
               <input type="file" id="thumbnailImg7" name="thumbnailImg7" onchange="LoadImg(this,7)">
               <input type="file" id="thumbnailImg8" name="thumbnailImg8" onchange="LoadImg(this,8)">
               <input type="file" id="thumbnailImg9" name="thumbnailImg9" onchange="LoadImg(this,9)">
               <input type="file" id="thumbnailImg10" name="thumbnailImg10" onchange="LoadImg(this,10)">
               <input type="file" id="thumbnailImg11" name="thumbnailImg11" onchange="LoadImg(this,11)">
               <input type="file" id="thumbnailImg12" name="thumbnailImg12" onchange="LoadImg(this,12)">
               <input type="file" id="thumbnailImg13" name="thumbnailImg13" onchange="LoadImg(this,13)">
               <input type="file" id="thumbnailImg14" name="thumbnailImg14" onchange="LoadImg(this,14)">
               <input type="file" id="thumbnailImg15" name="thumbnailImg15" onchange="LoadImg(this,15)">
               <input type="file" id="thumbnailImg16" name="thumbnailImg16" onchange="LoadImg(this,16)">
               <input type="file" id="thumbnailImg17" name="thumbnailImg17" onchange="LoadImg(this,17)">
               <input type="file" id="thumbnailImg18" name="thumbnailImg18" onchange="LoadImg(this,18)">
               <input type="file" id="thumbnailImg19" name="thumbnailImg19" onchange="LoadImg(this,19)">
               
                                       
            </div>
            <br><br>

            <div align="center" id="detailArea">
            <table>
               <tr>
                  <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">객실 타입 사진1</td>
                  <td>
                     <div id="contentImgArea7">
                        <img id="contentImg7" width="245" height="150">
                     </div>
                  </td>
                  
               </tr>
               <br>
               
                  <tr>
                  <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">객실 타입 이름1</td>
                  <td colspan="3"><textarea name="rContent1" rows="3" cols="104"
                        style="resize: none;"></textarea></td>
                        
               </tr>
               <tr>
                <td width="100px" name="price" style="font-family: 'Do Hyeon', sans-serif; ">가격1</td>
                  <td colspan="3"><textarea name="price1" rows="1" cols="15"
                        style="resize: none;"></textarea></td>
                        </tr>
               
                
                <tr>
               
            </table>
            
               
            </div>
            <br><br><br><br><br>
            
            
              <div align="center" id="detailArea">
            <table>
               <tr>
                  <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">객실 타입 사진2</td>
                  <td>
                     <div id="contentImgArea11">
                        <img id="contentImg11" width="245" height="150">
                     </div>
                  </td>
                  
               </tr>
               <br>
               
                  <tr>
                  <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">객실 타입 이름2</td>
                  <td colspan="3"><textarea name="rContent2" rows="3" cols="104"
                        style="resize: none;"></textarea></td>
                        
               </tr>
               <tr>
                <td width="100px" name="price" style="font-family: 'Do Hyeon', sans-serif; ">가격2</td>
                  <td colspan="3"><textarea name="price2" rows="1" cols="15"
                        style="resize: none;"></textarea></td>
                        </tr>
               
                
               
            </table>
            
               
            </div>
            <br><br><br><br><br>
            
              <div align="center" id="detailArea">
            <table>
               <tr>
                  <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">객실 타입 사진3</td>
                  <td>
                     <div id="contentImgArea15">
                        <img id="contentImg15" width="245" height="150">
                     </div>
                  </td>
                  
               </tr>
               <br>
               
                  <tr>
                  <td width="100px" style="font-family: 'Do Hyeon', sans-serif;">객실 타입 이름3</td>
                  <td colspan="3"><textarea name="rContent3" rows="3" cols="104"
                        style="resize: none;"></textarea></td>
                        
               </tr>
               <tr>
                <td width="100px" name="price" style="font-family: 'Do Hyeon', sans-serif; ">가격3</td>
                  <td colspan="3"><textarea name="price3" rows="1" cols="15"
                        style="resize: none;"></textarea></td>
                        </tr>
               
                <tr>
               
            </table>
            
               
            </div>
            
            

            <script>
               // 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
               $(function() {
                  $("#fileArea").hide();

                  $("#titleImgArea").click(function() {
                     $("#thumbnailImg1").click();
                  });

                  $("#contentImgArea1").click(function() {
                     $("#thumbnailImg2").click();
                  });

                  $("#contentImgArea2").click(function() {
                     $("#thumbnailImg3").click();
                  });

                  $("#contentImgArea3").click(function() {
                     $("#thumbnailImg4").click();
                  });
                  
                  $("#contentImgArea4").click(function() {
                      $("#thumbnailImg5").click();
                   });
                  
                  $("#contentImgArea5").click(function() {
                      $("#thumbnailImg6").click();
                   });
                  
                  $("#contentImgArea6").click(function() {
                      $("#thumbnailImg7").click();
                   });
                  
                  $("#contentImgArea7").click(function() {
                      $("#thumbnailImg8").click();
                   });
                  
                  $("#contentImgArea8").click(function() {
                      $("#thumbnailImg9").click();
                   });
                  
                  $("#contentImgArea9").click(function() {
                      $("#thumbnailImg10").click();
                   });
                  
                  $("#contentImgArea10").click(function() {
                      $("#thumbnailImg11").click();
                   });
                  
                  $("#contentImgArea11").click(function() {
                      $("#thumbnailImg12").click();
                   });
                  
                  $("#contentImgArea12").click(function() {
                      $("#thumbnailImg13").click();
                   });
                  
                  $("#contentImgArea13").click(function() {
                      $("#thumbnailImg14").click();
                   });
                  
                  $("#contentImgArea14").click(function() {
                      $("#thumbnailImg15").click();
                   });
                  
                  $("#contentImgArea15").click(function() {
                      $("#thumbnailImg16").click();
                   });
                  
                  $("#contentImgArea16").click(function() {
                      $("#thumbnailImg17").click();
                   });
                  
                  $("#contentImgArea17").click(function() {
                      $("#thumbnailImg18").click();
                   });
                  
                  $("#contentImgArea18").click(function() {
                      $("#thumbnailImg19").click();
                   });
                  
                  $("#contentImgArea19").click(function() {
                      $("#thumbnailImg20").click();
                   });
                 
               });

               // 파일 첨부 했을 때 미리보기 공간에 미리보기가 가능하게 하는 함수
               function LoadImg(value, num) {
                  // value => input type="file"
                  // num => 이후에 조건문 작성하여 번호에 맞춰서 img 적용 시킬 것

                  // file이 존재하는지 확인
                  if (value.files && value.files[0]) {
                     // 파일을 읽어 들일 FileReader 객체 생성
                     var reader = new FileReader();

                     // 파일 읽기가 다 완료 되었을 때 실행되는 메소드
                     reader.onload = function(e) {

                        switch (num) {
                        case 1:
                           // e.target.result -> data:URL (파일의 컨텐츠)
                           $("#titleImg").attr("src", e.target.result);
                           break;
                        case 2:
                           $("#contentImg1").attr("src", e.target.result);
                           break;
                        case 3:
                           $("#contentImg2").attr("src",e.target.result);
                           break;
                        case 4:
                           $("#contentImg3").attr("src",e.target.result);
                           break;
                        case 5:
                            $("#contentImg4").attr("src",e.target.result);
                            break;
                        case 6:
                            $("#contentImg5").attr("src",e.target.result);
                            break;
                        case 7:
                            $("#contentImg6").attr("src", e.target.result);
                            break;
                        case 8:
                            $("#contentImg7").attr("src",e.target.result);
                            break;
                        case 9:
                            $("#contentImg8").attr("src",e.target.result);
                            break;
                        case 10:
                            $("#contentImg9").attr("src",e.target.result);
                            break;
                     
                     case 11:
                         $("#contentImg10").attr("src",e.target.result);
                         break;
                     
                  case 12:
                      $("#contentImg11").attr("src",e.target.result);
                      break;
                  
               case 13:
                   $("#contentImg12").attr("src", e.target.result);
                   break;
               
                          case 14:
                            $("#contentImg13").attr("src",e.target.result);
                            break;
                        
                         case 15:
                            $("#contentImg14").attr("src",e.target.result);
                            break;
                        
                         case 16:
                            $("#contentImg15").attr("src",e.target.result);
                            break;
                        
                         case 17:
                            $("#contentImg16").attr("src",e.target.result);
                            break;
                        
                         case 18:
                            $("#contentImg17").attr("src",e.target.result);
                            break;
                        
                         case 19:
                            $("#contentImg18").attr("src",e.target.result);
                            break;
                        
                         case 20:
                            $("#contentImg19").attr("src",e.target.result);
                            break;
                        }
                        
                     }
                     // 파일 내용을 읽어들여 dataURL 형식의 문자열로 설정
                     reader.readAsDataURL(value.files[0]);
                  }
               }
            </script>
         </div>
         <br>
         <div class="btnArea">
            <button type="button" onclick="javascript:history.back();" style="font-family: 'Black Han Sans', sans-serif;">취소하기</button>
            <button type="submit" style="font-family: 'Black Han Sans', sans-serif;">작성완료</button>
         </div>
      </form>


   </div>














</body>
</html>