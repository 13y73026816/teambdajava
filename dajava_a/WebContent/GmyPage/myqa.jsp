<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import="service.*" %>
<%
ArrayList<QaDto> alist = (ArrayList<QaDto>)request.getAttribute("alist"); 
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

.t1{
	padding-left:5%;
	text-align:left;
}

.firstcolumn{
	background-color:#6c6c6c;
	height:2rem;
	color:#fff;
}

.t2 tr{
	height:2rem;
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
		<div class="nav_menu">적립금</div>
		<hr/>
		<div class="nav_menu">나의 이용후기</div>	
		<hr/>
		<div class="nav_menu menu1">나의 질문</div>
		<hr/>																
	</nav>
	<article>
		<div class="memberinfo">
	     	<b><%=name %></b> 님 
		</div>
		<p/>
		<div id="contentdiv">		
		
		<div class="menuname"><h2>나의 질문</h2></div>
		<hr/>
        <p/>							
		<div class="tabletype2">		
			<table class="t2">
				<tr class="firstcolumn">
					<th width="16%">숙소 명</th>
					<th width="24%">문의날짜</th>
					<th width="42%">문의제목</th>	
					<th width="18%">글 보기</th>																						
				</tr>
				<%
					for(QaDto qd : alist){
				%>
				<tr>
					<td><%=qd.getRoomnum() %></td>
					<td><%=qd.getQdate().substring(0,10) %></td>
					<td class="t1">
					<%for (int i=1; i<=qd.getQlevel(); i++){
							out.println("&nbsp;&nbsp;");
							if(i==qd.getQlevel()){
								out.println("ㄴ");
							}
						}%>
					<%=qd.getQtitle() %></td>
					<td><button type="button" onclick="window.open('<%=request.getContextPath()%>/community/54-1.do?Qidx=<%=qd.getQidx()%>')"  >내용보기</button> </td>																			
				</tr>		
				<% } %>													
			</table>
			</div>			
		</div>	
		</article>
</section>
</form>		
</body>
</html>