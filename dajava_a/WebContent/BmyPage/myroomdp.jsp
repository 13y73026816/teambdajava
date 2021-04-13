<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%RoomVo rv = (RoomVo)request.getAttribute("rv");%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<link href="../mypagestyle.css" rel="stylesheet" type="text/css">
<script src="../jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){	
    $('.nav_menu').each(function(index){
  		$(this).attr('menu-index',index);
	}).click(function(){
		var index = $(this).attr('menu-index');
		$('.nav_menu[menu-index='+index+']').addClass('menu_clicked');
		$('.nav_menu[menu-index!='+index+']').removeClass('menu_clicked');			
		if(index==0){
			$(location).attr('href','<%=request.getContextPath()%>/bmypage/bmyinfo.do');
		}else if(index==1){
			$(location).attr('href','<%=request.getContextPath()%>/bmypage/memberlist.do');				
		}else if(index==2){
			$(location).attr('href','<%=request.getContextPath()%>/bmypage/myroomdp1.do');					
		}else if(index==3){
			$(location).attr('href','<%=request.getContextPath()%>/bmypage/breserve_pres.do');					
		}
	});	    
});

$(function(){
	var text = $('.supply').val();
	arr = text.split(',');

	var cnt = arr.length;

	for(var i=0; i<cnt; i++){
	  $('input:checkbox[name=rsupply1]').each(function(){
	    if(this.value == arr[i]){
	    this.checked = true;
	    }
	  });
	}
});

function check(str){
	var select = document.getElementById("roomnum");
    var selValue = select.options[select.selectedIndex].value;
    var selRoom = select.options[select.selectedIndex].text;
    
	var url = '<%=request.getContextPath()%>';
	document.frm.action =url+"/bmypage/myroomdp.do?roomnum="+selRoom;
	document.frm.method ="post";
	document.frm.submit();
	return;
} 
		
</script>
<style>

.menuname{
 	display:flex;
	align-items:center;
}

.sel,button{
	width:7rem;
	height:2rem;
	text-align:center;
	font-size:1rem;
}

.sel{
	margin-left:1rem;
	padding-left:1rem;
}

.btn2{
	margin-left:40%;
}

.menu1{
	background-color:pink;
}

.img{
	width:100px;
	height:100px;
}
</style>
</head>
<body>
<form name="frm">
<section>
	<a href="<%=request.getContextPath()%>/bmypage/bmyinfo.do" class="mypagemain"><h1>마이페이지(관리자)</h1></a>
	<nav>
		<hr/>
		<div class="nav_menu" id="first">관리자정보</div>
		<hr/>
		<div class="nav_menu">회원 관리</div>
		<hr/>
		<div class="nav_menu menu1">객실 관리</div>
		<hr/>
		<div class="nav_menu">예약 관리</div>	
		<hr/>																
	</nav>
	<article>
		<div id="contentdiv">
		<div class="menuname" id="menuname"><h2>객실 정보</h2>&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn1"><%=rv.getRoomnum() %></button>&nbsp;&nbsp;&nbsp;
			<select class="sel" id="roomnum" name="sel" onchange="check()">
			<option value="선택" selected>객실선택</option>
			<option value="1">A 101</option>
			<option value="2">A 102</option>
			<option value="3">A 201</option>
			<option value="4">A 202</option>
			<option value="5">C 101</option>
			<option value="6">C 102</option>
			<option value="7">C 201</option>
			<option value="8">C 202</option>
			<option value="9">본관101</option>
			<option value="10">황토방1</option>
			<option value="11">황토방2</option>
			</select>
		</div>
		<hr/>	
		<p/>
			<div class="sub">
			<div class="submenuname"><b>객실 기본 정보</b></div>		
			<hr/>	
			<div class="tabletype2">	
				<table width="66rem;">
					<tr class="firstcolumn">
						<th width="25%">기준 인원</th>
						<th width="25%">최대 인원</th>
						<th width="25%">기준인원 가격</th>
						<th width="25%">초과 1인당 가격</th>
					</tr>
					<tr>
						
						<td><%=rv.getRbaseperson() %></td>
						<td><%=rv.getRfullperson() %></td>
						<td>&#8361; <%=rv.getRbaseprice() %></td>
						<td>&#8361; <%=rv.getRaddperson() %></td>
					</tr>
					<tr class="firstcolumn">
						<th>비성수기평일</th>
						<th>비성수기주말</th>
						<th>성수기평일</th>
						<th>성수기주말</th>
					</tr>
					<tr>					
						<td>&#8361; <%=rv.getRoffseason1() %></td>
						<td>&#8361; <%=rv.getRoffseason2() %></td>
						<td>&#8361; <%=rv.getRbusyseason1() %></td>
						<td>&#8361; <%=rv.getRbusyseason2() %></td>
					</tr>								
				</table>
			</div>	
			</div>
			
			<div class="sub">
			<div class="submenuname"><b>객실 내 구비용품</b></div>		
			<hr/>	
			<div class="tabletype1">	
				<table width="66rem;">
					<tr>
						<td><input type="checkbox" class="rsupply1" name="rsupply1" value="1" >TV</td>
						<td><input type="checkbox" class="rsupply1" name="rsupply1" value="2">식탁</td>
						<td><input type="checkbox" class="rsupply1" name="rsupply1" value="3">냉장고</td>
						<td><input type="checkbox" class="rsupply1" name="rsupply1" value="4">드라이기</td>
						<td><input type="checkbox" class="rsupply1" name="rsupply1" value="5">취사도구</td>
						<td><input type="checkbox" class="rsupply1" name="rsupply1" value="6">전기밥솥</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="rsupply1" name="rsupply1" value="7">인터넷</td>
						<td><input type="checkbox" class="rsupply1" name="rsupply1" value="8">욕실용품</td>
						<td><input type="checkbox" class="rsupply1" name="rsupply1" value="9">옷장</td>
						<td><input type="checkbox" class="rsupply1" name="rsupply1" value="10">에어컨</td>
						<td><input type="checkbox"></td>
						<td><input type="hidden" class="supply" value="<%=rv.getRsupply() %>"></td>
					</tr>							
				</table>
			</div>	
			</div>
			<div class="sub">
			<div class="submenuname"><b>객실사진</b></div>		
			<hr/>
				<div class="img"><img style="width:10rem; height:7rem;" src="<%=request.getContextPath()%>/filefolder/<%=rv.getRfile()%>"></div>		
			</div>	
			<div class="sub">
			<button type="button" class="btn2"><a href="<%=request.getContextPath()%>/bmypage/roomModify.do?roomnum=<%=rv.getRoomnum()%>">수정하기</a></button>
			</div>	
			</div>			
	</article>
</section>
</form>
</body>
</html>