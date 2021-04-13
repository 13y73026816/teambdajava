<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.*" %>
<%@ page import ="domain.*" %>
<%
	ArrayList<OrderDto> alist = (ArrayList<OrderDto>)request.getAttribute("alist"); 
 	PageMaker pm = (PageMaker)request.getAttribute("pm");
%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자마이페이지</title>
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
				$(location).attr('href','<%=request.getContextPath()%>/bmypage/bmyinfo.do');
			}else if(index==1){
				$(location).attr('href','<%=request.getContextPath()%>/bmypage/memberlist.do');				
			}else if(index==2){
				$(location).attr('href','<%=request.getContextPath()%>/bmypage/myroomdp1.do');					
			}else if(index==3){
				$(location).attr('href','<%=request.getContextPath()%>/bmypage/breserve_pres.do');					
			}
		});	    

	    
    	$('.submenu_span').each(function(index){
  				$(this).attr('submenu-index',index);
		}).click(function(){
			var index = $(this).attr('submenu-index');
			$('.submenu_span[submenu-index='+index+']').addClass('menu_clicked');
			$('.submenu_span[submenu-index!='+index+']').removeClass('menu_clicked');
			if(index==0){
				$(location).attr('href','<%=request.getContextPath()%>/bmypage/breserve_pres.do');	
			}else if(index==1){
				$(location).attr('href','<%=request.getContextPath()%>/bmypage/breserve_canc.do');				
			}else if(index==2){
				$(location).attr('href','<%=request.getContextPath()%>/bmypage/breserve_past.do');			
			}
		}); 
    	
    	$(".ostate").each(function(){
    		var state1 = $(this).val();
    		if(state1=="Y"){
    			$(this).next().text("대기");
    		}else if(state1=="F"){
    			$(this).next().text("완료");
    		}else if(state1=="C"){
				$(this).next().text("취소요청");
			}else if(state1=="W"){
				$(this).next().text("결제대기");
			}
    	});
    	    	
	});  	
	
	function go(){             
		frm.action="<%=request.getContextPath()%>/bmypage/breserve_pres.do";
		frm.method="get";
		frm.submit();
	}
</script>	        
<style>
.menu1,.subm{
	background-color:pink;
}

.firstcolumn{
	color:#fff;
	background-color:#6c6c6c;
}

.b1{
	width:15%; 
 	height:2rem; 
 	border:none;
 	margin-left:5%;
 	font-weight:700;
 	background:#dedede;
}	

.seach1{
	width:80%;
	height:1.8rem; 
	margin-bottom:2%;
}

.t1 tr{
	height:2rem;
}

.t2{
	margin-bottom:1.5%;
	margin-top:1.5%;
	margin-right:2%;
	float:right;
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
<form name="frm">
<section>
	<a href="<%=request.getContextPath()%>/bmypage/bmyinfo.do" class="mypagemain"><h1>마이페이지(관리자)</h1></a>
	<nav>
		<hr/>
		<div class="nav_menu" id="first">관리자정보</div>
		<hr/>
		<div class="nav_menu">회원 관리</div>
		<hr/>
		<div class="nav_menu">객실 관리</div>
		<hr/>
		<div class="nav_menu  menu1">예약 관리</div>	
		<hr/>																
	</nav>
	<article>
		<div id="contentdiv">
		<div class="menuname"><h2>예약 정보</h2></div>
		<hr/>
        <p/>		
		<div class="submenu">
			<span class="submenu_span first subm">예약 중</span> <span class="submenu_span">취소/환불</span> <span class="submenu_span">지난 예약</span>
		<hr class="submenubottom"/>		
		</div>  

		<div class="infotable">		
			
			<table class="t2">
				<tr>
					<td width="40%"><input type="text" class="seach1" name="keyword"></td>
					<td><input type="button" class="b1" name="btn" value="이름검색" onclick="go();"></td>   
				</tr>
			</table>	
			
			<div class="tabletype2" id="sub1">
				<table class="t1">
					<tr class="firstcolumn">
						<th width="10%">일련번호</th>
						<th width="12%;">예약자</th>
						<th width="15%;">연락처</th>
						<th width="12%;">객실(호수)</th>
						<th width="27%;">예약날짜</th>																		
						<th width="12%;">예약상태</th>																		
						<th width="12%;">예약취소</th>																		
					</tr>
					
					<%
						int count = alist.size();
						for(OrderDto odv : alist){
					%>
					<tr>
						<%-- <td><%=pm.getTotalCount()-((alist.indexOf(odv)+1)+(pm.getScri().getPage()-1)*pm.getScri().getPerPageNum())+1 %></td> --%>
						<td><%=count %></td>
						<td><%=odv.getName() %></td>
						<td><%=odv.getPhone() %></td>
						<td><%=odv.getRoomnum() %></td>
						<td><%=odv.getOstart().substring(0,10) %>~<%=odv.getOend().substring(0,10) %></td>
						<td><input type="hidden" class="ostate" value="<%=odv.getOstate() %>"><sapn class="re_ostate"></sapn></td>
						<td><button type="button" onclick="location.href='<%=request.getContextPath()%>/bmypage/cancelState.do?oidx=<%=odv.getOidx()%>'">취소</button></td>																
					</tr>	
					<% count--;} %>								
				</table>
				<table>
					<tr>
						<td><%if (pm.isPrev()==true){ %>
						<a href="<%=request.getContextPath()%>/bmypage/breserve_pres.do?page=<%=pm.getStartPage()-1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">◀</a>
						<%} %>
						</td>
						<td>
						<% for(int i=pm.getStartPage(); i<=pm.getEndPage(); i++){ %>
						<a href="<%=request.getContextPath()%>/bmypage/breserve_pres.do?page=<%=i%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>"><%=i %></a>
						<%} %>
						</td>
						<td><%if (pm.isNext() && pm.getEndPage()>0){ %>
						<a href="<%=request.getContextPath()%>/bmypage/breserve_pres.do?page=<%=pm.getEndPage()+1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">▶</a>
						<%} %>
						</td>
					</tr>
				</table>				
			</div>	
			
		</div>	
		</div>			
	</article>
</section>	
	</form>		
</body>
</html>