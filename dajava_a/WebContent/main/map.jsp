<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%String name = (String)session.getAttribute("name"); 
String grade = (String)session.getAttribute("grade");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는길</title>
<script src="https://kit.fontawesome.com/bd3b61eb91.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/map_.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/main/animation_slide.css"></link>
<script src="<%=request.getContextPath()%>/jquery-3.5.1.min.js"></script>	
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
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
			
			$("#map_canvas").css("opacity","0").css("animation-name","fadeInUp3")
			.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
			.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
			
			$(".btn1").click(function(){
				$(".btn1").css("background","#2c2c2c");
				$(".btn2").css("background","#dcdcdc");
				$(".btn1 a").css("color","#fff");
				$(".btn2 a").css("color","#121013");
			});
			$(".btn2").click(function(){
				$(".btn2").css("background","#2c2c2c");
				$(".btn1").css("background","#dcdcdc");
				$(".btn2 a").css("color","#fff");
				$(".btn1 a").css("color","#121013");
			});
				
		});
		
			new daum.roughmap.Lander({
				"timestamp" : "1616742619225",
				"key" : "252r4",
				"mapWidth" : "1522",
				"mapHeight" : "432"
			}).render();
		
		
</script>
 <style>
	
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
		<div class="info">
			<h2>TRAFFIC</h2>
			__________________________________________________________________
			<h3>오시는 길</h3>
		</div>
	</header>
	<div id="tcont">
		<div class="tit_trans">
			_____<p/>교통안내
            <li>·  주소 : 전라북도 전주시 덕진구 백제대로 579</li>
            <li>·  문의 : 063-2222-2222</li><p/>
        </div>
		<div id="map_canvas" width="100%">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3234.3570895962794!2d127.1302851152632!3d35.84024658015761!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35702349c25db98f%3A0x4754f4bcbb956bbd!2z7J207KCg7Lu07ZOo7YSw7JWE7Yq47ISc67mE7Iqk7ZWZ7JuQ!5e0!3m2!1sko!2skr!4v1616743482310!5m2!1sko!2skr" style="width:100%; border:0;"></iframe>
		</div>
		<p/>
		<div id="info">  
			<span>
				<button class="btn1"><a href="<%=request.getContextPath()%>/path/mycar.do" target="if_a"><b>자가용 이용시</b></a></button>
			</span>
			<span> 
				<button class="btn2"><a href="<%=request.getContextPath()%>/path/pub_trans.do" target="if_a"><b>대중교통 이용시</b></a></button>
			</span>
		</div>
		<p/>
		<iframe src="<%=request.getContextPath()%>/path/mycar.do" name="if_a"></iframe>
	</div>	
	<footer>
		<div id="footer">
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




