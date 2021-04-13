<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
String Reidx = (String)request.getAttribute("Reidx"); 
String Cidx = (String)request.getAttribute("Cidx"); 
String CoriginCidx = (String)request.getAttribute("CoriginCidx"); 
String Cdepth = (String)request.getAttribute("Cdepth"); 
String Clevel = (String)request.getAttribute("Clevel"); 
int Midx = (int)session.getAttribute("midx");
String midx = Integer.toString(Midx);

 %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check2(){
	
	if(true){
		
		document.frm.action="<%=request.getContextPath()%>/community/ReAction.do";
		document.frm.method="post";
		docment.frm.submit();
		
		
		
		
	}
	



}


</script>
</head>
<body>
댓답글을 입력해주세요
<form name="frm">
<table>
<tr>
	<td width="10%">
	</td>
	<td colspan="3" class="re02" >
	<div style="width:720px;"  class="re02">
	<input type="hidden" value="<%=Reidx%>" name="Reidx" class="R1">
	<input type="hidden" value="<%=midx%>" name="Midx"  >
	<input type="hidden" name="Cidx" value="<%=Cidx%>">
	<input type="hidden" name="CoriginCidx" value="<%=CoriginCidx%>">
	<input type="hidden" name="Cdepth" value="<%=Cdepth%>">
    <input type="hidden" name="Clevel" value="<%=Clevel%>">
	<br>
	<textarea rows="3" cols="47" placeholder="답댓글을 작성하는 곳입니다" name="Ccontents"></textarea>
	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;   
	<button onclick="check2()">댓글등록</button>
	</div>	
	</td>
	</tr>



</table>


</form>
</body>
</html>