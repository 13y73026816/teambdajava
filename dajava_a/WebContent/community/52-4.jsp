<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "service.*" %>
<% CommentVo cv =(CommentVo)request.getAttribute("cv"); 
   ReViewVo rv =(ReViewVo)request.getAttribute("rv"); 	
%>
<% 
String Cidx = (String)request.getAttribute("Cidx"); 
String Reidx = (String)request.getAttribute("Reidx");

%>       
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function check(){
if(true){
	document.frm.action="<%=request.getContextPath()%>/community/CommentChange.do";
	document.frm.method="post";
	document.frm.submit();
	
	
	
}	
	
	
}

</script>
</head>
<body>

<form name="frm">
<input type="hidden" name="Cidx" value="<%=cv.getCIDX()%>">
<input type="hidden" name="Reidx" value="<%=rv.getREIDX()%>">
수정할 내용을 입력해주세요
<br>
<textarea rows="10" cols="48" name="Ccontents" ><%=cv.getCCONTENTS() %></textarea>
&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;

<button onclick="check()">수정완료</button>
</form>
	

</body>
</html>