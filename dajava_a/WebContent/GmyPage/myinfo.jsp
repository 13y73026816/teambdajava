<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%MypageVo mv = (MypageVo)request.getAttribute("mv"); 
String name = (String)session.getAttribute("name"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
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

table{
	height:250px;
	font-size:1.1rem;
}

.mname{
 	width:15%; 
 	height:2rem; 
 	background:pink;
 	border:none;
 	margin-left:5%;
 	font-size:1rem;
}
</style>
</head>
<body>
<form>
<section>
	<a href="<%=request.getContextPath()%>/mypage/myinfo.do" class="mypagemain"><h1>마이페이지(일반회원)</h1></a>
	<nav>
		<hr/>
		<div class="nav_menu menu1" id="first">내 정보</div>
		<hr/>
		<div class="nav_menu">예약 정보</div>
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
		<div class="menuname"><h2>내 정보</h2><button class="mname" type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/infoModify.do?midx=<%=mv.getMidx()%>'"><b>수정하기</b></button></div>
		<hr/>	
		<p/>				
		<div class="tabletype1">		
			<table>
				<tr>
					<th width="30%;">아이디</th>
					<td colspan="2"><%=mv.getId() %></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td width="50%;"><input type="password" value="<%=mv.getPassword() %>"></td>
						
				</tr>
				<tr>
					<th>E-mail</th>
					<td><%=mv.getEmail() %></td>
								
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%=mv.getPhone() %></td>
									
				</tr>
				<tr>
					<th>주소</th>
					<td><%=mv.getAddr() %></td>
								
				</tr>								
			</table>
		</div>	
	</div>	
	</article>
</section>
</form>
</body>
</html>