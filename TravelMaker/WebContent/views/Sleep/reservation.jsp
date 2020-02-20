<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, sleep.model.vo.*, member.model.vo.*"%>
    
    
    
    <%
    Room r = (Room) request.getAttribute("room");
	Sleep s = (Sleep) request.getAttribute("sleep");

	
	System.out.println("sleep reservation: " + s);

	System.out.println("room reservation: " + r);
	 

	
%>
  



<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>

        body{
            width:1500px;
            height:1000px;
        }

    #head{
    width:100%;
    height:20%;
    border: 1px solid blue;

}

    #rs{
    box-sizing: border-box;
    float: left;
    width:45%;
    height:100%;
    margin-top: 8%;
    margin-left: 20%;
    border-radius:3px;
    
}

    #rs2{
        box-sizing: border-box;
        float:right;
        margin-right: 17%;
        width:18%;
        height:600px;
        margin-top:8%;
        background: rgb(243, 240, 240);
    }


    #last{
        width:100%;
        height:200px;
        background: rgb(236, 224, 224);
    }

    #select{
        color:gray;
        width:35%; 
        height:50px; 
        font-size: 20px;
        background: rgb(248, 246, 246);
        border-radius: 3px;
    }

.agree{
    padding:23px 16px;font-size:25px
    }
.agree p{
    position: relative;height: 40px;padding-left: 37px;line-height: 40px
    }
 .agree .all_check{
     font-weight: bold;
 }
 .agree .all_check span{
     color:rgba(0,0,0,0.87)
     }
 .agree span{
     display: inline-block;color: rgba(0,0,0,0.56);cursor:pointer
     }
 .agree span b{
     font-weight:normal;color:rgb(230,28,81);
     }
.agree input{
    position: absolute;top: 50%;left: 0;margin-top: -12px;
    }



.alert_msg_content {display: none;}
.terms_agree{margin-top: 20px;}
.terms_agree p{position: relative;margin-bottom: 20px;}
.terms_agree p label{display:inline-block;position: relative;}
.terms_agree .all_check{font-weight:bold}
.terms_agree input{margin: 0 10px 0 0;vertical-align: top;}
.terms_agree p a{display: inline-block;text-decoration: underline;color:rgba(0,0,0,0.87)}
.terms_agree p span{color:rgb(242,17,76)}

@media all and (min-width:1024px){
	.terms_agree p{margin-bottom: 25px;}
	.terms_agree input{top:-3px}
}
#pop_agree_01, #pop_agree_02, #pop_agree_03{position:fixed;top:0;right:0;bottom:0;left:0;z-index:430;background:#fff}
#pop_agree_01 .fix_cont, #pop_agree_02 .fix_cont, #pop_agree_03 .fix_cont{overflow:hidden;position:absolute;z-index:1;top:44px;bottom:0;left:0;width:100%;margin:0 0 0 0}
@media all and (min-width:1024px){
	#pop_agree_01, #pop_agree_02, #pop_agree_03{overflow:hidden;position:fixed;top:50%;right:auto;left:50%;bottom:auto;width:529px !important;height:592px;margin:-296px 0 0 -265px !important;border-radius:4px}
.fix_title{
display:block;
position:absolute;
top:0;
left:80;
height:22px;
padding:0 0 0 32px;
background:#fff;
font-size:18px;
font-weight:bold;
line-height:64px;
text-align:left
}
.fix_title button{top:50px;right:25px}
.fix_cont{overflow:hidden;position:absolute;z-index:1;top:20px;bottom:0;left:0;width:100%;margin:0 0 0 0}
}




#pop_agree_01 .txt strong,#pop_agree_02 .txt strong{display:block;padding-bottom:15px;font-size:16px;color:rgba(0,0,0,0.87)}
#pop_agree_01 mark{background:none;color:rgb(242,17,76)}
#pop_agree_01 ul:nth-of-type(1){margin-bottom:20px}
.pop_table{width:50%;margin:10px 0 20px 0;border-collapse:collapse;border:1px solid #ccc}
.pop_table th{border-collapse:collapse;border:1px solid #ccc;text-align:center;padding:5px;background:rgba(0,0,0,0.08);font-size:12px;color:rgba(0,0,0,0.56)}
.pop_table td{border-collapse:collapse;border:1px solid #ccc;text-align:left;padding:5px;background:rgb(250,250,250);font-size:12px;color:rgba(0,0,0,0.56)}

.alert_msg_content {display: none;}


#pop_agree_01 .txt, #pop_agree_02 .txt, #pop_agree_03 .txt {
    padding: 20px;
    font-size: 15px;
    line-height: 24px;
    color: rgba(0,0,0,0.56);
}

.bg_dimm{display:none;position:fixed;top:0;right:0;bottom:0;left:0;z-index:410;background:rgba(0,0,0,0.78);touch-action:none;}
    
    
    #pop_agree_01, #pop_agree_02, #pop_agree_03{
    	border:1px solid red;
    }
    
    </style>
</head>
	
<body>

<!-- 결제 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
$(function(){
	var start;
	var end;
    $("#startDate").datepicker({
         changeMonth: true, 
         changeYear: true,
         nextText: '다음 달',
         prevText: '이전 달', 
         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         dateFormat: "yymmdd",
         minDate: 0,
         onClose: function( selectedDate ) {   
        	  
              //시작일(startDate) datepicker가 닫힐때
              //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
         $("#endDate").datepicker( "option", "minDate", selectedDate );
              	
         },
         onSelect:function(dateText){
             var date = $(this).val();
             var year = date.substring(0,4);
             var month = date.substring(4,6);
             var day = date.substring(6,8);
             start = new Date(parseInt(year),parseInt(month),parseInt(day));
          }
    });
    
    
    $( "#endDate" ).datepicker({
         changeMonth: true, 
         changeYear: true,
         nextText: '다음 달',
         prevText: '이전 달', 
         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         dateFormat: "yymmdd",
         
         // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
         onClose: function( selectedDate ) {    
             // 종료일(endDate) datepicker가 닫힐때
             // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
         },
         onSelect:function(dateText){
             var date = $(this).val();
             var year = date.substring(0,4);
             var month = date.substring(4,6);
             var day = date.substring(6,8);
             end = new Date(parseInt(year),parseInt(month),parseInt(day));
             //시작과 끝 날짜 일수 계산
             var betweenDay = (end.getTime() - start.getTime())/1000/60/60/24;
             
             var total = betweenDay * <%= r.getPrice()%>;
             
             $("#totalPrice").text(total+"원");
             
             var type = "<%= r.getrContent()%>" + "  /" + betweenDay+"박";
             $("#betweenDate").text(type);
             $("#total").val(total);
             
			
         }

    });
});

		


	</script>



   <%@ include file="../../views/common/menubar.jsp" %>
		<%= r.getrContent() %>

        <div id="rs">
        <h3>예약자 정보</h3>
        <br>
        <h3 style="color:gray;">예약자 이름</h3>
        <input type="text" value="&nbsp;&nbsp;<%=loginUser.getmName() %>" style=" width:90%; height:50px; border:1px solid gray; font-size: 30px;
                    color:black; border-radius:3px;">
                    <br>
    <h3 style="color:gray;">휴대폰 번호</h3>
<input type="text" value="&nbsp;&nbsp;<%=loginUser.getPhone() %>" style=" width:90%; height:50px; border:1px solid gray; font-size: 30px;
            color:black; border-radius:3px;">

            <br><br><br><br><br>

            <div id="rstype" style="font-size: 30px;">결제수단 선택</div>
            <br>
            <select id="select">
                    <option style="color:gray;">&nbsp;&nbsp;카드결제 (체크,신용)</option>
                        <option>휴대폰 결제</option>
                        <option>PAYCO 결제</option>
                        <option>네이버페이 결제</option>
                        </select>
                        <br><br><br>
            
             <section class="agree">    
               <p class="all_check"><label><input style="width:20px;height:20px;" type="checkbox" name="checkAll" class="inp_chk_01" > <span>전체 동의</span></label></p> 
          <p><input  style="width:20px;height:20px;" type="checkbox" name="checkOne" class="inp_chk_02"> <span onclick="pop_agree_01('pop_agree_01');">숙소이용규칙 및 취소/환불규정 동의 <b>(필수)</b></span></p>
              <p><input style="width:20px;height:20px;" type="checkbox" name="checkOne" class="inp_chk_03"> <span onclick="pop_agree_02('pop_agree_02');">개인정보 수집 및 이용 동의 <b>(필수)</b></span></p>
            <p><input style="width:20px;height:20px;" type="checkbox" name="checkOne" class="inp_chk_04"> <span onclick="pop_agree_03('pop_agree_03');">개인정보 제 3자 제공 동의 <b>(필수)</b></span></p>   
             <p class="guest_chk_area"><input style="width:20px;height:20px;" type="checkbox" name="checkOne" class="inp_chk_02"> <span>만 14세 이상입니다. <b>(필수)</b><span></span></span></p>               
                            </section>

            
        </div>
        
       
     

        	<div id="pop_agree_01" style="display:none">
                <div class="fix_title">
                    	숙소이용규칙 및 취소/환불 규정
                    <button onclick="close_layer('pop_agree_01');">닫기</button>
                </div>
                <div class="fix_cont" style="touch-action: none;">
                    <div class="scroller" style="transform: translate(0px, 0px) translateZ(0px);">
                        <div class="txt">
                            <strong>이용규칙</strong>
                            <ul class="dot_txt">
                                                    <li>최대 인원 초과 시 입실 불가합니다.</li>
                                <li>정원 기준 요금 외 인원 추가 요금은 현장결제입니다.</li>
                                <li>제공 이미지는 배정된 객실과 다를 수 있습니다.</li>
                                <li>제공 정보는 숙소의 사정에 따라 변경될 수 있습니다.</li>
                                <li>미성년자는 보호자 동반 시 투숙이 가능합니다.</li>
                                                    <li>체크인 시 배정의 경우, 객실과 베드타입을 보장하지 않습니다.</li>
                                <li>객실 타입에 시간이 별도 기재된 경우, 체크인/아웃 시간이 상이할 수 있습니다.</li>
                                <li>조식, 인원, 침구, 침대 등 추가는 예약하신 <mark>숙소로 요청 및 결제</mark> 가능합니다.</li>
                                                                        <li>업체 현장에서 객실 컨디션 및 서비스로 인해 발생된 분쟁은 여기어때에서 책임지지 않습니다.</li>
                            </ul>
                            <strong>취소/환불규정</strong>
                            <ul class="dot_txt">
                                                                                    <li><mark>비회원으로 결제 시 취소 및 환불이 불가합니다.</mark></li>
                                        <li>숙소 사정에 의해 취소 발생 시 100% 환불이 가능합니다.</li>
                                        <li>단! 숙소의 객실 정보가 수시로 변경될 수 있으며 이로 인한 불이익은 여기어때가 책임지지 않습니다.</li>
                                                            
                                                </ul>
                        </div>
                    </div>
                </div>
           <div class="bg_dimm" onclick="close_layer();" style="display: block;">&nbsp;</div>
            </div>

            <div id="pop_agree_02" style="display:none">
                    <div class="fix_title">
                        	개인정보 수집 및 이용 동의
                        <button onclick="close_layer('pop_agree_02');">닫기</button>
                    </div>
                    <div class="fix_cont" style="touch-action: none;">
                        <div class="scroller" style="transform: translate(0px, 0px) translateZ(0px);">
                            <div class="txt">
                                <p>“여기어때” 개인정보 수집 이용 목적 및 항목, 보유기간은 아래와 같습니다.<br>“회원” 은 정보 수집/이용 약관에 동의하지 않을 수 있으며, 동의하지 않는 경우 예약 서비스 이용에 제한이 있을 수 있습니다.</p>
                                <table cellpadding="0" cellspacing="0" class="pop_table">
                                <colgroup><col width="33%"><col width="33%"><col width="34%"></colgroup>
                                <tbody><tr>
                                    <th>수집/이용 목적</th>
                                    <th>위탁 업무 내용</th>
                                    <th>개인 정보의 보유 및 이용 기간</th>
                                </tr>
                                <tr>
                                    <td>예약 서비스 이용</td>
                                    <td>예약자명, 휴대폰 번호, 결제정보</td>
                                    <td>전자상거래 상 소비자 보호에 관한 법률에 따라 5년 간 보관</td>
                                </tr>
                                <tr>
                                    <td>결제 서비스 이용</td>
                                    <td>- 신용카드 결제: 카드사명, 카드번호, 유효기간, 이메일 등 - 휴대폰 결제: 휴대폰 번호, 통신사, 결제 승인번호 등 - 계좌 이체 시: 은행명, 계좌번호, 예금주</td>
                                    <td>전자상거래 상 소비자 보호에 관한 법률에 따라 5년 간 보관</td>
                                </tr>
                                <tr>
                                    <td>서비스 이용 및 부정거래 기록 확인</td>
                                    <td>서비스 이용 시간/이용 기록, 접속 로그, 이용 콘텐츠, 쿠키, 접속IP 정보, 주소, 사용된 신용카드 정보, 기기 모델명, 브라우저 정보</td>
                                    <td>통신비밀보호법에 따라 3개월간 보관</td>
                                </tr>
                                </tbody></table>
                            </div>
                        </div>
                    </div>
                </div>
                
                

                <div id="pop_agree_03" style="display:none">
                        <div class="fix_title">
                            개인정보 제 3자 제공 동의
                            <button onclick="close_layer('pop_agree_03');">닫기</button>
                        </div>
                        <div class="fix_cont">
                            <div class="scroller">
                                <div class="txt">
                                    <p>회원 정보를 제공받는 자, 제공목적, 제공하는 정보, 보유 · 이용기간은 아래와 같습니다.<br>"회원"은 정보 수집/이용 약관에 동의하지 않을 수 있으며, 동의하지 않는 경우 예약 서비스 이용에 제한이 있을 수 있습니다.</p>         
                                    <table cellpadding="0" cellspacing="0" class="pop_table">
                                    <colgroup><col width="30%"><col width="70%"></colgroup>
                                    <tbody><tr>
                                        <th>제공받는 자</th>
                                        <td>노보텔 스위트 앰배서더 서울 용산</td>
                                    </tr>
                                    <tr>
                                        <th>제공 목적</th>
                                        <td>숙박예약서비스 이용계약 이행(서비스 제공, 확인, 이용자 정보 확인)</td>
                                    </tr>
                                    <tr>
                                        <th>제공하는 정보</th>
                                        <td>예약한 숙박서비스의 이용자 정보(예약자 이름, 휴대폰번호, 예약번호, 예약한 업체명, 예약한 객실명, 결제금액)</td>
                                    </tr>
                                    <tr>
                                        <th>제공받는 자의 개인정보 보유 및 이용기간</th>
                                        <td>예약서비스 제공 완료 후 6개월</td>
                                    </tr>
                                    </tbody></table>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
			        <div id="rs2">
			            <div style="color:gray; font-size:17px; margin-top:8%; margin-left:6%;">숙소이름 </div>
			            <div style="color:black; font-size:22px; margin-top:3%; margin-left:6%;"><%= s.getsName()%></div>
			            <hr>
			           
			
			            <div style="color:gray; font-size:17px; margin-top:8%; margin-left:6%;">객실타입/기간 </div>
			            <div type="hidden" name="betweenDate" id="betweenDate" style="color:black; font-size:22px; margin-top:3%; margin-left:6%;"></div>
			            <hr>
			
			            <div style="color:gray; font-size:17px; margin-top:8%; margin-left:6%;">체크인 </div>
			            <div style="color:black; font-size:22px; margin-top:3%; margin-left:6%;"><input style="height:30px;" type="text" name="startDate" id="startDate" readonly placeholder="CheckIn"> 15:00</div>
			            <hr>
			
			            <div style="color:gray; font-size:17px; margin-top:8%; margin-left:6%;">체크아웃 </div>
			            <div style="color:black; font-size:22px; margin-top:3%; margin-left:6%;"><input style="height:30px;" type="text" name="endDate" id="endDate" readonly placeholder="CheckOut"> 12:00</div>
			            <br><hr>
			
			            <div style="width:85%; margin-left:5%;"></div>
			            <br>
			            <div style="color:black; font-size:22px; margin-top:3%; margin-left:6%; font-weight: bolder; box-sizing: border-box; float:left;">총 결제 금액</div>
			            <div style="  box-sizing: border-box; float:left; margin-top: 5%;">(VAT포함)</div>
			
			            <div id="totalPrice" style="font-size: 30px; color:rgb(224, 33, 33); margin-left:50px; font-weight: bold; float: left; witdh:100%;"></div>
			
			            <div style="float: left;">- 해당 객실가는 세금, 봉사료가 포함 된 금액입니다</div>
			            <br>
			
			            <button type="button" onclick="payment();" id="rsbtn"style="width:100%; height:50px; background:rgb(224, 33, 33); color:white; margin-top:30%;
			             border-radius:5px;">결제</button>
					</div>



<input type="hidden" id="total">




<br><br><br><br><br><br>

<div id="last" style="float: left; width:1680px; height:40%; text-align:center;"><p><br><br><br>
고객행복센터 1670-6250 오전 9시 - 새벽 3시, 점심시간: 오후 12시 - 오후 1시<br>
(주) TRAVEL MAKER<br>
주소 : 서울특별시 강남구 봉은사로 479, 479타워 11층<br>
대표이사 : <mark>이태균</mark> | 사업자등록번호: 742-86-00224<br>
통신판매번호 : 2017-서울강남-01779 | 관광사업자 등록번호: 제1026-24호<br>
전화번호 : 1670-6250<br>
전자우편주소 : help@goodchoice.kr<br><br><br>
Copyright WITHINNOVATION Corp. All rights reserved.</p></div>

</body>
<script>
function payment(){
	if($(".inp_chk_01").is(":checked")== true &&
			$(".inp_chk_02").is(":checked")== true &&
			$(".inp_chk_03").is(":checked")== true &&
			$(".inp_chk_04").is(":checked")== true) {
    var IMP = window.IMP; // 생략가능
    IMP.init('imp20522573'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    IMP.request_pay({
       pg : 'inicis', // version 1.1.0부터 지원. 이건 어떤 방식으로 결제를 할것인지가 들어감
       pay_method : 'card',
       merchant_uid : 'merchant_' + new Date().getTime(),
       name : '<%= s.getsName() %>',
       amount : $("#total").val(),
       buyer_email : '<%= loginUser.getEmail()%>',
       buyer_name : '<%= loginUser.getmName()%>',
       buyer_tel : '<%= loginUser.getPhone()%>',
       buyer_addr : 'ㅇㄴ',
       buyer_postcode : '123-456',
       m_redirect_url : 'https://www.yourdomain.com/payments/complete'
    }, function(rsp) {
       if (rsp.success) {
    	  var sId = <%= s.getsId() %>;
          var msg = '결제가 완료되었습니다.';
          msg += '고유ID : ' + rsp.imp_uid;
          msg += '상점 거래ID : ' + rsp.merchant_uid;
          msg += '결제 금액 : ' + rsp.paid_amount;
          msg += '카드 승인번호 : ' + rsp.apply_num;
          alert(msg);
          location.href="<%=contextPath%>/detail.sl?sId=" + sId;
       } else {
          var msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
          check = false;
          checkMsg = "결제 실패";
          alert(msg);
       } 
    })
	}else {
		return;
	};
		
}
</script> 
        <script>
	       function allCheckFunc( obj ) {
			    $("[name=checkOne]").prop("checked", $(obj).prop("checked") );
			}
			  
			// 체크박스 체크시 전체선택 체크 여부
			function oneCheckFunc( obj ){
			
			    var allObj = $("[name=checkAll]");
			    var objName = $(obj).attr("name");
			
			    if($(obj).prop("checked")){
			        checkBoxLength = $("[name="+ objName +"]").length;
			        checkedLength = $("[name="+ objName +"]:checked").length;
			
			        if( checkBoxLength == checkedLength ) {
			            allObj.prop("checked", true);
			        } else {
			            allObj.prop("checked", false);
			        }
			    }
			    else
			    {
			        allObj.prop("checked", false);
			    }
			}
			  
			$(function(){
			    $("[name=checkAll]").click(function(){
			        allCheckFunc( this );
			    });
			    $("[name=checkOne]").each(function(){
			        $(this).click(function(){
			            oneCheckFunc( $(this) );
			        });
			    });
			});
			function reserveVerify() {
			    clearTimecount();
			    cencelSend();
			}
		</script>
      
         <script>
        $(document).ready(function(){
            
            $("#rsbtn").click(function(){    
                if($(".inp_chk_01").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                    return;
                }else if($(".inp_chk_02").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
                    return;
                }else if($(".inp_chk_03").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다...");
                    return;
                }else if($(".inp_chk_04").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다...");
                    return;    
                }else{
                    $(".checkAll").submit();
                }
            });    
        });
        </script>
        
        <script>
       /*  $(document).ready(function(){
        	$('.inp_chk_02').click(function(){
        	
        		var state = $('.layer pop_fix pop_agree_01').css('display');
        		if(state == 'none'){
        			$('.layer pop_fix pop_agree_01').show();
        		}else{
        			$('.layer pop_fix pop_agree_01').hide();
        		}
        	});
        		
        }); */
        </script>
        
        
        <script>
        function pop_agree_01(target){
        	 document.getElementById(target).style.display = 'block';
        }
        
        function close_layer(target) {
            document.getElementById(target).style.display = 'none';
        }
        
        
        function pop_agree_02(target){
       	 document.getElementById(target).style.display = 'block';
       }
       
       function close_layer(target) {
           document.getElementById(target).style.display = 'none';
           
       }
       
       
       function pop_agree_03(target){
      	 document.getElementById(target).style.display = 'block';
      }
      
      function close_layer(target) {
          document.getElementById(target).style.display = 'none';
      }
        
        </script>
</html>