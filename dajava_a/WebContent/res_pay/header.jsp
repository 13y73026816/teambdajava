<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%String name = (String)session.getAttribute("name"); 
String grade = (String)session.getAttribute("grade");%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>header</title>
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
						       }else {
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
		</script>
		<style>
			html { 
			
				font-family:sans-serif;
			}
		
			* {margin: 0;padding: 0;}

			li {list-style: none}

			a{text-decoration: none}
			
			.login{
				position:absolute;
				top:20px;
				right:10px;
			}
			.login a{
				padding:10px;
			}
			
		<!--	.logo{
				position:absolute;
				top:20px;
				left:10px;
			} 
			
			.hd {
			  position:fixed;
			  width: 100%;
			  height: 76px; 
			  z-index: 1;
			}

			.container {
			  width: 80%;
			  height: 3.3rem;
			  margin: 0 auto;
			  position: relative;
			}  

			.top {
			  float: left;
			  width: 100%;
			  padding-left:7rem;
			  overflow: hidden;
			}

			.top>li {
			  display:inline;
			  float: left;
			  width: 12%;
			  box-sizing: border-box;
			}

			.top>li>a {
			
			  display: block;
			  width: 100%;
			  text-align: center;
			  line-height: 3;
			  color: #202020;
			  font-size: 1rem;
			  font-weight:bold;
			 
			}

			.sub {
			  width: 18%;
			  margin-top:15px;
			  left: 0;
			  z-index: 1;
			  display: none;
			  overflow: hidden;
			  text-align:center;
			}
			
			.hd{
				display:flex;
				justify-content:space-between;
				align-items:center;
			}
			
			.top{
				display:flex;
			}
			
			.sub>li {
			  height:2.5rem;
			  border-bottom: 1px solid #000;
			  color: #fff;
			  background-color: #5c5c5c;
			  box-sizing: border-box;
			  
			}

			.sub>li:last-child {
			  border: 0;
			}
			
			.sub>li>a {
			  background-color: #5c5c5c;
			  color: #fff;
			  margin:0;
			  padding:0;
			  font-size:0.9rem;
			}

			.sub>li>a:hover {
			  background-color: #5c5c5c;
			  color: #fff;
			}

			.hd ul li:hover ul {
			  display: block;
			  width: 100%;
			  text-align: center;
			  line-height: 2.5;
			  font-size: 1rem;
			  font-weight: 500;
			}
			
			.toogleBtn{
				position:absolute;
				left:2rem;
				font-size:2.4rem;
				display:none;
				
			}
			@media screen and (max-width:1000px){
				html{font-size:80%;}
			
				.top{
					display:none;
					
					flex-direction:column;
					align-items:center;
					width:100%;
					background-color:rgba(199,207,183,0.9);
					
					text-align: center;
					padding:0;
					margin-top:59px;
					line-height: 100%;
					
				}
				
				.container {
			  		width: 100%;
			  	}
				
				.img{
					max-width:60%;
					height:auto;
				}
				
				.hd{
					background-color:#9dad7f;
					z-index:2;
				}
				
				.logo{
					display:none;
					align:center;
				}
				
				.top li{
					width:100%;
					line-height:100%;
					color:black;
					border-bottom: 2px solid #aaaaaa;
					padding:0;
					margin:0;
				}
				
				.top li:last-child {
					border: 0;
				}
				
				.sub{
					margin-top:0;
				}
				
				.sub li{
					line-height:300%;
					width:100%
				}
				
				.sub li a{
					width:100%;
					flex-direction:column;
					aligh-items:center;
					background-color: #5c5c5c;
					color: #fff;
					
					font-weight:150;
				}
				
				.toogleBtn{
					display:block;
				}
				
				.top.active{
					display:flex;
				}
				
			}
		</style>
	</head>
	<body>
		<header>
			<div class="hd">
				<div class="logo">
					<a href="<%=request.getContextPath()%>/path/index.do"><img src="../filefolder/dajava_logo.png" width="100px" height="50px"></a>
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
		</header>
	</body>
