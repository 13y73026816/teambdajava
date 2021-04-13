<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%MypageVo mv = (MypageVo)request.getAttribute("mv"); 
String name = (String)session.getAttribute("name");
int midx1 = (int)session.getAttribute("midx");%>

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
	
	function check(){
		
		if(document.frm.id.value == ""){
			alert("아이디를 입력해주세요");
			document.frm.id.focus();
			return;
		}else if(document.frm.password.value == ""){
			alert("비밀번호를 입력해주세요");
			document.frm.password.focus();
			return;
		}else if(document.frm.email.value == ""){
			alert("내용을 입력해주세요");
			document.frm.email.focus();
			return;
		}else if(document.frm.phone.value == ""){
			alert("작성자를 입력해주세요");
			document.frm.phone.focus();
			return;
		}else if(document.frm.addr.value == ""){
			alert("비밀번호를 입력해주세요");
			document.frm.addr.focus();
			return;
		}
		
		alert("수정합니다!!test");                                          
		var url = '<%=request.getContextPath()%>';
		document.frm.action =url+"/mypage/infoModifyAction.do?midx=<%= midx1%>";
		document.frm.method ="post";
	//	document.frm.enctype="multipart/form-data";      
		document.frm.submit();
		return;
	}
</script>
<style>
.menu1{
	background-color:pink;
}

table{
	height:250px;
}

.btn_c{
 	width:20%; 
 	height:3rem; 
 	background:pink;
 	border:none;
 	font-size:1.1rem;
 
}

.inp{
	height:1.6rem;
	margin-top:10px;
	margin-bottom:10px;
	text-align:center;
	font-size:1rem;
	margin-left:3%;
}

.tit{
	font-size:1.1rem;
}

</style>
</head>
<body>
<form name="frm">
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
		<div class="menuname"><h2>내 정보 수정</h2></div>
		<hr/>	
		<p/>				
		<div class="tabletype1">		
			<table>
				<tr>
					<th width="20%;" class="tit">아이디</th>
					<td colspan="2"><input  class="inp" name="id" value="<%=mv.getId() %>"></td>
				</tr>
				<tr>
					<th class="tit">비밀번호</th>
					<td width="80%;"><input  class="inp" type="password" name="password" value="<%=mv.getPassword()%>"></td>
						
				</tr>
				<tr>
					<th class="tit">E-mail</th>
					<td><input name="email"  class="inp" value="<%=mv.getEmail() %>"></td>
								
				</tr>
				<tr>
					<th class="tit">전화번호</th>
					<td><input name="phone"  class="inp" value="<%=mv.getPhone() %>"></td>
									
				</tr>
				<tr>
					<th class="tit">주소</th>
					<td><input name="addr"  class="inp" value="<%=mv.getAddr() %>"></td>
								
				</tr>								
			</table>
		</div>	
		<button class="btn_c"  onclick="check();"><b>등록하기</b></button>
	</div>	
	</article>
</section>
</form>
</body>
</html>