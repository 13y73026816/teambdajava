<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%@ page import ="java.util.*" %>
<%
ArrayList<OrderDto> alist = (ArrayList<OrderDto>)request.getAttribute("alist");
String name = (String)session.getAttribute("name");
%> 

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="../mypagestyle.css" rel="stylesheet" type="text/css">
<script src="../jquery-3.5.1.min.js"></script>  
<script type="text/javascript"> 
	$(document).ready(function(){	
		$(".ostate_re").each(function(){
			var ostate1 = $(this).val();
				console.log("ostate : "+ostate1);
			if(ostate1=="Y"){
				$(this).prev().text("대기");
			}else if(ostate1=="F"){
				$(this).prev().text("완료");
			}else if(ostate1=="C"){
				$(this).prev().text("취소요청");
			}else if(ostate1=="W"){
				$(this).prev().text("결제대기");
			}
		});
		
		
		$('.nav_menu').each(function(index){
	  		$(this).attr('menu-index',index);
		}).click(function(){
			var index = $(this).attr('menu-index');
			$('.nav_menu[menu-index='+index+']').addClass('menu_clicked');
			$('.nav_menu[menu-index!='+index+']').removeClass('menu_clicked');			
			if(index==0){
				$(location).attr('href','<%=request.getContextPath()%>/mypage/myinfo.do');
			}else if(index==1){
				$(location).attr('href','<%=request.getContextPath()%>/mypage/reserve_pres.do');				
			}else if(index==2){
				$(location).attr('href','<%=request.getContextPath()%>/mypage/point.do');					
			}else if(index==3){
				$(location).attr('href','<%=request.getContextPath()%>/mypage/myreview.do');					
			}else if(index==4){
				$(location).attr('href','<%=request.getContextPath()%>/mypage/myqa.do');					
			}
		});	    
		
    	$('.submenu_span').each(function(index){
  				$(this).attr('submenu-index',index);
		}).click(function(){
			var index = $(this).attr('submenu-index');
			$('.submenu_span[submenu-index='+index+']').addClass('menu_clicked');
			$('.submenu_span[submenu-index!='+index+']').removeClass('menu_clicked');
			if(index==0){
				$(location).attr('href','<%=request.getContextPath()%>/mypage/reserve_pres.do');	
			}else if(index==1){
				$(location).attr('href','<%=request.getContextPath()%>/mypage/reserve_past.do');					
			}else if(index==2){
				$(location).attr('href','<%=request.getContextPath()%>/mypage/reserve_canc.do');					
			}
		}); 
	});  		
</script>	        
<style>
.menu1,.subm{
	background-color:pink;
}

.firstcolumn{
	background-color:#6c6c6c;
	height:2rem;
	color:#fff;
}

.t1 tr{
	height:2rem;
}

.submenu_span{
	font-size:1.1rem;
	padding-right:2%;
	padding-left:2%;
	padding-top:4px;
	padding-bottom:4px;
	
}

.submenubottom{
	margin-top:2%;
}

</style>
</head>
<body>
<form>
<section>
	<a href="<%=request.getContextPath()%>/mypage/myinfo.do" class="mypagemain"><h1>마이페이지(일반회원)</h1></a>
	<nav>
		<hr/>
		<div class="nav_menu" id="first">내 정보</div>
		<hr/>
		<div class="nav_menu menu1">예약 정보</div>
		<hr/>
		<div class="nav_menu">적립금</div>
		<hr/>
		<div class="nav_menu">나의 이용후기</div>	
		<hr/>
		<div class="nav_menu">나의 질문</div>
		<hr/>																
	</nav>
	<article>
		<div class="memberinfo">
	     	<b><%=name %></b> 님 
		</div>
		<p/>
		<div id="contentdiv">
		<div class="menuname"><h2>내 펜션 예약 현황</h2></div>
		<hr/>
        <p/>		
		<div class="submenu">
			<span class="submenu_span first subm">예약 중</span> <span class="submenu_span">지난 예약</span> <span class="submenu_span">취소/환불</span>
	
		</div>  
		<hr class="submenubottom"/>			
      					
		<div class="infotable">		
			<p/>
			<div class="tabletype2" id="sub1">
				<table class="t1">
					<tr class="firstcolumn">
						<th width="13%">숙소명</th>
						<th width="40%">예약날짜</th>
						<th width="15%">예약상태</th>
						<th width="16%">문의하기</th>	
						<th width="16%">예약취소</th>																		
					</tr>
					<%
					for(OrderDto od : alist){
					%>
					<tr>
						<td><%=od.getRoomnum() %></td>
						<td><%=od.getOstart().substring(0,10) %>~<%=od.getOend().substring(0,10) %></td>
						<td><span class="ostate"></span><input type="hidden" class="ostate_re" value="<%=od.getOstate() %>"></td>
						<td><button type="button" onclick="window.open('<%=request.getContextPath()%>/community/54.do')">문의하기</button></td>
						<td><button type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/orderState.do?oidx=<%=od.getOidx()%>'">취소요청</button></td>		
					</tr>		
					<% } %>							
				</table>				
			</div>	
		</div>	
		</div>	
	</article>
</section>
</form>		
</body>
</html>