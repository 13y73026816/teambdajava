<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%String allPrice = (String)session.getAttribute("allPrice");
String name = (String)session.getAttribute("name"); 
String grade = (String)session.getAttribute("grade");
Integer point = (Integer)session.getAttribute("point");
String email = (String)request.getAttribute("email");
String phone = (String)request.getAttribute("phone");
String address = (String)request.getAttribute("addr");
String id = (String)request.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script>
      $( document ).ready( function() {
    	  
	   	$("#pay_money").val(<%=allPrice %>);
    	 
	   	console.log(<%=email%>);
	   	
        $( '.check-all' ).click( function() {
          $( '.ab' ).prop( 'checked', this.checked );
        } );

      
      
   	    $('.ab').change(function(){
   	    	if($(this).is(":checked") == true) {
   	    	  if ($('.ab:checked').length == $('.ab').length) {
   	    	  		$('.check-all').prop( 'checked', true );
   	    	  	} 
    	    }
    	  
      	});
   	    
   	    $("#point_check").on("click",function(){
   	    	var use_point = Number($("#use_point").val());
   	    	var pay_money = <%=allPrice %> - use_point;
	   	    var my_point = Number($("#hidden_point").val());
   	    	if(my_point < use_point){
   	    		alert("my_point->"+my_point+", use_point->"+use_point);
   	    		alert("사용가능한 포인트를 초과하여 사용할 수는 없습니다.");
   	    		$("#use_point").val("");
   	    	}else if(my_point >= use_point){
   		   	    if(pay_money < 0){
   	   	    		alert("결제 금액을 초과하여 포인트를 사용할 수는 없습니다.");
   	   	    		$("#pay_money").text("");
   	   	    	}
   	   	    	else{
   	   	   	    	alert("포인트를 사용하시겠습니까?");
   	   	   	    	$("#pay_money").val(pay_money);

   	   	   	    	var rem_point =  my_point - use_point;
   	   	   	    	$("#my_point").text(rem_point);
   	   	    	}
   	    	}

  	

   	    });
   	    
   	    
   	      	    
      }); 	    
            
    </script>



<style>
	center.first{
		margin-top:100px;
	}
  #toc-content {
    display: none;
  }
  #toc-toggle {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle:hover {
    text-decoration: underline;
  }
  
  #toc-content1{
    display: none;
  }
  #toc-toggle1 {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle1:hover {
    text-decoration: underline;
  }
  
  #toc-content2 {
    display: none;
  }
  #toc-toggle2 {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle2:hover {
    text-decoration: underline;
  }
  
  #toc-content3 {
    display: none;
  }
  #toc-toggle3 {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle3:hover {
    text-decoration: underline;
  }
  #toc-content4 {
    display: none;
  }
  #toc-toggle4 {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle4:hover {
    text-decoration: underline;
  }
  .c1{
  display: inline-block;
  background-color:#BDBDBD;
  width:161.5px; 
  height:100px;
  text-align:center;
  display:table-cell;
  vertical-align:middle;
 }
 .c1:hover{
  background-color:gray;
 }
 #toc-content00 {
    display: none;
  }
  #toc-toggle00 {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle00:hover {
    text-decoration: underline;
  }
  
  #toc-content01 {
    display: none;
  }
  #toc-toggle01 {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle01:hover {
    text-decoration: underline;
  }
  
  #toc-content02 {
    display: none;
  }
  #toc-toggle02 {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle02:hover {
    text-decoration: underline;
  }
  #toc-content03 {
    display: none;
  }
  #toc-toggle03 {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle03:hover {
    text-decoration: underline;
  }
    #toc-content001 {
    display: none;
  }
  #toc-toggle001 {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle001:hover {
    text-decoration: underline;
  }
   #toc-content002 {
    display: none;
  }
  #toc-toggle002 {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle002:hover {
    text-decoration: underline;
  }
    #toc-content003 {
    display: none;
  }
  #toc-toggle003 {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle003:hover {
    text-decoration: underline;
  }
   #toc-content004 {
    display: none;
  }
  #toc-toggle004 {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle004:hover {
    text-decoration: underline;
  }
  header{
	padding-bottom:100px;
  }
  section{
  	width:500px;
  	margin:auto;
  }
  #pay_money_div{
  	color:red;
  	margin-left:50px;
  }
  #pay_money{
  	border:none;
  	width:150px;
  	color:red;
  }

</style>

</head>
<body>
<form name="frm1">

<%String oidxArray = (String)session.getAttribute("oidxArray");%>
<%String totalpriceArray = (String)session.getAttribute("totalpriceArray");%>

<section>

<center class="first"><h2>결제 금액 : &#65510; <%=allPrice %></h2></center> 
<center><h2>결제수단을 선택해주세요</h2></center> 
<center><span><b>포인트 사용 : </b><input type="number" id="use_point"> <span><input type="button" value="적용" id="point_check"></span></center>
<center><div><span>나의 사용가능한 포인트 : </span><span id="my_point"><%=point%></span><input type="hidden" value=<%=point%> id="hidden_point"></div></center>
<br>
<!--  
<div style="text-align:center; display:table;">
<div class="c1" onclick="openCloseToc00()" >휴대폰</div>
&nbsp;
&nbsp;
<div class="c1" onclick="openCloseToc01()" >신용카드</div>
&nbsp;
&nbsp;
<div class="c1" onclick="openCloseToc02()" >계좌이체</div>
&nbsp;
&nbsp;
<div class="c1" onclick="openCloseToc03()" >기타</div>

</div>
<br>
<div>


	<div id="toc-content00">
	통신사를 선택해주세요
	<input type="radio" name="pname" value="phone_skt" style="width:23px;" onclick="openCloseToc001()"><b style="font-size:17px;">SKT</b>
	<input type="radio" name="pname" value="phone_lg" style="width:23px;" onclick="openCloseToc001()"><b style="font-size:17px;">LG</b>
	<input type="radio" name="pname" value="phone_kt" style="width:23px;" onclick="openCloseToc001()"><b style="font-size:17px;">KT</b>
	</div>
	
	
	<div id="toc-content01">
	신용카드를 선택해주세요
	<input type="radio" name="pname" value="credit_ss" style="width:23px;" onclick="openCloseToc002()"><b style="font-size:17px;">삼성</b>
	<input type="radio" name="pname" value="credit_sh" style="width:23px;" onclick="openCloseToc002()"><b style="font-size:17px;">신한</b>
	<input type="radio" name="pname" value="credit_bc" style="width:23px;" onclick="openCloseToc002()"><b style="font-size:17px;">BC</b>
	</div>
	
	
	<div id="toc-content02">
	은행을 선택해주세요
	
	<input type="radio" name="pname" value="bank_km" style="width:23px;" onclick="openCloseToc003()"><b style="font-size:17px;">국민</b>
	<input type="radio" name="pname" value="bank_sh" style="width:23px;" onclick="openCloseToc003()"><b style="font-size:17px;">신한</b>
	<input type="radio" name="pname" value="bank_nh" style="width:23px;" onclick="openCloseToc003()"><b style="font-size:17px;">농협</b>
	
	<div>
	입금하실 계좌는 이곳입니다.
	<br>
	<b>1234-1234-1234-1234</b>국민
	<br>
	<b>1234-1234-1234-1234</b>신한
	<br>
	<b>1234-1234-1234-1234</b>농협
	</div>
	</div>
	
	<div id="toc-content03">
	이하 사항을 선택해주세요
	<input type="radio" name="pname" value="etc_ss" style="width:23px;" onclick="openCloseToc004()"><b style="font-size:17px;">삼성페이</b>
	<input type="radio" name="pname" value="etc_kko" style="width:23px;" onclick="openCloseToc004()"><b style="font-size:17px;">카카오페이</b>
	<input type="radio" name="pname" value="etc_nv" style="width:23px;" onclick="openCloseToc004()"><b style="font-size:17px;">네이버페이</b>
	</div>
-->

</div>
<br>
<br>
<table class="table table-hover">
	<tr>
		<td>
			<input type="checkbox"  class="check-all" id="check-all"> 전체 약관에 모두 동의합니다. 
			<br>
			(이용시 유의사항, 환불 및 수수료 안내,개인정보 수집이용 및 개인정보 3자 제공)
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" class="ab"> 이용시 유의사항에 동의합니다. [<span id="toc-toggle" onclick="openCloseToc()">자세히보기</span>]
			<br>
				<div id="toc-content">
				<br>
				보호자의 동반이 없는 미성년자는 예약 및 입실 불가능 합니다. 
				<br>
				예약시 신청하신 인원이외에 추가인원이 있을경우 입실이 거부될 수 있습니다.
				<br>
				예약인원 초과로 인한 입실 거부시 환불도 되지 않으니 유의하시기 바랍니다.
				<br>
				예약후 펜션이나 객실 변경은 해당예약 취소후 다시 예약하셔야 합니다.
				<br>
				예약변경을 위한 취소시에도 취소수수료가 부과되오니 신중하게 예약하시기 바랍니다.
				<br>
				최대인원이 2인인 커플전용룸의 경우 유아나 아동은 동반입실이 불가능합니다.
				<br>
				애완견 동반시 입실이 불가능 합니다.
				<br>
				퇴실 시에는 내집같이 정돈을 부탁 드립니다.
				<br>
				</div>
		</td>
	</tr>
	<tr>
		<td>
			
			<input type="checkbox" class="ab"> 환불 및 취소수수료 사항에 대해 동의합니다. [<span id="toc-toggle1" onclick="openCloseToc1()">자세히보기</span>]
			<div id="toc-content1">
			<br>
			(예약기준일과는 다른 이용일 기준입니다.)
			<br>
			예약취소는 "MYPAGE" 안의 "예약확인/취소"에서 가능합니다.
			<br>
			취소수수료는 예약시점과는 무관한 이용시작일 기준입니다.
			<br>
			환불시 결제하신 금액에서 취소수수료를 제외한 금액을 환불해 드립니다.
			<br>
			취소수수료는 결제금액이 아닌 예약금(객실요금+기타옵션요금) 기준으로 책정됩니다.
			<br>
			취소수수료가 100% 인 경우 전액 환불되지 않습니다.
			<br>
			수수료 내역은 아래와 같습니다.
			<br>
			<table class="table">
   		<tr>
   			<td style="text-align:center">기준</td>
   			<td style="text-align:center">취소 수수료(%)</td>
   			<td style="text-align:center">환불액</td>
   		</tr> 
   		<tr>
   			<td style="text-align:center">이용일 당일 취소시</td>
   			<td style="text-align:center">100%</td>
   			<td style="text-align:center">0% 환불액 없음</td>
   		</tr>
   		<tr>
   			<td style="text-align:center">이용일 1일전 취소시</td>
   			<td style="text-align:center">100%</td>
   			<td style="text-align:center">0% 환불액 없음</td>
   		</tr>
   		<tr>
   			<td style="text-align:center">이용일 2일전 취소시</td>
   			<td style="text-align:center">100%</td>
   			<td style="text-align:center">0% 환불액 없음</td>
   		</tr>
   		<tr>
   			<td style="text-align:center">이용일 3일전 취소시</td>
   			<td style="text-align:center">70%</td>
   			<td style="text-align:center">30% 환불</td>
   		</tr>
   		<tr>
   			<td style="text-align:center">이용일 4일전 취소시</td>
   			<td style="text-align:center">50%</td>
   			<td style="text-align:center">50% 환불</td>
   		</tr>
   		<tr>
   			<td style="text-align:center">이용일 5일전 취소시</td>
   			<td style="text-align:center">50%</td>
   			<td style="text-align:center">50% 환불</td>
   		</tr>
   		<tr>
   			<td style="text-align:center">이용일 6일전 취소시</td>
   			<td style="text-align:center">50%</td>
   			<td style="text-align:center">50% 환불</td>
   		</tr>
   		<tr>
   			<td style="text-align:center">이용일 7일전 취소시</td>
   			<td style="text-align:center">10%</td>
   			<td style="text-align:center">90% 환불</td>
   		</tr>
   		<tr>
   			<td style="text-align:center">기본 취소 수수료</td>
   			<td style="text-align:center">10%</td>
   			<td style="text-align:center">90% 환불</td>
   		</tr>
	</table>
			
			</div>
		</td>
		
	</tr>
	<tr>
		<td>
			<input type="checkbox" class="ab"> 개인정보 수집 및 이용에 동의합니다. [<span id="toc-toggle2" onclick="openCloseToc2()">자세히보기</span>]
			<div id="toc-content2">
			

			<br>
			(주)다자바'는 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.
			<br>
			수집하는 개인정보 항목
			<br>
			회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
			<br>
			1)구매(예약)자
			<br>
			- 수집항목 : 이름 , 로그인ID , 비밀번호 , 생년월일 , 휴대전화번호 , 이메일 , 서비스 이용기록 , 결제기록
			<br>
			- 개인정보 수집방법 : 홈페이지(회원가입,주문,예약)
			<br>
			2)숙박업주(가맹점)
			<br>
			- 수집항목 : 업소명 , 로그인ID , 비밀번호 , 담당자 및 신청인정보 , 연락처 , 홈페이지주소 , 사업자정보(세무신고 관련정보 일체) , 계좌정보
			<br>
			- 개인정보 수집방법 : 홈페이지(가맹접수 및 계약) 및 서류접수(FAX/우편)
			<br>
			개인정보의 수집 및 이용목적
			<br>
			회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
			<br>
			- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
			<br>
			구매 및 요금 결제
			<br>
			- 회원 관리
			<br>
			회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 불만처리 등 민원처리
			<br>
			- 예약 관리
			<br>
			숙박업소이용 및 사후관리에 필요한 차원의 본인확인 및 식별
			<br>
			- 가맹 관리
			<br>
			입점계약진행 및 가맹점 관리 차원
			<br>
			개인정보의 보유 및 이용기간
			<br>
			회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.
			<br>
			</div>	
		</td>
	</tr>	
	<tr>
		<td>
			<input type="checkbox" class="ab"> 개인정보 3자 제공을 동의합니다. [<span id="toc-toggle3" onclick="openCloseToc3()">자세히보기</span>]
			<div id="toc-content3">
			<br>
			개인정보의 제3자 제공
			<br>
			- 이용자의 경우
			<br>
			1) 개인정보를 제공받는 자 : 이용하고자 하는 해당 숙박업소. 다자바펜션
			<br>
			2) 제3자의 개인정보 이용 목적 : 숙박업소를 이용하는 고객의 본인확인 및 미성년자 여부를 확인하고 연락을 유지하기 위함
			<br>
			3) 제공하는 개인정보의 항목 : 이름, 휴대전화번호, 이메일, 생년월일, 예약정보
			<br>
			4) 보유기간 : 이용완료 후 5년
			<br>
			</div>
		</td>
	</tr>	
	
	


</table>
<br>
<br>
<div id="pay_money_div">
<h3>최종 결제 금액 : &#65510; <sapn><input type="text" id="pay_money" name="pay_money"></sapn></h3>
</div><br>
<div style="text-aling:center;">
<button type="button" style="width:500px; height:50px; text-aling:center;" onclick="pay();">결제하기</button>
</div>
</section>
</form>
<script>
  function openCloseToc() {
    if(document.getElementById('toc-content').style.display === 'block') {
      document.getElementById('toc-content').style.display = 'none';
      document.getElementById('toc-toggle').textContent = '보이기';
    } else {
      document.getElementById('toc-content').style.display = 'block';
      document.getElementById('toc-toggle').textContent = '숨기기';
    }
  }
  function openCloseToc1() {
	    if(document.getElementById('toc-content1').style.display === 'block') {
	      document.getElementById('toc-content1').style.display = 'none';
	      document.getElementById('toc-toggle1').textContent = '보이기';
	    } else {
	      document.getElementById('toc-content1').style.display = 'block';
	      document.getElementById('toc-toggle1').textContent = '보이기';
	    }
	  }
  function openCloseToc2() {
	    if(document.getElementById('toc-content2').style.display === 'block') {
	      document.getElementById('toc-content2').style.display = 'none';
	      document.getElementById('toc-toggle2').textContent = '보이기';
	    } else {
	      document.getElementById('toc-content2').style.display = 'block';
	      document.getElementById('toc-toggle2').textContent = '보이기';
	    }
	  }
  function openCloseToc3() {
	    if(document.getElementById('toc-content3').style.display === 'block') {
	      document.getElementById('toc-content3').style.display = 'none';
	      document.getElementById('toc-toggle3').textContent = '보이기';
	    } else {
	      document.getElementById('toc-content3').style.display = 'block';
	      document.getElementById('toc-toggle3').textContent = '숨기기';
	    }
	  }
  
  
  
  
  function openCloseToc00() {
	    if(document.getElementById('toc-content00').style.display === 'block') {
	      document.getElementById('toc-content00').style.display = 'none';
	      
	    }
	    else {
	      document.getElementById('toc-content00').style.display = 'block';
	     
	    }
	    if(document.getElementById('toc-content01').style.display === 'block'){
	    	 document.getElementById('toc-content01').style.display = 'none';
	    }
	    if(document.getElementById('toc-content02').style.display === 'block'){
	    	 document.getElementById('toc-content02').style.display = 'none';
	    }
	    if(document.getElementById('toc-content03').style.display === 'block'){
	    	 document.getElementById('toc-content03').style.display = 'none';
	    }
	    if(document.getElementById('toc-content001').style.display === 'block'){
	    	 document.getElementById('toc-content001').style.display = 'none';
	    }
	    if(document.getElementById('toc-content002').style.display === 'block'){
	    	 document.getElementById('toc-content002').style.display = 'none';
	    }
	    if(document.getElementById('toc-content003').style.display === 'block'){
	    	 document.getElementById('toc-content003').style.display = 'none';
	    }
	    if(document.getElementById('toc-content004').style.display === 'block'){
	    	 document.getElementById('toc-content004').style.display = 'none';
	    }
	    
	    
	    
	  }
  function openCloseToc01() {
	    if(document.getElementById('toc-content01').style.display === 'block') {
	      document.getElementById('toc-content01').style.display = 'none';
	    
	    } else {
	      document.getElementById('toc-content01').style.display = 'block';
	     
	    }
	    
	    if(document.getElementById('toc-content00').style.display === 'block'){
	    	 document.getElementById('toc-content00').style.display = 'none';
	    }
	    if(document.getElementById('toc-content02').style.display === 'block'){
	    	 document.getElementById('toc-content02').style.display = 'none';
	    }
	    if(document.getElementById('toc-content03').style.display === 'block'){
	    	 document.getElementById('toc-content03').style.display = 'none';
	    }
	    if(document.getElementById('toc-content001').style.display === 'block'){
	    	 document.getElementById('toc-content001').style.display = 'none';
	    }
	    if(document.getElementById('toc-content002').style.display === 'block'){
	    	 document.getElementById('toc-content002').style.display = 'none';
	    }
	    if(document.getElementById('toc-content003').style.display === 'block'){
	    	 document.getElementById('toc-content003').style.display = 'none';
	    }
	    if(document.getElementById('toc-content004').style.display === 'block'){
	    	 document.getElementById('toc-content004').style.display = 'none';
	    }
	    
	  }
  function openCloseToc02() {
	    if(document.getElementById('toc-content02').style.display === 'block') {
	      document.getElementById('toc-content02').style.display = 'none';
	      d
	    } else {
	      document.getElementById('toc-content02').style.display = 'block';
	      
	    }
	    if(document.getElementById('toc-content00').style.display === 'block'){
	    	 document.getElementById('toc-content00').style.display = 'none';
	    }
	    if(document.getElementById('toc-content01').style.display === 'block'){
	    	 document.getElementById('toc-content01').style.display = 'none';
	    }
	    if(document.getElementById('toc-content03').style.display === 'block'){
	    	 document.getElementById('toc-content03').style.display = 'none';
	    }
	    if(document.getElementById('toc-content001').style.display === 'block'){
	    	 document.getElementById('toc-content001').style.display = 'none';
	    }
	    if(document.getElementById('toc-content002').style.display === 'block'){
	    	 document.getElementById('toc-content002').style.display = 'none';
	    }
	    if(document.getElementById('toc-content003').style.display === 'block'){
	    	 document.getElementById('toc-content003').style.display = 'none';
	    }
	    if(document.getElementById('toc-content004').style.display === 'block'){
	    	 document.getElementById('toc-content004').style.display = 'none';
	    }
	  }
  function openCloseToc03() {
	    if(document.getElementById('toc-content03').style.display === 'block') {
	      document.getElementById('toc-content03').style.display = 'none';
	  
	    } else {
	      document.getElementById('toc-content03').style.display = 'block';
	      
	    }
	    if(document.getElementById('toc-content00').style.display === 'block'){
	    	 document.getElementById('toc-content00').style.display = 'none';
	    }
	    if(document.getElementById('toc-content01').style.display === 'block'){
	    	 document.getElementById('toc-content01').style.display = 'none';
	    }
	    if(document.getElementById('toc-content02').style.display === 'block'){
	    	 document.getElementById('toc-content02').style.display = 'none';
	    }
	    if(document.getElementById('toc-content001').style.display === 'block'){
	    	 document.getElementById('toc-content001').style.display = 'none';
	    }
	    if(document.getElementById('toc-content002').style.display === 'block'){
	    	 document.getElementById('toc-content002').style.display = 'none';
	    }
	    if(document.getElementById('toc-content003').style.display === 'block'){
	    	 document.getElementById('toc-content003').style.display = 'none';
	    }
	    if(document.getElementById('toc-content004').style.display === 'block'){
	    	 document.getElementById('toc-content004').style.display = 'none';
	    }
	  }

  function openCloseToc001() {
	    if(document.getElementById('toc-content001').style.display === 'block') {
	      document.getElementById('toc-content001').style.display = 'none';
	      
	    }
	    else {
	      document.getElementById('toc-content001').style.display = 'block';
	     
	    }


  }
  function openCloseToc002() {
	    if(document.getElementById('toc-content002').style.display === 'block') {
	      document.getElementById('toc-content002').style.display = 'none';
	      
	    }
	    else {
	      document.getElementById('toc-content002').style.display = 'block';
	     
	    }


}
  function openCloseToc003() {
	    if(document.getElementById('toc-content003').style.display === 'block') {
	      document.getElementById('toc-content003').style.display = 'none';
	      
	    }
	    else {
	      document.getElementById('toc-content003').style.display = 'block';
	     
	    }


}
  function openCloseToc004() {
	    if(document.getElementById('toc-content004').style.display === 'block') {
	      document.getElementById('toc-content004').style.display = 'none';
	      
	    }
	    else {
	      document.getElementById('toc-content004').style.display = 'block';
	     
	    }


}
  


  function pay(){
	  var pname = $("input[name=pname]:checked").val();


	  if($("input:checkbox[id='check-all']").is(":checked") == false){
		 alert("전체 약관에 모두 동의해주세요."); 
	  }else{
			//세션에 담긴 가격과
			//선택된 예약 방법에 따른 value 값을 담아서 table_pay 에 insert 하는 동시에
			//가져온 oidx 에 해당하는 table_order의 모든 행들을 ostate를 Y로 바꿔준다. 
	        document.frm1.action="<%=request.getContextPath() %>/reserve/reservePay.do";
			document.frm1.method="post";
			document.frm1.submit();
			
	  }	
	  
  }
  
  
  
  
  
  
  
  
</script>

</body>
</html>