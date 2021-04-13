<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%String name = (String)session.getAttribute("name"); 
String grade = (String)session.getAttribute("grade");
String focus = (String)request.getAttribute("focus"); %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>special</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="<%=request.getContextPath()%>/jquery-3.5.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/special_.css" />
		<script src="https://kit.fontawesome.com/bd3b61eb91.js" crossorigin="anonymous"></script>
		<script>
			$(".top li").hover(function() {
				$(this).children("ul").stop().slideToggle();
			 });	
			

			$(document).ready(function(){ 
				$(window).scroll(function(){  
					var scroll = $(window).scrollTop();
				
					if(scroll>1){   
						 if ($('header').width() <= 1000 ){
							 $(".top>li a").css("color","#202020");
					    	 $(".sub>li a").css("color","#fff");
					     }else{
				    	     $(".hd").css("background","rgba(0,119,0,0.5)");
						     $(".hd>a").css("float","left");
							 $(".top>li a").css("color","#fff");				    	  
					       }
					} else{
						$(".hd").css("background","");
						$(".top>li a").css("color","#121013");
						$(".sub>li a").css("color","#fff"); 
					}
				});
				
				var focus = '<%=focus%>';
				if(focus == "sp01"){
					var offset = $('#sp01').offset();
					 $('html').scrollTop(offset.top);
				}else if(focus == "sp02"){
					var offset = $('#sp02').offset();
					 $('html').scrollTop(offset.top);
				}else if(focus == "sp03"){
					var offset = $('#sp03').offset();
					 $('html').scrollTop(offset.top);
				}else if(focus == "sp04"){
					var offset = $('#sp04').offset();
					 $('html').scrollTop(offset.top);
				}else if(focus == "sp05"){
					var offset = $('#sp05').offset();
					 $('html').scrollTop(offset.top);
				}else if(focus == "sp06"){
					var offset = $('#sp06').offset();
					 $('html').scrollTop(offset.top);
				}
				
							
			if (checkVisible($('#sp1'))&&!isVisible) {
				$("#sp1").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
		
			const toggleBtn = document.querySelector('.toogleBtn');
			const top=document.querySelector('.top');
				
				toggleBtn.addEventListener('click',()=>{
					top.classList.toggle('active');
				});
			});	
		
			 var num=1;
			 function changePic1(idx) {
				 if(idx){
					if(num==3)return;
					num++;
				 }else{
					if(num==1)return;
					num--;
				 }
				 
				switch(num){
				case 1:
					$(".sp1").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp1_1.jpg)"});
					$(".sp1").css({"background-size":"cover"});
					break;
				case 2:
					$(".sp1").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp1_2.jpg)"});
					$(".sp1").css({"background-size":"cover"});
					break;
				case 3:
					$(".sp1").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp1_3.jpg)"});
					$(".sp1").css({"background-size":"cover"});
					break;
				
				}	
			 }
			 
			 function changePic2(idx) {
				 if(idx){
					if(num==3)return;
					num++;
				 }else{
					if(num==1)return;
					num--;
				 }
				 
			 switch(num){
				case 1:
					$(".sp2").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp2-2.jpg)"});
					$(".sp2").css({"background-size":"cover"});
					break;
				case 2:
					$(".sp2").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp2-1.png)"});
					$(".sp2").css({"background-size":"cover"});
					break;
				case 3:
					$(".sp2").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp2-3.jpg)"});
					$(".sp2").css({"background-size":"cover"});
					break;
				
				}	
			 }
			 
			 
			 function changePic3(idx) {
				 if(idx){
					if(num==3)return;
					num++;
				 }else{
					if(num==1)return;
					num--;
				 }
				 
			 switch(num){
				case 1:
					$(".sp3").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp3-1.jpg)"});
					$(".sp3").css({"background-size":"cover"});
					break;
				case 2:
					$(".sp3").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp3-2.jpg)"});
					$(".sp3").css({"background-size":"cover"});
					break;
				case 3:
					$(".sp3").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp3-1.jpg)"});
					$(".sp3").css({"background-size":"cover"});
					break;
				
				}	
			 }
			 
			 
			 function changePic4(idx) {
				 if(idx){
					if(num==3)return;
					num++;
				 }else{
					if(num==1)return;
					num--;
				 }
				 
			 switch(num){
				case 1:
					$(".sp4").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp4-1.jpg)"});
					$(".sp4").css({"background-size":"cover"});
					break;
				case 2:
					$(".sp4").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp4-2.jpg)"});
					$(".sp4").css({"background-size":"cover"});
					break;
				case 3:
					$(".sp4").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp4-1.jpg)"});
					$(".sp4").css({"background-size":"cover"});
					break;
				
				}	
			 }
			 
			 function changePic5(idx) {
				 if(idx){
					if(num==3)return;
					num++;
				 }else{
					if(num==1)return;
					num--;
				 }
				 
			 switch(num){
				case 1:
					$(".sp5").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp5-1.png)"});
					$(".sp5").css({"background-size":"cover"});
					break;
				case 2:
					$(".sp5").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp5-2.jpg)"});
					$(".sp5").css({"background-size":"cover"});
					break;
				case 3:
					$(".sp5").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp5-3.jpg)"});
					$(".sp5").css({"background-size":"cover"});
					break;
				
				}	
			 }
			 
			 function changePic6(idx) {
				 if(idx){
					if(num==3)return;
					num++;
				 }else{
					if(num==1)return;
					num--;
				 }
				 
			 switch(num){
				case 1:
					$(".sp6").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp6-1.jpg)"});
					$(".sp6").css({"background-size":"cover"});
					break;
				case 2:
					$(".sp6").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp6-2.jpg)"});
					$(".sp6").css({"background-size":"cover"});
					break;
				case 3:
					$(".sp6").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp6-1.jpg)"});
					$(".sp6").css({"background-size":"cover"});
					break;
				
				}	
			 }
			 
			 function changeImg1(idx){
				if(idx==1){
					$(".sp1").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp1_1.jpg)"});
					$(".sp1").css({"background-size":"cover"});
				}else if(idx==2){
					$(".sp1").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp1_2.jpg)"});
					$(".sp1").css({"background-size":"cover"});
				}else if(idx==3){
					$(".sp1").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp1_3.jpg)"});
					$(".sp1").css({"background-size":"cover"});
				}
			}
			 
			 function changeImg2(idx){
					if(idx==1){
						$(".sp2").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp2-2.jpg)"});
						$(".sp2").css({"background-size":"cover"});
					}else if(idx==2){
						$(".sp2").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp2-1.png)"});
						$(".sp2").css({"background-size":"cover"});
					}else if(idx==3){
						$(".sp2").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp2-3.jpg)"});
						$(".sp2").css({"background-size":"cover"});
					}
				}
			 
			 function changeImg3(idx){
					if(idx==1){
						$(".sp3").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp3-1.jpg)"});
						$(".sp3").css({"background-size":"cover"});
					}else if(idx==2){
						$(".sp3").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp3-2.jpg)"});
						$(".sp3").css({"background-size":"cover"});
					}else if(idx==3){
						$(".sp3").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp3-1.jpg)"});
						$(".sp3").css({"background-size":"cover"});
					}
				}
			 
			 function changeImg4(idx){
					if(idx==1){
						$(".sp4").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp4-1.jpg)"});
						$(".sp4").css({"background-size":"cover"});
					}else if(idx==2){
						$(".sp4").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp4-2.jpg)"});
						$(".sp4").css({"background-size":"cover"});
					}else if(idx==3){
						$(".sp4").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp4-1.jpg)"});
						$(".sp4").css({"background-size":"cover"});
					}
				}
			 
			 function changeImg5(idx){
					if(idx==1){
						$(".sp5").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp5-1.png)"});
						$(".sp5").css({"background-size":"cover"});
					}else if(idx==2){
						$(".sp5").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp5-2.jpg)"});
						$(".sp5").css({"background-size":"cover"});
					}else if(idx==3){
						$(".sp5").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp5-1.png)"});
						$(".sp5").css({"background-size":"cover"});
					}
				}
			 
			 function changeImg6(idx){
					if(idx==1){
						$(".sp6").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp6-1.jpg)"});
						$(".sp6").css({"background-size":"cover"});
					}else if(idx==2){
						$(".sp6").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp6-2.jpg)"});
						$(".sp6").css({"background-size":"cover"});
					}else if(idx==3){
						$(".sp6").css({"background":"url(<%=request.getContextPath()%>/filefolder/sp6-1.jpg)"});
						$(".sp6").css({"background-size":"cover"});
					}
				}
			
			var isVisible = false;

		$(window).on('scroll',function() {
			if (checkVisible($('#sp1'))&&!isVisible) {
				$("#sp1").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('#sp2'))&&!isVisible) {
				$("#sp2").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('#sp3'))&&!isVisible) {
				$("#sp3").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('#sp4'))&&!isVisible) {
				$("#sp4").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('#sp5'))&&!isVisible) {
				$("#sp5").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('#sp6'))&&!isVisible) {
				$("#sp6").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
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
		
		
		</script>
		<style>
			.copy2 a{
				color:#fff;
			}
		</style>
	</head>
	<body>
		<header>
		<div class="hd">
			<div class="logo">
				<a href="<%=request.getContextPath()%>/path/index.do"><img src="<%=request.getContextPath()%>/filefolder/dajava_logo.png" width="100px" height="50px"></a>
			</div>
			<div class="container">
			<ul class="top">
				<li><a href="<%=request.getContextPath()%>/path/outside.do">PROLOGUE</a>
					<ul class="sub sub1">
						<li><a href="<%=request.getContextPath()%>/path/outside.do">외부전경</a></li>
						<li><a href="<%=request.getContextPath()%>/path/map.do">오시는 길</a></li>
					</ul>
				</li>
				<li><a href="<%=request.getContextPath()%>/path/room1.do">ROOM</a>
					<ul class="sub sub2">
						<li><a href="<%=request.getContextPath()%>/path/room1.do">A 101</a></li>
						<li><a href="<%=request.getContextPath()%>/path/room2.do">A 102</a></li>
						<li><a href="<%=request.getContextPath()%>/path/room3.do">A 201</a></li>
						<li><a href="<%=request.getContextPath()%>/path/room4.do">A 202</a></li>
						<li><a href="<%=request.getContextPath()%>/path/room5.do">C 101</a></li>
						<li><a href="<%=request.getContextPath()%>/path/room6.do">C 102</a></li>
						<li><a href="<%=request.getContextPath()%>/path/room7.do">C 201</a></li>
						<li><a href="<%=request.getContextPath()%>/path/room8.do">C 202</a></li>
						<li><a href="<%=request.getContextPath()%>/path/room9.do">본관101</a></li>
						<li><a href="<%=request.getContextPath()%>/path/room10.do">황토방 1</a></li>
						<li><a href="<%=request.getContextPath()%>/path/room11.do">황토방 2</a></li>
					</ul>
				</li>
				<li><a href="<%=request.getContextPath()%>/path/special1.do">SPECIAL</a>
					<ul class="sub sub3">
						<li><a href="<%=request.getContextPath()%>/path/special1.do">바비큐장</a></li> 
						<li><a href="<%=request.getContextPath()%>/path/special2.do">야외수영장</a></li>
						<li><a href="<%=request.getContextPath()%>/path/special3.do">스파</a></li>
						<li><a href="<%=request.getContextPath()%>/path/special4.do">펜션 앞 계곡</a></li>
						<li><a href="<%=request.getContextPath()%>/path/special5.do">운동시설</a></li>
						<li><a href="<%=request.getContextPath()%>/path/special6.do">세미나실</a></li>
						
					</ul>
				</li>
				<li><a href="<%=request.getContextPath()%>/path/travel.do">TRAVEL</a>
					<ul class="sub sub4">
						<li><a href="<%=request.getContextPath()%>/path/travel.do">주변여행지</a></li>
					</ul>
				</li>
				<li><a href="<%=request.getContextPath()%>/path/info_res.do">RESERVE</a>
					<ul class="sub sub5">
						<li><a href="<%=request.getContextPath()%>/path/info_res.do">종합예약안내</a></li>
						<li><a href="<%=request.getContextPath()%>/reserve/reserveState.do" target="_blank">실시간 예약</a></li>
					</ul>
				</li>
				<li><a href="<%=request.getContextPath()%>/community/50.do">COMMUNTY</a> 
					<ul class="sub sub6">
						<li><a href="<%=request.getContextPath()%>/community/50.do">공지사항</a></li>
						<li><a href="<%=request.getContextPath()%>/community/54.do">Q&A</a></li>
						<li><a href="<%=request.getContextPath()%>/community/52.do">리뷰</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="login">
			<% if(name != null  && !name.equals("")){	%>
				<div id="log1"><a href="<%=request.getContextPath()%>/mypage/mypage.do" class="login_a" target="_blank">마이페이지</a>|<a href="<%=request.getContextPath()%>/mypage/memberlogout.do" class="login_a">로그아웃</a></div>	
			<% }else{	%>
				<div id="log2"><a href="<%=request.getContextPath()%>/mypage/memberjoin.do" class="login_a">회원가입</a>|<a href="<%=request.getContextPath()%>/mypage/memberlogin.do" class="login_a">로그인</a></div>
			<%	}%>				
			</div>
		<a href="#" class="toogleBtn"><i class="fas fa-bars"></i></a>
		</div>
		<div id="spcont1">
			<h1>SPECIAL</h1>
			<h3>다자바돌체만의 즐길거리</h3>
		</div>
		</header>
		<section>
		
		
			<div id="spe">
			
			<a id="sp01"></a>
			<div class="sp_cont" >
				<div class="sp1" id="sp1">
				<button class="but1" onclick="changePic1(0)"><i class="fas fa-chevron-left"></i></button>
				<button class="but2" onclick="changePic1(1)"><i class="fas fa-chevron-right"></i></button>
				<i class="fas fa-angle-double-down fa1"></i>
				<div class="btn">
					<button class="bn btn1" onclick="changeImg1(1)"></button>
					<button class="bn btn2" onclick="changeImg1(2)"></button>
					<button class="bn btn3" onclick="changeImg1(3)"></button>
				</div>
				</div>
				<div class="sp_txt">
					<h1 style="color:#b2942d;">Delicious Barbecue</h1>
					<h2>자연과 함께하는 맛있는 바비큐파티!</h2><p/>
					<h3>_________________________<p/><br></h3><p/>
					<h3>개별테라스에서 즐기는 맛있는 바비큐!<br>
			            숯, 그릴 이용료 : 중-20,000원, 대-30,0000원</h3>
				</div>
			</div>
			<!-- // -->
			<!-- 2 -->
			<a id="sp02" ></a>
			<div class="sp_cont" id="sp2">
				<div class="sp2">
				<button class="but1" onclick="changePic2(0)"><i class="fas fa-chevron-left"></i></button>
				<button class="but2" onclick="changePic2(1)"><i class="fas fa-chevron-right"></i></button>
				<i class="fas fa-angle-double-down fa1"></i>
				<div class="btn">
					<button class="bn btn1" onclick="changeImg2(1)"></button>
					<button class="bn btn2" onclick="changeImg2(2)"></button>
					<button class="bn btn3" onclick="changeImg2(3)"></button>
				</div>
				</div>
				<div class="sp_txt">
					<h1 style="color:#234b93;">Swimming Pool</h1>
					<h2>넓게 탁 트인 수영장!</h2>
					<h3>_________________________<br></h3><p/>
					<h3>
						수시로 솟아나는 천연 용천수로 가득채워 <br>
				깨끗하고 시원한 수영장(수심 : 30~80cm) <br>
				이용시간 : AM 10:00 ~ PM 7:00
					</h3>
				</div>
			</div>
			<!-- // -->
			<!-- 3 -->
			<a id="sp03"></a>
			<div class="sp_cont" id="sp3">
				<div class="sp3">
				<button class="but1" onclick="changePic3(0)"><i class="fas fa-chevron-left"></i></button>
				<button class="but2" onclick="changePic3(1)"><i class="fas fa-chevron-right"></i></button>
				<i class="fas fa-angle-double-down fa1"></i>
				<div class="btn">
					<button class="bn btn1" onclick="changeImg3(1)"></button>
					<button class="bn btn2" onclick="changeImg3(2)"></button>
					<button class="bn btn3" onclick="changeImg3(3)"></button>
				</div>
				</div>
				<div class="sp_txt">
					<h1 style="color:#b2942d;">Private Spa</h1>
					<h2>아름다운 풍경을 보며 힐링 스파!</h2>
					<h3>_________________________<p/><br></h3><p/>
					<h3>
						 일상의 피로를 말끔히 풀어줄 스파!
					</h3>
				</div>
			</div>
			<!-- // -->
			<!-- 4 -->
			<a id="sp04"></a>
			<div class="sp_cont" id="sp4">
				<div class="sp4">
				<button class="but1" onclick="changePic4(0)"><i class="fas fa-chevron-left"></i></button>
				<button class="but2" onclick="changePic4(1)"><i class="fas fa-chevron-right"></i></button>
				<i class="fas fa-angle-double-down fa1"></i>
				<div class="btn">
					<button class="bn btn1" onclick="changeImg4(1)"></button>
					<button class="bn btn2" onclick="changeImg4(2)"></button>
					<button class="bn btn3" onclick="changeImg4(3)"></button>
				</div>
				</div>
				<div class="sp_txt">
					<h1 style="color:#178658;">Valley</h1>
					<h2>펜션 앞 계곡!</h2>
					<h3>_________________________<br></h3><p/>
					<h3>
						 펜션 바로 아래 흐르는 계곡에서 가족, 친구들과 <br>
				   즐거운 물놀이를 즐기실 수 있습니다. <br>
				   싱그러운 자연과 함께 그늘아래 시원한 여름을 보내세요.
					</h3>
				</div>
			</div>
			<!-- // -->

			<a id="sp05"></a>
			<div class="sp_cont" id="sp5">
				<div class="sp5">
				<button class="but1" onclick="changePic5(0)"><i class="fas fa-chevron-left"></i></button>
				<button class="but2" onclick="changePic5(1)"><i class="fas fa-chevron-right"></i></button>
				<i class="fas fa-angle-double-down fa1"></i>
				<div class="btn">
					<button class="bn btn1" onclick="changeImg5(1)"></button>
					<button class="bn btn2" onclick="changeImg5(2)"></button>
					<button class="bn btn3" onclick="changeImg5(3)"></button>
				</div>
				</div>
				<div class="sp_txt">
					<h1 style="color:#0985b3;">Exercise Facility</h1>
					<h2>다양하게 즐기는 운동시설!</h2>
					<h3>_________________________<p/><br></h3><p/>
					<h3>
					<!-- 인공암벽등반(이용요금: 1인 5,000원) <br>
					오토빌레이가 장착되어 있어 초보자도 안전하게 체험할 수 있습니다. <br>
					※ 클라이밍 / 안전요원과 함께 이용 <br><br> -->

					헬스기구, 로프, 링체조, 그네, 탁구장, 족구장<!-- , 자전거 --><br>
					추억의 옛날 오락기 - 유료
					</h3>
				</div>
			</div>
			<!-- // -->

			<a id="sp06"></a>
			<div class="sp_cont" id="sp6">
				<div class="sp6">
				<button class="but1" onclick="changePic6(0)"><i class="fas fa-chevron-left"></i></button>
				<button class="but2" onclick="changePic6(1)"><i class="fas fa-chevron-right"></i></button>
				<div class="btn">
					<button class="bn btn1" onclick="changeImg6(1)"></button>
					<button class="bn btn2" onclick="changeImg6(2)"></button>
					<button class="bn btn3" onclick="changeImg6(3)"></button>
				</div>
				</div>
				<div class="sp_txt">
					<h1 style="color:#39356d;">Seminar Room</h1>
					<h2>넓은 세미나실</h2>
					<h3>_________________________<br></h3><p/>
					<h3>
					   커뮤니티 이용공간 세미나실이 준비되어 있습니다. <br>
				 정보 : 30명 (거실+남/여 화장실(각1)+테라스) <br>
				 비품 : TV, 빔프로젝트, 냉장고, 에어컨(히터겸용), 전기쿡탑, 식기일체
					</h3>
				</div>
			</div>
		</div>
		</section>
		<footer>
		<div class="footer">
			<div class="copy">
				<h1>TEL. 063-222-2222</h1>
				아무개펜션|전주시 덕진구 금암동|대표. 홍길동<br>
				ACC. 농협 111-1111-111-1111 (예금주 : 홍길동)|사업자번호. 333-33-33333 
			</div>
			<div class="copy2">
				<a href="#">ADMIN</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="a()" >개인정보취급방침 및 저작권</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">홈페이지제작 포유</a>
			</div>
		</div>
		</footer>
		<script>
		function a(){
		window.open("<%=request.getContextPath()%>/community/etc.jsp","PopupNew", "width=550, height=600, top=265, left=690");
		}
		
		</script>
	</body>
</html>