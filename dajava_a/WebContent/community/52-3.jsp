<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int Reidx2 =(int)request.getAttribute("Reidx2"); %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/community/style5.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script type="text/javascript">
 function check(){
	 if (document.frm.RePassword.value ==""){
		  alert("비밀번호를 입력해주세요");
		  document.frm.RePassword.focus();
		  return;}
	 
	 
	 
	 
	 var a = confirm("정말로 삭제 하시겠습니까?");
	 
	  if(a==true){
	  document.frm.action ="<%=request.getContextPath()%>/community/deleteAction2.do";
	  document.frm.method = "post";
	  document.frm.submit(); 
	  return;
	  }
	  }
 function goBack(){
		
	 
	 document.frm.action ="<%=request.getContextPath()%>/community/52-1.do";
	 document.frm.method = "post";
	 document.frm.submit(); 	 
	 return;
	
}

 </script> 
</head>
<body>
<h1>Review 삭제</h1>

<form name="frm">
<input type="hidden" name="Reidx" value="<%=Reidx2%>">
<b class="c1">비밀 번호를 입력하세요</b>	&nbsp;&nbsp; 	&nbsp;&nbsp; 
<p/>
	<div class="p1">
	<input type="password" class="p2" name="RePassword" value="">
	</div>


<div class="c4">
<button style="width:100pt; height:25pt" onclick="check()">삭제하기</button>
</div>
<div class="c5">
<button style="width:100pt; height:25pt" onclick="goBack()">뒤로가기</button>
</div>

</form>
</body>
</html>