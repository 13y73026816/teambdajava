<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.*" %>
<%@ page import ="domain.*" %>
<%
	ArrayList<MypageVo> alist = (ArrayList<MypageVo>)request.getAttribute("alist"); 
 	PageMaker pm = (PageMaker)request.getAttribute("pm");
 	String type = (String)request.getAttribute("type");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/bd3b61eb91.js" crossorigin="anonymous"></script>
<link href="../mypagestyle.css" rel="stylesheet" type="text/css">
<script src="../jquery-3.5.1.min.js"></script>  
<script>
	
	$(document).ready(function(){
		var type = '<%= type%>'; 
		if(type == "up"){
			$(".up").show();
			$(".down").hide();
		}else{
			$(".up").hide();
			$(".down").show();
		}
		
		
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
	
	function memberDelete(id){
		var url = '<%=request.getContextPath()%>'; 
		$.ajax({
			url: url+"/bmypage/memberDelete.do",
			type: "get",
			data:"id="+id, 
			success: function(){
				$(".id").each(function(){
					
					 var num = Number($(this).parent().prev().find(".number").text());
					 if($(this).text()==id){
						$(this).parent().parent().remove();
						$(this).parent().prev().children().text(Number(num)-1); 
					 }
				
				});
			},
			error:function(){
				console.log("회원삭제실패입니다!!");
			}
		});
		return;
		
	} 
	
	function go(){             
		frm.action="<%=request.getContextPath()%>/bmypage/memberlist.do";
		frm.method="get";
		frm.submit();
	}
	

</script>
<style>
.menu1{
	background-color:pink;
}

.hide a{
	text-decoration:none;
	background-color:#f0f0f0;
	
}

.sort{
	margin-left:10px;
}

.sort_t{
	margin:0;
}

.name{
	margin:0;
}
th{
	color:white;
}

.firstcolumn{
	background-color:#6c6c6c;
	color:#fff;
}
	
.b1{
	width:15%; 
 	height:2rem; 
 	background:pink;
 	border:none;
 	margin-left:5%;
}	

.seach1{
	width:80%;
	height:1.8rem; 
	margin-bottom:2%;
}

.t1 tr{
	height:2rem;
}
</style>
</head>
<body>

<section>
	<a href="<%=request.getContextPath()%>/bmypage/bmyinfo.do" class="mypagemain"><h1>마이페이지(관리자)</h1></a>
	<nav>
		<hr/>
		<div class="nav_menu " id="first">관리자정보</div>
		<hr/>
		<div class="nav_menu menu1">회원 관리</div>
		<hr/>
		<div class="nav_menu">객실 관리</div>
		<hr/>
		<div class="nav_menu">예약 관리</div>	
		<hr/>																
	</nav>
	<article>
		<div id="contentdiv">
	<div class="menuname"><h2>회원 관리</h2></div>
	<hr/>	
	<p/>	
	
<form name="frm">          
<table>
	<tr>
		<td width="40%"><input type="text" class="seach1" name="keyword"></td>
		<td><input type="button" class="b1" name="btn" value="이름검색" onclick="go();"></td>   
	</tr>
</table>
</form>
		<div class="tabletype2">	
			<table class="t1">
				<tr class="firstcolumn">
					<th width="9%">일련번호</th>
					<th width="10%;">아이디</th>
					<th width="11%;">이름</th>
					<th width="16%;">전화번호</th>
					<th width="18%;">이메일</th>
					<th width="10%;">생년월일</th>
					<th width="16%">가입일자<span class="sort"><button onclick="location.href='<%=request.getContextPath()%>/bmypage/sort_az.do'" class="up"><i class="fas fa-sort-up"></i></button><button onclick="location.href='<%=request.getContextPath()%>/bmypage/sort_za.do'" class="down"><i class="fas fa-sort-down"></i></button></span></th>
					<th width="10%;">회원삭제</th>
				</tr>
				<%
					for(MypageVo mv : alist){%>
				
				<tr>
					<td><span class="number"><%=pm.getTotalCount()-((alist.indexOf(mv)+1)+(pm.getScri().getPage()-1)*pm.getScri().getPerPageNum())+1 %></span></td>
					<td><span class="id"><%=mv.getId() %></span></td>
					<td><%=mv.getName() %></td>
					<td><%=mv.getPhone() %></td>
					<td><%=mv.getEmail() %></td>
					<td><%=mv.getBirthday() %></td>
					<td><%=mv.getEnter().substring(0,10) %></td>
					<td><button type="button" class="btn1" onclick="memberDelete('<%=mv.getId() %>');">삭제</button></td>
				</tr>
					<% } %>
			</table>
		</div>
		<p/>
		<table width="100px" align="center">
			<tr>
				<td><%if (pm.isPrev()==true){ %>
				<a href="<%=request.getContextPath()%>/bmypage/memberlist.do?page=<%=pm.getStartPage()-1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">◀</a>
				<%} %>
				</td>
				<td>
				<% for(int i=pm.getStartPage(); i<=pm.getEndPage(); i++){ %>
				<a href="<%=request.getContextPath()%>/bmypage/memberlist.do?page=<%=i%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>"><%=i %></a>
				<%} %>
				</td>
				<td><%if (pm.isNext() && pm.getEndPage()>0){ %>
				<a href="<%=request.getContextPath()%>/bmypage/memberlist.do?page=<%=pm.getEndPage()+1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">▶</a>
				<%} %>
				</td>
			</tr>
		</table>
		</div>			
	</article>
</section>

</body>
</html>