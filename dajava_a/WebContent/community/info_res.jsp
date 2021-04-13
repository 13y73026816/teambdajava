<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="<%=request.getContextPath()%>/community/style3.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <script type="text/javascript">
 		
    $(document).ready(function() {
    	
    	$('.show1').show(); 
    	$(".clickA").click(function(e){
    		
    		var data = $(this).data("temp");
    		
    		if(data == "a1"){
    			$(".a1").show();
    			$(".a1").siblings(".contentBox").hide();
    			$(".col1").css("background","#2c2c2c");
				$(".c1").not(".col1").css("background","#dcdcdc");
				$(".col1 a").css("color","#fff");
				$(".c1 a").not(".col1 a").css("color","#121013");
    		}else if(data == "a2"){
    			$(".a2").show();
    			$(".a2").siblings(".contentBox").hide();
    			$(".col2").css("background","#2c2c2c");
				$(".c1").not(".col2").css("background","#dcdcdc");
				$(".col2 a").css("color","#fff");
				$(".c1 a").not(".col2 a").css("color","#121013");
    		}else if(data == "a3"){
    			$(".a3").show();
    			$(".a3").siblings(".contentBox").hide();
    			$(".col3").css("background","#2c2c2c");
				$(".c1").not(".col3").css("background","#dcdcdc");
				$(".col3 a").css("color","#fff");
				$(".c1 a").not(".col3 a").css("color","#121013");
    		}else if(data == "a4"){
    			$(".a4").show();
    			$(".a4").siblings(".contentBox").hide();
    			$(".col4").css("background","#2c2c2c");
				$(".c1").not(".col4").css("background","#dcdcdc");
				$(".col4 a").css("color","#fff");
				$(".c1 a").not(".col4 a").css("color","#121013");
    		}else if(data == "a5"){
    			$(".a5").show();
    			$(".a5").siblings(".contentBox").hide();
    			$(".col5").css("background","#2c2c2c");
				$(".c1").not(".col5").css("background","#dcdcdc");
				$(".col5 a").css("color","#fff");
				$(".c1 a").not(".col5 a").css("color","#121013");
    		}
			e.preventDefault(); //스크롤방지
    	});
    	
    	
    });
    
   
       /*  function dis(){
        	if($('#dis').css('display') =='none'){
        		$('#dis').show();
        		
        	}else{
        		$('#dis').hide();
        		
        	}
       		 $ ('.show1').show(); 
    		 $ ('.show2').hide(); 
    		 $ ('.show3').hide(); 
    		 $ ('.show4').hide(); 
    	 	 $ ('.show5').hide(); 
        }
        function dis2(){
 
        	if($('#dis2').css('display')=='none'){
        		$('#dis2').show();
        		
        	}else{
        		$('#dis2').hide();
        		
        	}
        	$ ('.show1').hide(); 
        	$ ('.show2').show(); 
        	$ ('.show3').hide(); 
        	$ ('.show4').hide(); 
        	$ ('.show5').hide(); 
        }
        
        function dis3(){
        	if($('#dis3').css('display')=='none'){
        		$('#dis3').show();
        		
        	}else{
        		$('#dis3').hide();
        		
        	}
        	$ ('.show1').hide(); 
        	$ ('.show2').hide(); 
        	$ ('.show3').show(); 
        	$ ('.show4').hide(); 
        	$ ('.show5').hide(); 
        }
        
        function dis4(){
        	if($('#dis4').css('display')=='none'){
        		$('#dis4').show();
        		
        	}else{
        		$('#dis4').hide();
        		
        	}
        	$ ('.show1').hide(); 
        	$ ('.show2').hide(); 
        	$ ('.show3').hide(); 
        	$ ('.show4').show(); 
        	$ ('.show5').hide(); 
        }
        
        function dis5(){
        	if($('#dis5').css('display')=='none'){
        		$('#dis5').show();
        		
        	}else{
        		$('#dis5').hide();
        		
        	}
        	$ ('.show1').hide(); 
        	$ ('.show2').hide(); 
        	$ ('.show3').hide(); 
        	$ ('.show4').hide(); 
        	$ ('.show5').show(); 
        } */
        
        
    </script> 

</head>
<body>
<%@ include file="../header.jsp" %>
<div class="header">
        <div class="info">
			<h2>RESERVATION</h2>
			__________________________________________________________________
			<h3>예약안내</h3>
		</div>
</div>
<br>
<br>
<br>
<div class="c2">
<div class="c3">
<b>기본정보
<p/>
·다자바 펜션 이용 시 아래의 유의사항을 꼭 숙지 부탁드립니다.
<p/>
·예약 문의 : 000-0000-0000 으로 연락을 주시면 친절히 안내 드리겠습니다.
<p/>
·결제 방법 : ~~~ ~~~ ~~~  입니다. </b></div>
</div>
<br>
<br>
<form>
	<table class="t1" border="1">
		<tr height="60px;">	
			<th class="c1 clickA col1" data-temp="a1" width="20%"><a href="#" id='show' onclick="dis()" >객실 요금표</a></th>
			<th class="c1 clickA col2" data-temp="a2" width="20%"><a href="#" id='show2' onclick="dis2()">기본 이용 안내</a></th>
			<th class="c1 clickA col3" data-temp="a3" width="20%"><a href="#" id='show3' onclick="dis3()">입/퇴실 안내</a></th>
			<th class="c1 clickA col4" data-temp="a4" width="20%"><a href="#" id='show4' onclick="dis4()">유의사항</a></th>
			<th class="c1 clickA col5" data-temp="a5" width="20%"><a href="#" id='show5' onclick="dis5()">환불 규정</a></th>
		</tr>
	</table>
<div class="position-relative">
<div class="c2 div1 show1 contentBox a1" id='dis' >
이곳은 아직 준비 되지 않았습니다.
</div>
<div class="c div1 show2 contentBox a2" id='dis2' style="display:none;">
<ul>
	<li>예약시 아래의 기본 이용 안내 내용과 환불 기준을 숙지하시고 예약하시길 부탁드립니다.</li>
	<li style="list-style:none;"></li>
	<li>주말/성수기/시즌별 예약은 공지사항 및 예약 사항을 참조 하시길 부탁드립니다.</li>
	<li Style="color:red;">숯, 그릴 이용료는 中자는 15,000원이며, 大자는 20,000원 입니다.</li>
	<li Style="color:red;">기준인원 초과시 1인당 2만원 추가됩니다.영유아와 아동 포함이며, 미숙박 인원도 포함됩니다.</li>
	<li Style="color:red;">최대인원 초과시 당일 취소를 원칙으로 하며,입실하실 경우 위약금이 부과 될 수 있음을 미리 공지하는 바입니다.</li>
	<li>월요일~금요일 - 주중요금 / 토요일 및 일요일 혹은 공휴일 전날 - 주말요금이 적용됩니다.</li>
	<li>입금은 다자바 전용 프로그램을 사용하시길 부탁드립니다.</li>
	<li>예약후 비수기 x시간안에 본 다자바 프로그램에 예약금 전액 입금하시고 입금확인이 안되면 별도의 통보없이 예약취소 처리 될 수 있음을 알려드립니다.</li>
	<li>펜션이나 예약에 궁금하신 점은 다자바 QA게시판으로 문의해주시면 친철하게 안내해 드립니다.</li>
	<li>펜션 이용 인원은 숙박기준이 아닌 입실기준입니다. 그러므로 예약된 인원 외 다른 사람의 방문을 제한하는 바입니다.</li>
	<li>팬션에 따라 예약된 인원 이상왔을 때이거나  애완동물과 동반 하실경우는 입실이 불가능 하실 수도 있습니다.</li>
	<li>펜션이나 예약에 궁금하신 점은 다자바의 QA게시판으로 문의해주시면 친철하게 안내해 드립니다. (전화 상담 시간 9:00 ~ 18:00)</li>
</ul>
</div>	
<div class="d div1 show3 contentBox a3"  id='dis3' style="display:none;">
<ul>
 	<li>입실 : 당일 오후 3시</li>
 	<li>퇴실 : 이용 마지막 날 오전 11시</li>
	<li>입, 퇴실시간은 반드시 준수해주세요.</li>
 	<li>오후 10시 이후 도착시에는 사전에 연락을 주셔야 합니다.</li>
 	<li>퇴실시 객실내의 사전점검을 받으시고 퇴실하시기 바랍니다.</li>
</ul> 
</div>	
<div class="e div1 show4 contentBox a4"  id='dis4' style="display:none;">
<ul>
<li>객실내에는 화재 위험 있는 양초,풍선 부착등을 삼가해주세요.</li>
<li>객실내에서는 금연이며 생선,해물등 냄새 심한 음식은 객실내에서는 조리할수 없습니다.</li>
<li>예약하신후 전액 입금하셔야만 예약이 완료됩니다.</li>
<li>입금은 예약자명으로 하시고 만약 예약자명과 다를시에는 전화를 주시면 예약이 됩니다.</li>
<li>다른이용고객에게 불편함이 없도록 23시 이후에는 무분별한 음주 및 고성방가를 자제해 주시기 바랍니다.</li>
<li>입실시 예약하신 인원에서 추가되었을 경우 퇴실조치될 수 있습니다.</li>
<li>기준인원 초과시 별도의 요금이 추가됩니다. ( 영,유아 어린이포함 )</li>
<li>애완동물은 부득이 타객실 및 손님을 위해 동반을 중지하오니 양해바랍니다.</li>
<li>객실내 냄새가 심한 음식의 조리는 금하며 지정된 장소와 바베큐장을 이용해 주시기 바랍니다. (생선,육류구이 및 튀김,청국장 등)</li>
<li>시설물 파손 및 분실에 대한 책임은 고객에게 있으므로 유의하시기 바랍니다.</li>
<li>객실내 촛불 절대 사용 금지입니다.</li>
<li>미성년자는 부모님의 동의없이 펜션을 이용할 수 없습니다.</li>
<li>쓰레기 배출시 음식물.소각용,재활용으로 구분하여 지정된 장소에 버려주시기 바랍니다.</li>
<li>부주의로 인한 안전사고, 귀중품 분실 및 파손에 대해서는 펜션에 책임을 물을 수 없습니다.</li>
</ul>
</div>	
<div class="f div1 show5 contentBox a5"  id='dis5' style="display:none;">
<ul>
<li>올바른 예약문화 정착을 위하여 다자바 안의 펜션들에게는 예약 취소 시 환불기준을 아래와 같이 운영하고 있으니, 꼭 확인을 하시고 예약해 주시기 바랍니다.</li>
<li>모든 예약의 취소시 총입금액의 10%가 공제됩니다.</li>
<li>취소 신청후 환불까지는 약 2~7일 소요됩니다.(단,토,일,공휴일은 제외됩니다)</li>
<li>환불은 입금자명으로 되면 입금시 송금수수료는 제외된 후 입금됩니다.</li>
<li>예약취소 수수료 내역은 아래와 같습니다.</li>
<li>총이용금액기준(성수기,준성수기,비성수기 포함)입니다.</li>
</ul>
<table class="t2" border="1" Style="text-align:center; height:200px;">
	<tr>
		<td width="30%">
		날짜
		(이용일 기준)
		</td>
		<td width="15%">
		7일전
		</td>
		<td width="20%">
		4 ~ 6일전
		</td>
		<td width="15%">
		3일전
		</td>
		<td width="20%">
		2일전 및 당일
		</td>
	</tr>
	<tr>
		<td rowspan="2">
		환불금액
		</td>
		<td>
		90%
		</td>
		<td>
		50%
		</td>
		<td>
		30%
		</td>
		<td>
		환불불가
		</td>
	</tr>
	<tr>
		
		<td colspan="4">
		날짜변경 불가능
		
	</tr>
</table>
</div>		
</div>		
</form>
<%@ include file="footer.jsp" %>

</body>
</html>