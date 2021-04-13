<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%String name = (String)session.getAttribute("name"); 
String grade = (String)session.getAttribute("grade");
String email = (String)session.getAttribute("email");
String phone = (String)session.getAttribute("phone");
String addr = (String)session.getAttribute("addr");
Integer point = (Integer)session.getAttribute("point");
Integer midx = (Integer)session.getAttribute("mdix");%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>다자바돌체</title>
		<script src="<%=request.getContextPath()%>/jquery-3.5.1.min.js"></script>
		<script src="https://kit.fontawesome.com/bd3b61eb91.js" crossorigin="anonymous"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/index_.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/slick.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/slick-theme.css" />
		<script src="<%=request.getContextPath()%>/slick.min.js"></script>
		<script>
			$(".top li").hover(function() {
				$(this).children("ul").stop().slideToggle();
			 });	
				
			$(document).ready(function(){ 
			
				
				$(window).scroll(function(){  
					var scroll = $(window).scrollTop();
				//	var windowH = $(window).height();
				//	var docH = $(document).height();
				//	console.log("docH::"+docH);
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
				
				$('.autoplay').slick({
				  slidesToShow: 1,
				  slidesToScroll: 1,
				  autoplay: true,
				  autoplaySpeed: 1500,
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
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/front2.jpg)"});
					$("header").css({"background-size":"cover"});
					break;
				case 2:
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/front4.jpg)"});
					$("header").css({"background-size":"cover"});
					break;
				case 3:
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/front1.jpg)"});
					$("header").css({"background-size":"cover"});
					break;
				case 4:
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/front3.jpg)"});
					$("header").css({"background-size":"cover"});
					break;
				}				
				
			 }
			 function changeImg(idx){
				if(idx==1){
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/front2.jpg)"});
					$("header").css({"background-size":"cover"});
				}else if(idx==2){
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/front4.jpg)"});
					$("header").css({"background-size":"cover"});
				}else if(idx==3){
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/front1.jpg)"});
					$("header").css({"background-size":"cover"});
				}else if(idx==4){
					$("header").css({"background":"url(<%=request.getContextPath()%>/filefolder/front3.jpg)"});
					$("header").css({"background-size":"cover"});
				}
			}
			
			var isVisible = false;

		$(window).on('scroll',function() {
			if (checkVisible($('.room_title'))&&!isVisible) {
				$(".room_title").css("opacity","0").css("animation-name","fadeInUp4")
				.css("-webkit-animation-name","fadeInUp4").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('.slider'))&&!isVisible) {
				$(".slider").css("opacity","0").css("animation-name","fadeInUp5")
				.css("-webkit-animation-name","fadeInUp5").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('.special_title'))&&!isVisible) {
				$(".special_title").css("opacity","0").css("animation-name","fadeInUp4")
				.css("-webkit-animation-name","fadeInUp4").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('.view1'))&&!isVisible) {
				$(".view1").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('.view2'))&&!isVisible) {
				$(".view2").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('.view3'))&&!isVisible) {
				$(".view3").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('.view4'))&&!isVisible) {
				$(".view4").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('.view5'))&&!isVisible) {
				$(".view5").css("opacity","0").css("animation-name","fadeInUp3")
				.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
				.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
				isVisible=false;
			}
			
			if (checkVisible($('.view6'))&&!isVisible) {
				$(".view6").css("opacity","0").css("animation-name","fadeInUp3")
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
		
/*		window.onload = function hide(){
			var state = $('#name').val();
			if(state == "null"){    //string
				$('#log1').hide(); 
				$('#log2').show();
			}else{ 
				$('#log1').show(); 
				$('#log2').hide();
			} 
		}*/
		
		function checkVisible( elm, eval ) {
			eval = eval || "object visible";
			var viewportHeight = $(window).height(), // Viewport Height
				scrolltop = $(window).scrollTop(), // Scroll Top
				y = $(elm).offset().top,
				elementHeight = $(elm).height();   
			
			if (eval == "object visible") return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
			if (eval == "above") return ((y < (viewportHeight + scrolltop)));
		}
		
		</script>
		<style>
			
		</style>
	</head>
	<body>
	<form>
	</form>
		<header>
		<div class="hd">
			<div class="logo">
				<a href="<%=request.getContextPath()%>/path/index.do"><img src="<%=request.getContextPath()%>/filefolder/dajava_logo.png" width="100px" height="15px"></a>
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
		<article>
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
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room1.do">자세히 보기</a></button>
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
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room2.do">자세히 보기</a></button>
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
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room3.do">자세히 보기</a></button>
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
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room4.do">자세히 보기</a></button>
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
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room5.do">자세히 보기</a></button>
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
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room6.do">자세히 보기</a></button>
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
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room7.do">자세히 보기</a></button>
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
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room8.do">자세히 보기</a></button>
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
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room9.do">자세히 보기</a></button>
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
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room10.do">자세히 보기</a></button>
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
				<button class="but_det"><a href="<%=request.getContextPath()%>/path/room11.do">자세히 보기</a></button>
				</div>
			</div>
		</div>
		
		<div class="third">
			<img src="<%=request.getContextPath()%>/filefolder/front2-1.jpg">
			<div class="third_text">
			<h2><i>More precious memories together on DAJAVA DOLCHE</i></h2>
			<h3>다자바돌체 에서 함께하는 소중한 추억<br/>
			전객실 자연을 바라볼 수 있는 탁 트인 전망</h3>
			</div>
			
		</div>
		
		<div class="special_title">
			<h2><img src="<%=request.getContextPath()%>/filefolder/text_special1.png"></h2>
		</div>
		
		
		<div class="spbox">
		<div class="viewt view1">
			<div class="ibox1"><img src="<%=request.getContextPath()%>/filefolder/barbecue.jpg"></div>
			<div class="tbox1">
				<h3>delicious barbecue</h3>
				<h4>자연과 함께하는 맛있는 바비큐파티!</h4>
				<button class="but_det"><%=request.getContextPath()%>/path/special1.do">자세히 보기</a></button>
			</div>
		</div>
		<div class="viewt view2">
			<div class="ibox1"><img src="<%=request.getContextPath()%>/filefolder/pool1.png"></div>
			<div class="tbox1">
				<h3>swimming pool</h3>
				<h4>자연석을 쌓아 만든 자연친화적인 특별한 수영장!</h4>
				<button class="but_det"><%=request.getContextPath()%>/path/special2.do">자세히 보기</a></button>
			</div>
		</div>
		<div class="viewt view3">
			<div class="ibox1"><img src="<%=request.getContextPath()%>/filefolder/spa1.jpg"></div>
			<div class="tbox1">
				<h3>private spa</h3>
				<h4>몸과 마음의 휴식, 스파</h4>
				<button class="but_det"><%=request.getContextPath()%>/path/special3.do">자세히 보기</a></button>
			</div>
		</div>
		<div class="viewt view4">
			<div class="ibox1"><img src="<%=request.getContextPath()%>/filefolder/valley.png"></div>
			<div class="tbox1">
				<h3>valley</h3>
				<h4>펜션 옆을 흐르는 시원한 계곡</h4>
				<button class="but_det"><%=request.getContextPath()%>/path/special4.do">자세히 보기</a></button>
			</div>
		</div>
		<div class="viewt view5">
			<div class="ibox1"><img src="<%=request.getContextPath()%>/filefolder/sports1.png"></div>
			<div class="tbox1">
				<h3>Exercise Facility</h3>
				<h4>다양한 운동시설</h4>
				<button class="but_det"><%=request.getContextPath()%>/path/special5.do">자세히 보기</a></button>
			</div>
		</div>
		<div class="viewt view6">
			<div class="ibox1"><img src="<%=request.getContextPath()%>/filefolder/seminar.jpg"></div>
			<div class="tbox1">
				<h3>seminar room</h3>
				<h4>넓은 세미나실!</h4>
				<button class="but_det"><%=request.getContextPath()%>/path/special6.do">자세히 보기</a></button>
			</div>
		</div>
		</div>
	
		<div id="mpro2">
		<div class="tit">
			<img src="<%=request.getContextPath()%>/filefolder/text_title.png">
			<span class="line">____________</p><br></span>
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
		
		</article>
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
