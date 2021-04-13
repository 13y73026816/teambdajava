<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%@ page import ="java.util.*" %>
<%	ArrayList<PointVo> alist = (ArrayList<PointVo>)request.getAttribute("alist"); 
String name = (String)session.getAttribute("name");%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보</title>
<link href="../mypagestyle.css" rel="stylesheet" type="text/css">
<script src="../jquery-3.5.1.min.js"></script>  
<script type="text/javascript">
	$(document).ready(function(){	
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
	    	    
	});
	
	

</script>
<style>
.menu1{
	background-color:pink;
}

.sum{
	margin-top:20px;
}
.firstcolumn{
	background-color:#6c6c6c;
	height:2rem;
	color:#fff;
}

.point{
	 color:red;
	 margin-right:10px;
}

.t1 tr{
	height:1.8rem;
}

.sum{
	font-size:1.4rem;
	margin-left:60%;
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
		<div class="nav_menu">예약 정보</div>
		<hr/>
		<div class="nav_menu menu1">적립금</div>
		<hr/>
		<div class="nav_menu">나의 이용후기</div>	
		<hr/>
		<div class="nav_menu">나의 질문</div>
		<hr/>																
	</nav>
	<article>
		<div class="memberinfo">
	     	<b><%=name%></b> 님 
		</div>
		<p/>
		<div id="contentdiv">
		<div class="menuname"><h2>적립금</h2></div>
		<hr/>	
		<div class="infotable">		
        <p>					
 	      	
 	    <p/>    		
			<div class="tabletype2">
			<table class="t1">
				<tr class="firstcolumn">
					<th>적립 내역</th>
					<th>적립 날짜</th>
					<th>적립 금액</th>																		
				</tr>
				<% int sum=0;
					for(PointVo pv : alist){
				%>
				<tr>
					<td>펜션결제</td>
					<td><%=pv.getPdate().substring(0,10) %></td>
					<td><sapn class="point"><%=pv.getPoint() %></sapn>p</td>																
				</tr>	
				<% sum += pv.getPoint();
				} %>	
												
			</table>	
			</div>
		</div>	
		<hr/>
		<div class="sum"> <b> 총 적립금 : </b><span class="pointnum"><b><%=sum %></b></span> p	</div>
	</div>	
	</article>
</section>		
</form>		
</body>
</html>