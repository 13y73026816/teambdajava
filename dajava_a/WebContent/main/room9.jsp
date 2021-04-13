<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.*" %>
<% ArrayList<OrderDto> alist = (ArrayList<OrderDto>)request.getAttribute("alist"); 
String busyseason1 = alist.get(0).getRbusyseason1();
String busyseason2 = alist.get(0).getRbusyseason2();
String offseason1 = alist.get(0).getRoffseason1();
String offseason2 = alist.get(0).getRoffseason2();
String rfullperson = alist.get(0).getRfullperson();
String rbaseperson = alist.get(0).getRbaseperson();
String raddperson = alist.get(0).getRaddperson();
String rbaseprice = alist.get(0).getRbaseprice();
String rsupply = alist.get(0).getRsupply();
String rfile = alist.get(0).getRfile();
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>객실</title>
		<script src="<%=request.getContextPath()%>/jquery-3.5.1.min.js"></script>
		<script src="https://kit.fontawesome.com/bd3b61eb91.js" crossorigin="anonymous"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/room.css"  />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/slick.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/slick-theme.css" />
		<script src="<%=request.getContextPath()%>/main/slick.min.js"></script>
		<script>
							
			$(document).ready(function(){ 
				
				$('.autoplay').slick({
				  slidesToShow: 1,
				  slidesToScroll: 1,
				  autoplay: true,
				  autoplaySpeed: 2000,
				});
			
				 var now = new Date();
				 var nowDayOfWeek = now.getDay();
				 var nowDay = now.getDate();
				 var nowMonth = now.getMonth();
				 var nowYear = now.getYear();
				 nowYear += (nowYear < 2000) ? 1900 : 0;	
								
				 function formatDate(date) {
				//	var myyear  = date.getFullyear();
				
				 	var mymonth = date.getMonth()+1;
				 	var myweekday = date.getDate();
				 	return (mymonth + "-" + myweekday);
				 }
				 
				 function formatDay(day){
					 var day=day;
					 var cha;
					 if((day==1)||(day==8)){
						 cha="월";
					 }else if((day==2)||(day==9)){
						 cha="화";
					 }else if((day==3)||(day==10)){
						 cha="수";
					 }else if((day==4)||(day==11)){
						 cha="목";
					 }else if((day==5)||(day==12)){
						 cha="금";
					 }else if(day==6){
						 cha="토";
					 }else if(day==7){
						 cha="일";
					 }
					 return cha;
				 }
				 
				function printWeek() {
					
					for(i=1;i<6;i++){
					
						 var date = new Date(nowYear, nowMonth, (nowDay-1)+i);
						 var sDate = formatDate(date);
						
						 var day = formatDay((nowDayOfWeek-1)+i);
						 var startDate=null;
						 var endDate=null;
						 
						 sDate = sDate.split("-");
						 	if(sDate[1].length==1){sDate[1] = "0"+sDate[1];}
						 
					//	 	var c_date=nowYear+"-"+sDate[0]+"-"+sDate[1];
					//	 	alert("c_date"+c_date);
						 	
						 sDate = sDate[0]+"/"+sDate[1]+"(";
						 if(i==1){
							 startDate = sDate[0]+"월 "+sDate[2]+sDate[3]+"일";
							 $("#sDate").val(nowYear+"년 "+startDate);
						 }else  if(i==5){
							 endDate = sDate[0]+"월 "+sDate[2]+sDate[3]+"일";
							 $("#eDate").val(nowYear+"년 "+endDate);
						 }
						$("#date"+i).text(sDate+day+")");
						
						var wday;
					 	if(((day=="토")||(day=="일"))&&((sDate[0]==6)||(sDate[0]==7)||(sDate[0]==8))){
					 		wday="성수기/주말";
					 	}else if(((day=="토")||(day=="일"))&&!((sDate[0]==6)||(sDate[0]==7)||(sDate[0]==8))){
					 		wday="비수기/주말";
					 	}else if(!((day=="토")||(day=="일"))&&((sDate[0]==6)||(sDate[0]==7)||(sDate[0]==8))){
					 		wday="성수기/주중";
					 	}else{
					 		wday="비수기/주중";
					 	}
					 	$("#peri"+i).text(wday).css("color","#28527a");
					 	
					 	var price;
					 	if(wday=="성수기/주말"){
					 		price=<%=busyseason2%>;
					 	}else if(wday=="성수기/주중"){
					 		price=<%=busyseason1%>;
					 	}else if(wday=="비수기/주말"){
					 		price=<%=offseason2 %>;
					 	}else if(wday=="비수기/주중"){
					 		price=<%=offseason1 %>;
					 	}
					 	$("#price"+i).text(price).css("color","#28527a");
					 	
					 	<%for(OrderDto odv : alist){%>
							var state;
							var Ostart = '<%=odv.getOstart().substring(0,10)  %>';
						 	var Oend = '<%=odv.getOend().substring(0,10)  %>';
						 	var Ostate = '<%=odv.getOstate() %>';  
						 	
						// 	alert("Ostart"+Ostart);
						// 	alert("Oend"+Oend);
						// 	alert("Ostate"+Ostate);
						 	
						 	var OstartD = new Date(Ostart);
						 	var OendD = new Date(Oend);
						
						 	console.log(date);
						 	console.log(OendD);
						 	console.log(date<=OendD);
						 						 	
						 	if(date>=OstartD && date<=OendD && Ostate=="완료"){
						 		state="예약완료";
						 		$("#state"+i).text(state).css("color","#810000");
						 	    continue;
						 								 		
						 	}else{
						 		state="예약가능";
						 	}
					 <%	}%>
					 $("#state"+i).text(state).css("color","#007580");
					} // for end
					
				} // printWeek
				printWeek();  
			
			});
		
			$(function(){
				var text = $('.supply').val();
				var supply = text.replace("1","TV, ").replace("2","식탁, ").replace("3","냉장고, ").replaceAll("4","드라이기, ").replace("5","취사도구, ").replace("6","전기밥솥, ").replace("7","인터넷, ").replaceAll("8","욕실용품, ").replace("9","옷장, ").replaceAll("10","에어컨 ");
							
				  $('#supply').text(supply);
				
			});
		
			 var num=1;
			 function changePic(idx) {
				 if(idx){
					if(num==3)return;
					num++;
				 }else{
					if(num==1)return;
					num--;
				 }
				 
				switch(num){
				case 1:
					$(".header").css({"background":"url(<%=request.getContextPath()%>/filefolder/rh.jpg)"});
					$(".header").css({"background-size":"cover"});
					break;
				case 2:
					$(".header").css({"background":"url(<%=request.getContextPath()%>/filefolder/r-h-living.jpg)"});
					$(".header").css({"background-size":"cover"});
					break;
				case 3:
					$(".header").css({"background":"url(<%=request.getContextPath()%>/filefolder/r1-h-bath3.png)"});
					$(".header").css({"background-size":"cover"});
					break;
				}				
				
			 }
			 function changeImg(idx){
				if(idx==1){
					$(".header").css({"background":"url(<%=request.getContextPath()%>/filefolder/rh.jpg)"});
					$(".header").css({"background-size":"cover"});
				}else if(idx==2){
					$(".header").css({"background":"url(<%=request.getContextPath()%>/filefolder/r-h-living.jpg)"});
					$(".header").css({"background-size":"cover"});
				}else if(idx==3){
					$(".header").css({"background":"url(<%=request.getContextPath()%>/filefolder/r1-h-bath3.png)"});
					$(".header").css({"background-size":"cover"});
				}
			}
			 
			 var isVisible = false;

				$(window).on('scroll',function() {
					if (checkVisible($('#r_tit'))&&!isVisible) {
						$("#r_tit").css("opacity","0").css("animation-name","fadeInUp3")
						.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
						.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
						isVisible=false;
					}
					
					if (checkVisible($('#r_info'))&&!isVisible) {
						$("#r_info").css("opacity","0").css("animation-name","fadeInUp2")
						.css("-webkit-animation-name","fadeInUp2").css("animation-duration","1s")
						.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
						isVisible=false;
					}
					
					if (checkVisible($('#room_info'))&&!isVisible) {
						$("#room_info").css("opacity","0").css("animation-name","fadeInUp1")
						.css("-webkit-animation-name","fadeInUp1").css("animation-duration","1s")
						.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
						isVisible=true;		
					}
						
				});	
				
							
				function checkVisible( elm, eval ) {
					eval = eval || "object visible";
					var viewportHeight = $(window).height(); // Viewport Height
					var	scrolltop = $(window).scrollTop(); // Scroll Top
					if($(elm).offset()){
						var	y = $(elm).offset().top;
						var	elementHeight = $(elm).height();   
					}
					if (eval == "object visible") return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
					if (eval == "above") return ((y < (viewportHeight + scrolltop)));
				}
				
				function check(){
					
					var lastDate = $("#eDate").val();
					var resultDate = lastDate.replace("년","-").replace("월","-").replace("일","").replaceAll(" ","");
					var resultDateArray = resultDate.split("-");
				
					for(i=1;i<6;i++){
						var date = new Date(resultDateArray[0], Number(resultDateArray[1])-1, Number(resultDateArray[2])+i);
						var sDate = (Number(date.getMonth())+1)+"/"+date.getDate();
						var day ="";
						var nowYear = date.getYear();
						nowYear += (nowYear < 2000) ? 1900 : 0;
						
						switch(date.getDay()){
							case 0:
								day = "일";
								break;
							case 1:
								day = "월";
								break;
							case 2:
								day = "화";
								break;
							case 3:
								day = "수";
								break;
							case 4:
								day = "목";
								break;
							case 5:
								day = "금";
								break;
							case 6:
								day = "토";
								break;
							default:
								day="오류";
						
						}
						
				
						//기준일 가져오는것 까지 완료
						
						
						 var startDate=null;
						 var endDate=null;
						 
						 sDate = sDate.split("/");
						 if(sDate[1].length==1){sDate[1] = "0"+sDate[1];}
						 
						 sDate = sDate[0]+"/"+sDate[1]+"(";
						 if(i==1){
							 startDate = sDate[0]+"월 "+sDate[2]+sDate[3]+"일";
				
							 $("#sDate").val(nowYear+"년 "+startDate);
						 }else  if(i==5){
							 endDate = sDate[0]+"월 "+sDate[2]+sDate[3]+"일";
							 
							
							 $("#eDate").val(nowYear+"년 "+endDate);
						 }
						$("#date"+i).text(sDate+day+")");
						
						var wday;
						
					 	if(((day=="토")||(day=="일"))&&((sDate[0]==6)||(sDate[0]==7)||(sDate[0]==8))){
					 		wday="성수기/주말";
					 	}else if(((day=="토")||(day=="일"))&&!((sDate[0]==6)||(sDate[0]==7)||(sDate[0]==8))){
					 		wday="비수기/주말";
					 	}else if(!((day=="토")||(day=="일"))&&((sDate[0]==6)||(sDate[0]==7)||(sDate[0]==8))){
					 		wday="성수기/주중";
					 	}else{
					 		wday="비수기/주중";
					 	}
					 	$("#peri"+i).text(wday).css("color","#28527a");
					 	
					 	var price;
					 	if(wday=="성수기/주말"){
					 		price=<%=busyseason2%>;
					 	}else if(wday=="성수기/주중"){
					 		price=<%=busyseason1%>;
					 	}else if(wday=="비수기/주말"){
					 		price=<%=offseason2 %>;
					 	}else if(wday=="비수기/주중"){
					 		price=<%=offseason1 %>;
					 	}
					 	$("#price"+i).text(price).css("color","#28527a");
					 	
					 	<%for(OrderDto odv : alist){%>
							var state;
							var Ostart = '<%=odv.getOstart().substring(0,10)  %>';
						 	var Oend = '<%=odv.getOend().substring(0,10)  %>';
						 	var Ostate = '<%=odv.getOstate() %>';  
						 	
						 	
						 	var OstartD = new Date(Ostart);
						 	var OendD = new Date(Oend);
						 						 	
						 	if(date>=OstartD && date<=OendD && Ostate=="완료"){
						 		state="예약완료";
						 		$("#state"+i).text(state).css("color","#810000");
						 	    continue;
						 								 		
						 	}else{
						 		state="예약가능";
						 	}
					 <%	}%> 
					 $("#state"+i).text(state).css("color","#007580");
					} // for end  
				} 
				
				function check_b(){
					
					var lastDate = $("#sDate").val();
					var resultDate = lastDate.replace("년","-").replace("월","-").replace("일","").replaceAll(" ","");
					var resultDateArray = resultDate.split("-");
				
					for(i=1;i<6;i++){
						var date = new Date(resultDateArray[0], Number(resultDateArray[1])-1, Number(resultDateArray[2])+i-6);
						var sDate = (Number(date.getMonth())+1)+"/"+date.getDate();
						var day ="";
						var nowYear = date.getYear();
						var date_t=new Date();
						nowYear += (nowYear < 2000) ? 1900 : 0;
												
						switch(date.getDay()){
							case 0:
								day = "일";
								break;
							case 1:
								day = "월";
								break;
							case 2:
								day = "화";
								break;
							case 3:
								day = "수";
								break;
							case 4:
								day = "목";
								break;
							case 5:
								day = "금";
								break;
							case 6:
								day = "토";
								break;
							default:
								day="오류";
						
						}
					
						 var startDate=null;
						 var endDate=null;
						 
						 sDate = sDate.split("/");
						 if(sDate[1].length==1){sDate[1] = "0"+sDate[1];}
						 
						 sDate = sDate[0]+"/"+sDate[1]+"(";
						 if(i==1){
							 startDate = sDate[0]+"월 "+sDate[2]+sDate[3]+"일";
				
							 $("#sDate").val(nowYear+"년 "+startDate);
						 }else  if(i==5){
							 endDate = sDate[0]+"월 "+sDate[2]+sDate[3]+"일";
							 
							 $("#eDate").val(nowYear+"년 "+endDate);
						 }
						$("#date"+i).text(sDate+day+")");
						
						var wday;
						
					 	if(((day=="토")||(day=="일"))&&((sDate[0]==6)||(sDate[0]==7)||(sDate[0]==8))){
					 		wday="성수기/주말";
					 	}else if(((day=="토")||(day=="일"))&&!((sDate[0]==6)||(sDate[0]==7)||(sDate[0]==8))){
					 		wday="비수기/주말";
					 	}else if(!((day=="토")||(day=="일"))&&((sDate[0]==6)||(sDate[0]==7)||(sDate[0]==8))){
					 		wday="성수기/주중";
					 	}else{
					 		wday="비수기/주중";
					 	}
					 	$("#peri"+i).text(wday).css("color","#28527a");
					 	
					 	var price;
					 	if(wday=="성수기/주말"){
					 		price=<%=busyseason2%>;
					 	}else if(wday=="성수기/주중"){
					 		price=<%=busyseason1%>;
					 	}else if(wday=="비수기/주말"){
					 		price=<%=offseason2 %>;
					 	}else if(wday=="비수기/주중"){
					 		price=<%=offseason1 %>;
					 	}
					 	$("#price"+i).text(price).css("color","#28527a");
					 	
					 	<%for(OrderDto odv : alist){%>
							var state;
							var Ostart = '<%=odv.getOstart().substring(0,10)  %>';
						 	var Oend = '<%=odv.getOend().substring(0,10)  %>';
						 	var Ostate = '<%=odv.getOstate() %>';  
						 	
						 	
						 	var OstartD = new Date(Ostart);
						 	var OendD = new Date(Oend);
						 						 	
						 	if(date<date_t){
						 		state="종료";
						 		$("#state"+i).text(state).css("color","#28527a");
						 		continue;
						 	}else if(date>=OstartD && date<=OendD && Ostate=="완료"){
						 		state="예약완료";
						 		$("#state"+i).text(state).css("color","#810000");
						 	    continue;			 		
						 	}else{
						 		state="예약가능";
						 	}
					 <%	}%> 
					 $("#state"+i).text(state).css("color","#007580");
					} // for end  
				} 
				
		</script>
		<style>
			.header {
			  width: 100%;
			  height: 100vh;
			  background:url('<%=request.getContextPath()%>/filefolder/rh.jpg');
			  background-size:cover;
			  position:relative;
			}
			
			.room_date input,.t2 input{
				border:none;
				text-align:center;
				width:130px;
				height:30px;
				font-size:1rem;
			}
			
			.t1 input{
				border:none;
				text-align:center;
				width:100px;
				height:30px;
				font-size:1rem;
				background:#ececec;
			}
			
			@keyframes fadeInUp1 {
				from {
					transform: translate3d(1900px,0,0)
				}
				to {
					transform: translate3d(0,0,0);
					opacity: 1
				}
			}

			@-webkit-keyframes fadeInUp1 {
				from {
					transform: translate3d(1900px,0,0)
				}  
				to {
					transform: translate3d(0,0,0);
					opacity: 1
				}
			}

			@keyframes fadeInUp2 {
				from {
					transform: translate3d(0,200px,0)
				}
				to {
					transform: translate3d(0,0,0);
					opacity: 1
				}
			}

			@-webkit-keyframes fadeInUp2 {
				from {
					transform: translate3d(0,200px,0)
				}
				to {
					transform: translate3d(0,0,0);
					opacity: 1
				}
			}
			
			@keyframes fadeInUp3 {
				from {
					transform: translate3d(0,-200px,0)
				}
				to {
					transform: translate3d(0,0,0);
					opacity: 1
				}
			}

			@-webkit-keyframes fadeInUp3 {
				from {
					transform: translate3d(0,-200px,0)
				}
				to {
					transform: translate3d(0,0,0);
					opacity: 1
				}
			}
			
			.but10{
				width:2rem; 
				height:2rem;
				color:#ececec;
				z-index:-1;
			}
			
			.but20{
				width:2rem; 
				height:2rem;
				color:#ececec;
				z-index:-1;
			}
			
			.but_10{
				color:#2c2c2c;
				font-size:1.5rem;
			}
			
			.but_20{
				color:#2c2c2c;
				font-size:1.5rem;
			}
			
			.col{
				color:#c15050;
			}
			
			.t3{
				color:#c15050;
			}
		</style>
	</head>
	<body>
	<%@ include file="../header.jsp" %>
		<div class="header">
		<button class="but1" onclick="changePic(0)"><i class="fas fa-chevron-left"></i></button>
		<button class="but2" onclick="changePic(1)"><i class="fas fa-chevron-right"></i></button>
		<i class="fas fa-angle-double-down fa1"></i>
		<div class="btn">
			<button class="bn btn1" onclick="changeImg(1)"></button>
			<button class="bn btn2" onclick="changeImg(2)"></button>
			<button class="bn btn3" onclick="changeImg(3)"></button>
		</div>
		</div>
		<section>
	
		<div id="r_tit" class="r_tit">
   			<h1>본관101</h1>
   			<h2>완주의 대자연을 품은 다자바 돌체의 탁트인 전망</h2>
   		</div>
	<div id="r_info" class="r_info">
		<div class="img_r"><img style="width:35rem; height:30rem;" src="<%=request.getContextPath()%>/filefolder/<%=rfile%>" ></div>
		<div class="bet"><a></a></div>
       		<div id="room_des">
				<ul class="room_data">				                
					<li>
						구조넓이
							<p>&nbsp;&nbsp;&nbsp;&nbsp;거실1+화장실1+침대룸A(퀸1)</p><p>17평(약56㎡)</p><p>테라스바베큐가능</p>
					</li>
					<li>
						기준인원<p/>
						<span class="col">&nbsp;&nbsp;&nbsp;&nbsp;기준 <%=rbaseperson %>명 ~ 최대<%=rfullperson %>명</span> / 2명 초과시 추가요금 발생
						<table class="ta1" width="100%;">
						<tr>
						   <th width="40%;">시즌</th>
							<th>성인</th>
							<th>아동</th>
							<th>유아</th>
						</tr>
						<tr  class="col">
							<td>비수기(공통)</td>
							<td><%=raddperson %>원</td>
							<td><%=raddperson %>원</td>
							<td><%=raddperson %>원</td>
						</tr>
						<tr>
							<td colspan=4><input type="hidden" class="supply" value="<%=rsupply %>"></td>
						</tr>
						</table>
					</li>
					<li>
						구비시설<p/>
						<div>&nbsp;&nbsp;&nbsp;&nbsp;<span class="col" id="supply"></span></div>
					</li>
					<li>
						특이사항<p/>
						&nbsp;&nbsp;&nbsp;&nbsp;없음
					</li>
				</ul>
	        </div>
	    </div>
		
		<div id="room_info" class="room_info">
		<div class="room_date">
		<span><button class="but10" onclick="check_b();return false;"><i class="fas fa-chevron-left but_10"></i></button></span>
		<span><input type="text" id="sDate"> ~ <input type="text" id="eDate"></span>
		<span><button class="but20" onclick="check();return false;"><i class="fas fa-chevron-right but_20"></i></button></span>
		</div><br>
		
		
			<table class="table2">
				<tr class="t1" style="height:2.5rem; background:#ececec;">
					<td><div id="date1"></div></td>
					<td><div id="date2"></div></td>
					<td><div id="date3"></div></td>
					<td><div id="date4"></div></td>
					<td><div id="date5"></div></td>
				</tr>
				<tr class="t2" style="height:2.5rem;">
					<td><div id="peri1"></div></td>
					<td><div id="peri2"></div></td>
					<td><div id="peri3"></div></td>
					<td><div id="peri4"></div></td>
					<td><div id="peri5"></div></td>
				</tr>
				
				<tr class="t2" style="height:5rem;">
					<td><div id="price1"></div></td>
					<td><div id="price2"></div></td>
					<td><div id="price3"></div></td>
					<td><div id="price4"></div></td>
					<td><div id="price5"></div></td>
				</tr>
				<tr class="t1 t3" style="height:2.5rem; background:#ececec;">
					<td><div id="state1"></div></td>
					<td><div id="state2"></div></td>
					<td><div id="state3"></div></td>
					<td><div id="state4"></div></td>
					<td><div id="state5"></div></td>
				</tr>
			</table>
		</div>
	
		<div class="pic">
		<h2><img src="<%=request.getContextPath()%>/filefolder/r_bottom1.jpg" width="80%"></h2>
		<span><img src="<%=request.getContextPath()%>/filefolder/r_bottom2.png" width="38%"></span>
		<span><img src="<%=request.getContextPath()%>/filefolder/r_bottom3.jpg" width="38%"></span>
		</div>
		<div class="room_title">
			<h2><img src="<%=request.getContextPath()%>/filefolder/text_room.png"></h2>
		</div>
			
	<div class="slider autoplay">
			<div class="view">
				<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/room1-1.jpg"></div>
				<div class="tbox">
					<h3>A 101</h3>
				<h4>
					자연과 함께하는 즐거운 시간들.<br>
					다자바돌체
				</h4>
				<h5><b>56㎡</b></h5>
				<h5>
					심플한 모던인테리어 거실, 피톤치드가 가득한 편백나무 침실,<br>
					바비큐를 즐길 수 있는 넓은테라스, 산과 계곡 전망
				</h5>
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room1.do" tabindex="-1">자세히 보기</a></button>
				</div>
			</div>		
			<div class="view">
				<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/room2-1.jpg"></div>
				<div class="tbox">
					<h3>A 102</h3>
				<h4>
					자연과 함께하는 즐거운 시간들.<br>
					다자바돌체
				</h4>
				<h5><b>56㎡</b></h5>
				<h5>
					심플한 모던인테리어 거실, 피톤치드가 가득한 편백나무 침실,<br>
					바비큐를 즐길 수 있는 넓은테라스, 산과 계곡 전망
				</h5>
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room2.do" tabindex="-1">자세히 보기</a></button>
				</div>
			</div>
			<div class="view">
				<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/room3-1.jpg"></div>
				<div class="tbox">
					<h3>A 201</h3>
				<h4>
					자연과 함께하는 즐거운 시간들.<br>
					다자바돌체
				</h4>
				<h5><b>80㎡</b></h5>
				<h5>
					심플한 모던인테리어의 복층구조, 피톤치드가 가득한 편백나무 천장과<br>
					하늘 창이 있는 복층 침실, 바비큐를 즐길 수 있는 넓은테라스,<br>
					 산과 계곡 전망
				</h5>
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room3.do" tabindex="-1">자세히 보기</a></button>
				</div>
			</div>
			<div class="view">
				<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/room4-1.jpg"></div>
				<div class="tbox">
					<h3>A 202</h3>
				<h4>
					자연과 함께하는 즐거운 시간들.<br>
					다자바돌체
				</h4>
				<h5><b>80㎡</b></h5>
				<h5>
					심플한 모던인테리어의 복층구조, 피톤치드가 가득한 편백나무 천장과<br>
					하늘 창이 있는 복층 침실, 바비큐를 즐길 수 있는 넓은테라스,<br>
					 산과 계곡 전망
				</h5>
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room4.do" tabindex="-1">자세히 보기</a></button>
				</div>
			</div>
			<div class="view">
				<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/room5-1.jpg"></div>
				<div class="tbox">
					<h3>C 101</h3>
				<h4>
					자연과 함께하는 즐거운 시간들.<br>
					다자바돌체
				</h4>
				<h5><b>80㎡</b></h5>
				<h5>
					심플한 모던인테리어의 복층구조, 피톤치드가 가득한 편백나무 천장과<br>
					하늘 창이 있는 복층 침실, 바비큐를 즐길 수 있는 넓은테라스,<br>
					 산과 계곡 전망
				</h5>
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room5.do" tabindex="-1">자세히 보기</a></button>
				</div>
			</div>
			<div class="view">
				<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/room6-1.png"></div>
				<div class="tbox">
					<h3>C 102</h3>
				<h4>
					자연과 함께하는 즐거운 시간들.<br>
					다자바돌체
				</h4>
				<h5><b>80㎡</b></h5>
				<h5>
					심플한 모던인테리어의 복층구조, 피톤치드가 가득한 편백나무 천장과<br>
					하늘 창이 있는 복층 침실, 바비큐를 즐길 수 있는 넓은테라스,<br>
					 산과 계곡 전망
				</h5>
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room6.do" tabindex="-1">자세히 보기</a></button>
				</div>
			</div>
			<div class="view">
				<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/room7-1.jpg"></div>
				<div class="tbox">
					<h3>C 201</h3>
				<h4>
					자연과 함께하는 즐거운 시간들.<br>
					다자바돌체
				</h4>
				<h5><b>80㎡</b></h5>
				<h5>
					심플한 모던인테리어의 복층구조, 피톤치드가 가득한 편백나무 천장과<br>
					하늘 창이 있는 복층 침실, 바비큐를 즐길 수 있는 넓은테라스,<br>
					 산과 계곡 전망
				</h5>
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room7.do" tabindex="-1">자세히 보기</a></button>
				</div>
			</div>
			<div class="view">
				<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/room8-1.jpg"></div>
				<div class="tbox">
					<h3>C 202</h3>
				<h4>
					자연과 함께하는 즐거운 시간들.<br>
					다자바돌체
				</h4>
				<h5><b>80㎡</b></h5>
				<h5>
					심플한 모던인테리어의 복층구조, 피톤치드가 가득한 편백나무 천장과<br>
					하늘 창이 있는 복층 침실, 바비큐를 즐길 수 있는 넓은테라스,<br>
					 산과 계곡 전망
				</h5>
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room8.do" tabindex="-1">자세히 보기</a></button>
				</div>
			</div>
			<div class="view">
				<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/h_room.jpg"></div>
				<div class="tbox">
					<h3>본관 101</h3>
				<h4>
					자연과 함께하는 즐거운 시간들.<br>
					다자바돌체
				</h4>
				<h5><b>80㎡</b></h5>
				<h5>
					심플한 모던인테리어의 복층구조, 피톤치드가 가득한 편백나무 천장과<br>
					하늘 창이 있는 복층 침실, 바비큐를 즐길 수 있는 넓은테라스,<br>
					 산과 계곡 전망
				</h5>
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room9.do" tabindex="-1">자세히 보기</a></button>
				</div>
			</div>
			<div class="view">
				<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/room9-1.png"></div>
				<div class="tbox">
					<h3>황토방1</h3>
				<h4>
					자연과 함께하는 즐거운 시간들.<br>
					다자바돌체
				</h4>
				<h5><b>80㎡</b></h5>
				<h5>
					심플한 모던인테리어의 복층구조, 피톤치드가 가득한 편백나무 천장과<br>
					하늘 창이 있는 복층 침실, 바비큐를 즐길 수 있는 넓은테라스,<br>
					 산과 계곡 전망
				</h5>
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room10.do" tabindex="-1">자세히 보기</a></button>
				</div>
			</div>
			<div class="view">
				<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/y_room.png"></div>
				<div class="tbox">
					<h3>황토방2</h3>
				<h4>
					자연과 함께하는 즐거운 시간들.<br>
					다자바돌체
				</h4>
				<h5><b>40㎡</b></h5>
				<h5>
					외벽과 내부 100%황토, 흙으로 구운 점토기와 <br>
					실내는 전통한지와 전통 종이 장판으로 이루어진 아늑한 공간
				</h5>
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room11.do" tabindex="-1">자세히 보기</a></button>
				</div>
			</div>
		</div>
		
		</section>
		<%@ include file="../footer.jsp" %>
	</body>
</html>
