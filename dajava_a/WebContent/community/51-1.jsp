<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "service.*" %>
<% NoticeVo nv =(NoticeVo)request.getAttribute("nv");

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/community/style8.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

</head>
<%@ include file="header.jsp" %>
<body> 
<br>
<br>
<br>


<div id="wrap">
<div class="c0">
<div class="c1">
<%=nv.getNTITLE() %>
</div>
<div class="c2">
<span><%=nv.getNAME()%></span>  &nbsp;&nbsp;  <span><%=nv.getNDATE().substring(0,10) %></span> &nbsp;&nbsp;
</div>
<div class="c3">
<div class="c01">
주소:www.fdsfdsf.com<span></span>
</div>
<%=nv.getNCONTENTS() %>
</div>
</div>
<div  class="w" >
<div class="d1" id="i1">
<button style="width:100pt; height:25pt" onclick="location.href='<%=request.getContextPath()%>/community/51-2.do?Nidx=<%=nv.getNIDX()%>'">수정</button>
<a href="#none" onclick="window.open('<%=request.getContextPath()%>/community/51-3.do?Nidx=<%=nv.getNIDX()%>','new','scrollbars=yes,resizable=no width=380 height=285, left=0,top=0');return false" ><button style="width:100pt; height:25pt" >삭제</button></a>
</div>

</div>
</div>
<br>
<br>

<script>
var ses = '<%=(String)session.getAttribute("grade")%>';

if(ses == "G"){
	document.getElementById("i1").style.display="block";
	document.getElementById("i2").style.display="block";
	
}else if(ses == "null"){
	
	document.getElementById("i1").style.display="none";
	document.getElementById("i2").style.display="none";

}else if(ses == "U"){
	
	document.getElementById("i1").style.display="none";
	document.getElementById("i2").style.display="none";
}

</script>

<%@ include file="footer.jsp" %>
</body>
</html>