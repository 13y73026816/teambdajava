<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주변여행지</title>
<script src="<%=request.getContextPath()%>/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/travel_.css" />
<script src="https://kit.fontawesome.com/bd3b61eb91.js" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){ 
		if (checkVisible($('.tr1'))&&!isVisible) {
			$(".tr1").css("opacity","0").css("animation-name","fadeInUp3")
			.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
			.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
			isVisible=false;
		}
	});
	
		var isVisible = false;
	$(window).on('scroll',function() {
		if (checkVisible($('.tr1'))&&!isVisible) {
			$(".tr1").css("opacity","0").css("animation-name","fadeInUp3")
			.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
			.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
			isVisible=false;
		}
		
		if (checkVisible($('.tr2'))&&!isVisible) {
			$(".tr2").css("opacity","0").css("animation-name","fadeInUp3")
			.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
			.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
			isVisible=false;
		}
	
		if (checkVisible($(".tr3"))&&!isVisible) {
			$(".tr3").css("opacity","0").css("animation-name","fadeInUp3")
			.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
			.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
			isVisible=false;
		}
		
		if (checkVisible($('.tr4'))&&!isVisible) {
			$(".tr4").css("opacity","0").css("animation-name","fadeInUp3")
			.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
			.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
			isVisible=false;
		}
		
		if (checkVisible($('.tr5'))&&!isVisible) {
			$(".tr5").css("opacity","0").css("animation-name","fadeInUp3")
			.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
			.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
			isVisible=false;
		}
		
		if (checkVisible($('.tr6'))&&!isVisible) {
			$(".tr6").css("opacity","0").css("animation-name","fadeInUp3")
			.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
			.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
			isVisible=false;
		}
		
		if (checkVisible($('.tr7'))&&!isVisible) {
			$(".tr7").css("opacity","0").css("animation-name","fadeInUp3")
			.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
			.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
			isVisible=false;
		}
		
		if (checkVisible($('.tr8'))&&!isVisible) {
			$(".tr8").css("opacity","0").css("animation-name","fadeInUp3")
			.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
			.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
			isVisible=false;
		}
		
		if (checkVisible($('.tr9'))&&!isVisible) {
			$(".tr9").css("opacity","0").css("animation-name","fadeInUp3")
			.css("-webkit-animation-name","fadeInUp3").css("animation-duration","1s")
			.css("animation-fill-mode","both").css("-webkit-animation-duration","1s").css("-webkit-animation-fill-mode","both");
			isVisible=true;
		}
	});	
	
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
<%@ include file="../header.jsp" %>

	<div class="timg tour">
		<img src="<%=request.getContextPath()%>/filefolder/tr.png">
		<div class="info">
			<h2>TRAVEL</h2>
			__________________________________________________________________
			<h3>유명산 · 유명사 · 레일바이크 · 유명한산 · 패러글라이딩활공장 · 사륜바이크 · 오봉재 · 대둔산천문대 · 만경강수상스키</h3>
		</div>
	</div>
<div id="travel_con">
		<div class="tra tr1" style="background-color: rgb(94, 170, 168);" >
			<div class="ibox"><img src="../filefolder/tr1a.jpg" width="100%"></div>
			<div class="tbox">
				<h3>TRAVEL 01</h3>
				<h1>유명산</h1>
				<h2>_____&nbsp;&nbsp;&nbsp;&nbsp;<p></p></h2>
				<h4>차로 약 10분소요</h4>
				<h2>함왕봉, 백운봉, 장군봉... 등 기암절벽이 즐비하여 금강산을 방불케 하며,<br>
					  북한강과 남한강이 산을 에워싼 채 흐르고 사방으로 뻗어내린 산줄기에 <br>
						계곡들이 깊고 도처에 기암괴석 사이로 흐르는 시냇물이 절경을 이룹니다. <br>
						또한 물이 맑아 1급수에만 사는 버들치가 많습니다.</h2>
			</div>
		</div>
		<div class="tra tr2" style="background-color: rgb(111, 158, 175);" >
			<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/tr2a.jpg" width="100%"></div>
			<div class="tbox">
				<h3>TRAVEL 02</h3>
				<h1>유명사</h1>
				<h2>_____&nbsp;&nbsp;&nbsp;&nbsp;<p></p></h2>
				<h4>차로 약 10분소요</h4>
				<h2>산행기점이기도한 명찰 사나사는 923년 창건한 사찰로 원증국사탑,<br>
					 원증국사석종비, 삼층석탑 등 고려시대 유적이 많이 남아 있습니다. <br>
				   사나사 뒤편으로는 백운봉으로 올라갈 수 있는 등산로가 있습니다.</h2>
			</div>
		</div>
		<div class="tra tr3" style="background-color: rgb(216, 194, 146);" >
			<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/tr3a.png" width="100%"></div>
			<div class="tbox">
				<h3>TRAVEL 03</h3>
				<h1>레일바이크</h1>
				<h2>_____&nbsp;&nbsp;&nbsp;&nbsp;<p></p></h2>
				<h4>차로 약 10분소요</h4>
				<h2>맑은 물과 깨끗한 공기, 산과 강이 어우러진 양평의 용문~원덕까지 <br>
					  3.2㎞(왕복6.4㎞)를 시속 15~20㎞로 운영할 수 있도록 제작된 철길입니다. <br>
						철로 위를 달리면서 자연과 하나됨을 느껴보세요.</h2>
			</div>
		</div>
		<div class="tra tr4" style="background-color: rgb(157, 173, 127);" >
			<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/tr4a.jpg" width="100%"></div>
			<div class="tbox">
				<h3>TRAVEL 04</h3>
				<h1>유명한산</h1>
				<h2>_____&nbsp;&nbsp;&nbsp;&nbsp;<p></p></h2>
				<h4>차로 약 15분소요</h4>
				<h2>양평쪽에서 오르는 코스는 광할한 초원지대의 탁트인 시원함을 즐길 수 있어 <br>
					  산행의 묘미가 있습니다. <br>
						등산로는 대부산과 동일한 코스를 이용할 수도 있고 대부산, 소구니산을 연계하여 <br>
						능선종주 산행을 할 수도 있습니다. <br>
						정상에 서면 돌을 쌓아 만든 케언이 서 있고 전망 또한 일품입니다.</h2>
			</div>
		</div>
		<div class="tra tr5" style="background-color: rgb(114, 106, 149);" >
			<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/tr5a.jpg" width="100%"></div>
			<div class="tbox">
				<h3>TRAVEL 05</h3>
				<h1>패러글라이딩활공장</h1>
				<h2>_____&nbsp;&nbsp;&nbsp;&nbsp;<p></p></h2>
				<h4>차로 약 15분소요</h4>
				<h2>패러글라이딩을 타고 하늘에 오르면 유명산의 억새와 들꽃, 소나무등이 <br>
				  	발아래로 펼쳐지고 멀리 두물머리를 향해 흐르는 남한강, <br>
						북한강의 물줄기를 감상하실 수 있습니다.</h2>
			</div>
		</div>
		<div class="tra tr6" style="background-color: rgb(113, 159, 176);" >
			<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/tr6a.jpg" width="100%"></div>
			<div class="tbox">
				<h3>TRAVEL 06</h3>
				<h1>사륜바이크</h1>
				<h2>_____&nbsp;&nbsp;&nbsp;&nbsp;<p></p></h2>
				<h4>차로 약 15분소요</h4>
				<h2>산악지형을 자유롭게 달리는 ATV!<br> 자연속에서 짜릿한 모험과 스릴을 느낄수 있습니다.</h2>
			</div>
		</div>
		<div class="tra tr7" style="background-color: rgb(195, 158, 92);" >
			<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/tr7a.jpg" width="100%"></div>
			<div class="tbox">
				<h3>TRAVEL 07</h3>
				<h1>오봉재</h1>
				<h2>_____&nbsp;&nbsp;&nbsp;&nbsp;<p></p></h2>
				<h4>차로 약 15분소요</h4>
				<h2>아름다운 자연속에 그림같은 휴양림 설매재. <br>
					 다양한 영화 및 드라마 촬영지로 유명합니다. <br>
					 등산로주변으로 야생화들과 아름답게 우거진 숲속에서 신선한 자연의 향기가 함께 합니다.</h2>
			</div>
		</div>
		<div class="tra tr8" style="background-color: rgb(157, 173, 127);" >
			<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/tr8a.jpg" width="100%"></div>
			<div class="tbox">
				<h3>TRAVEL 08</h3>
				<h1>대둔산천문대</h1>
				<h2>_____&nbsp;&nbsp;&nbsp;&nbsp;<p></p></h2>
				<h4>차로 약 15분소요</h4>
				<h2>아름다운 자연속에 별을헤는 밤. <br>
						국내 최초의 천문우주과학 체험 학습을 실시한 체험 학습관 개관으로 <br>
						다양한 프로그램이 마련되어 있습니다.</h2>
			</div>
		</div>
		<div class="tra tr9" style="background-color: rgb(154, 129, 148);" >
			<div class="ibox"><img src="<%=request.getContextPath()%>/filefolder/tr9a.jpg" width="100%"></div>
			<div class="tbox">
				<h3>TRAVEL 09</h3>
				<h1>만경강수상스키</h1>
				<h2>_____&nbsp;&nbsp;&nbsp;&nbsp;<p></p></h2>
				<h4>차로 약 15분소요</h4>
				<h2>무더위를 한방에 날릴수 있는 짜릿한 수상 레져를 즐길 수 있습니다.<br>
					  (쌍용 수상스키,남한강 수상스키)</h2>
			</div>
		</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>