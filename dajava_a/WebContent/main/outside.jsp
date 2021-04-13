<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%String name = (String)session.getAttribute("name"); 
String grade = (String)session.getAttribute("grade");%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>외부전경</title>
		<script src="<%=request.getContextPath()%>/jquery-3.5.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/outside_.css" />
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
				
				const toggleBtn = document.querySelector('.toogleBtn');
				const top=document.querySelector('.top');
				
				toggleBtn.addEventListener('click',()=>{
					top.classList.toggle('active');
				});
				
			});
			
			 var num=1;
			 function changePic(idx) {
				 if(idx){
					if(num==4)return;
					num++;
				 }else{
					if(num==1)return;
					num--;
				 }
				 
				switch(num){
				case 1:
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/day5.jpg)"});
					$("header").css({"background-size":"cover"});
					break;
				case 2:
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/day1.jpg)"});
					$("header").css({"background-size":"cover"});
					break;
				case 3:
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/day2.jpg)"});
					$("header").css({"background-size":"cover"});
					break;
				case 4:
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/day3.jpg)"});
					$("header").css({"background-size":"cover"});
					break;
				}
			 }
			 function changeImg(idx){
				if(idx==1){
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/day5.jpg)"});
					$("header").css({"background-size":"cover"});
				}else if(idx==2){
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/day1.jpg)"});
					$("header").css({"background-size":"cover"});
				}else if(idx==3){
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/day2.jpg)"});
					$("header").css({"background-size":"cover"});
				}else if(idx==4){
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/day3.jpg)"});
					$("header").css({"background-size":"cover"});
				}
			}
			
			
			 function changePic1(idx) {
				 if(idx){
					if(num==4)return;
					num++;
				 }else{
					if(num==1)return;
					num--;
				 }
				 
				switch(num){
				case 1:
					$(".night_s").css({"background":"url(<%=request.getContextPath()%>/filefolder/evening4.png)"});
					$(".night_s").css({"background-size":"cover"});
					break;
				case 2:
					$(".night_s").css({"background":"url(<%=request.getContextPath()%>/filefolder/evening1.jpg)"});
					$(".night_s").css({"background-size":"cover"});
					break;
				case 3:
					$(".night_s").css({"background":"url(<%=request.getContextPath()%>/filefolder/evening3.jpg)"});
					$(".night_s").css({"background-size":"cover"});
					break;
				case 4:
					$(".night_s").css({"background":"url(<%=request.getContextPath()%>/filefolder/evening2.png)"});
					$(".night_s").css({"background-size":"cover"});
					break;
				}				
				
			 }
			 
			 function changeImg1(idx){
				if(idx==1){
					$(".night_s").css({"background":"url(<%=request.getContextPath()%>/filefolder/evening4.png)"});
					$(".night_s").css({"background-size":"cover"});
				}else if(idx==2){
					$(".night_s").css({"background":"url(<%=request.getContextPath()%>/filefolder/evening1.jpg)"});
					$(".night_s").css({"background-size":"cover"});
				}else if(idx==3){
					$(".night_s").css({"background":"url(<%=request.getContextPath()%>/filefolder/evening3.jpg)"});
					$(".night_s").css({"background-size":"cover"});
				}else if(idx==4){
					$(".night_s").css({"background":"url(<%=request.getContextPath()%>/filefolder/evening2.png)"});
					$(".night_s").css({"background-size":"cover"});
				}
			}
			 
			var isVisible = false;

			$(window).on('scroll',function() {
				
			if (checkVisible($('.img100'))&&!isVisible) {
				$(".img100").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				
				isVisible=false;
			}
			
			if (checkVisible($('.abbg>h4'))&&!isVisible) {
				$(".abbg>h4").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				
				isVisible=false;
			}
		
			if (checkVisible($('.img1-2'))&&!isVisible) {
				$(".img1").css("opacity","0").css("animation-name","fadeInUp1")
				.css("-webkit-animation-name","fadeInUp1").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
								
				$(".img2").css("opacity","0").css("animation-name","fadeInUp2")
				.css("-webkit-animation-name","fadeInUp2").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('.img3-4'))&&!isVisible) {
				$(".img3").css("opacity","0").css("animation-name","fadeInUp1")
				.css("-webkit-animation-name","fadeInUp1").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
								
				$(".img4").css("opacity","0").css("animation-name","fadeInUp2")
				.css("-webkit-animation-name","fadeInUp2").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('.img5-7'))&&!isVisible) {
				$(".img5").css("opacity","0").css("animation-name","fadeInUp1")
				.css("-webkit-animation-name","fadeInUp1").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				
				$(".img6").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				
				$(".img7").css("opacity","0").css("animation-name","fadeInUp2")
				.css("-webkit-animation-name","fadeInUp2").css("animation-duration","1s")
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
			
		</style>
	</head>
	<body onload="showImage()">
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
			<div class="info">
				<h2>DAY</h2>
				__________________________________________________________________
				<h3>PROLOGUE</h3>
			</div>
			<button class="but1" onclick="changePic(0)"><i class="fas fa-chevron-left"></i></button>
			<button class="but2" onclick="changePic(1)"><i class="fas fa-chevron-right"></i></button>
			<i class="fas fa-angle-double-down fa1"></i>
			<div class="btn">
				<button class="bn btn1" onclick="changeImg(1)"></button>
				<button class="bn btn2" onclick="changeImg(2)"></button>
				<button class="bn btn3" onclick="changeImg(3)"></button>
				<button class="bn btn4" onclick="changeImg(4)"></button>
			</div>
			
		</header>
		<section>
			<div class="night_s">
				<div class="info">
					<h2>NIGHT</h2>
					__________________________________________________________________
					<h3>PROLOGUE</h3>
				</div>
				<button class="but1" onclick="changePic1(0)"><i class="fas fa-chevron-left"></i></button>
				<button class="but2" onclick="changePic1(1)"><i class="fas fa-chevron-right"></i></button>
				<i class="fas fa-angle-double-down fa1"></i>
				<div class="btn">
					<button class="bn btn1" onclick="changeImg1(1)"></button>
					<button class="bn btn2" onclick="changeImg1(2)"></button>
					<button class="bn btn3" onclick="changeImg1(3)"></button>
					<button class="bn btn4" onclick="changeImg1(4)"></button>
				</div>
				
			</div>
			
				<div id="abcont" class="abbg">
					<div class="img100"><img src="<%=request.getContextPath()%>/filefolder/dajava_pic.png" class="img_100"></div>
					<h4>
						<b>"Doing Nothing."</b><br>
						무위(無爲)의 즐거움, 빈둥거림의 달콤함<br>
						다자바돌체에 오신 것을 환영합니다.<br>
						일상에서 벗어나 이곳에서 빈둥거림의 달콤함을 느낄 수 있도록<br>
						자연친화적인 설계와 시공으로 휴식공간을 마련했습니다.<br><br>
						<span>#전북 #전주펜션 #전북 가볼만한곳 #야외수영장 #개별바비큐 #스파 #액티비티</span>
					</h4>
				</div>
				<div id="mpro2">
				<div class="tit">
					<span class="line">_____________</p><br></span>
					<h3>
						&nbsp;&nbsp;여행의 품격, 다자바돌체</p>
						가장 좋은 것들로 채웠습니다.
					</h3>
				</div>
				<div class="imgbox clearfix">
					<div class="img1-2"><div class="img img1"><img src="<%=request.getContextPath()%>/filefolder/bottom1.jpg"></div>
					<div class="img img2"><img src="<%=request.getContextPath()%>/filefolder/bottom2.jpg" width="900px" height="600px"></div></div>
					<div class="img3-4"><div class="img img3"><img src="<%=request.getContextPath()%>/filefolder/bottom3.png"></div>
					<div class="img img4"><img src="<%=request.getContextPath()%>/filefolder/bottom4.jpg"></div></div>
					<div class="img5-7"><div class="img img5"><img src="<%=request.getContextPath()%>/filefolder/bottom5.jpg" width="620px" height="700px"></div>
					<span class="img img6"><img src="<%=request.getContextPath()%>/filefolder/bottom6.jpg" width="620px" height="700px"></span>
					<div class="img img7"><img src="<%=request.getContextPath()%>/filefolder/bottom7.jpg" width="620px" height="700px"></div></div>
				</div>
				</div>
			
			
		</section>
		<footer>
		<div class="footer">
			<div class="copy">
				<h1>TEL. 063-222-2222</h1>
				아무개펜션 | 전주시 덕진구 금암동 | 대표. 홍길동<br>
				ACC. 농협 111-1111-111-1111 (예금주 : 홍길동) | 사업자번호. 333-33-33333 
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