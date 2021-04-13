<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "service.*" %>
<% QAVo qv =(QAVo)request.getAttribute("qv"); 

int Midx =0;
if(session.getAttribute("midx") == null || session.getAttribute("midx")=="") {
out.print("test");
	 
	response.sendRedirect(request.getContextPath()+"/mypage/memberlogin.do");
	}else
	{
		
		 Midx = (int)session.getAttribute("midx");
		
	}
	
String midx = Integer.toString(Midx);
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/community/style8.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

</head>
<body>
<%@ include file="header.jsp" %>
<br>
<br>
<br>
<input type="hidden" value="<%=qv.getMIDX()%>" name="M2" class="M2">
<div id="wrap">
<div class="c0">
<div class="c1">
<%=qv.getQTITLE() %>
</div>
<div class="c2">
<span><%=qv.getNAME()%></span>  &nbsp;&nbsp;  <span><%=qv.getQDATE().substring(0,10)%></span> &nbsp;&nbsp;
</div>
<div class="c3">
<div class="c01">
주소:www.fdsfdsf.com<span></span>
</div>

문의항목:<%=qv.getROOMNUM() %>
<br>
<br>
<%=qv.getQCONTENTS() %> 
</div>
<div class="c4">
기타 정보 <div></div>
</div>
</div>
<div class="w"  >
<div class="d1" style="float:right;">
<button style="width:100pt; height:25pt" id="i1" onclick="location.href='<%=request.getContextPath()%>/community/54-2.do?Qidx=<%=qv.getQIDX()%>'">수정</button>
<button style="width:100pt; height:25pt" id="i2" onclick="location.href='<%=request.getContextPath()%>/community/54-3.do?Qidx=<%=qv.getQIDX()%>'">삭제</button>
<button style="width:100pt; height:25pt" id="i3" onclick="location.href='<%=request.getContextPath()%>/community/54-4.do?Qidx=<%=qv.getQIDX()%>&QoriginQidx=<%=qv.getQORIGINQIDX()%>&Qdepth=<%=qv.getQDEPTH()%>&Qlevel=<%=qv.getQLEVEL()%>&Ridx=<%=qv.getRIDX()%>'" >답변</button>

</div>
</div>
</div>


<script>
var M1 = '<%=midx%>';
var M2 = '<%=qv.getMIDX()%>';
var M3 = '<%=(String) session.getAttribute("grade")%>';

if(M1 == M2 ){
	document.getElementById("i1").style.display="block";
	document.getElementById("i2").style.display="block";
	document.getElementById("i3").style.display="none";
	
}else if(M1 == "null"){
	
	document.getElementById("i1").style.display="none";
	document.getElementById("i2").style.display="none";
	document.getElementById("i3").style.display="none";

}else if(M1 != M2){
	
	document.getElementById("i1").style.display="none";
	document.getElementById("i2").style.display="none";
	document.getElementById("i3").style.display="none";
}


if(M3 == "G"){
	
	document.getElementById("i3").style.display="block";
	
}
else if(M3 == "U"){
	
	document.getElementById("i3").style.display="none";
	
}
</script>
<%@ include file="footer.jsp" %>
</body>
</html>