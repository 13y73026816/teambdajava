<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int Nidx2 =(int)request.getAttribute("Nidx2"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
 <script type="text/javascript">
 function check(){
	 if (document.frm.Npassword.value ==""){
		  alert("비밀번호를 입력해주세요");
		  document.frm.Npassword.focus();
		  return;}
	 
	 var a = confirm("정말로 삭제 하시겠습니까?");
	 
	  if(a==true){
	  document.frm.action ="<%=request.getContextPath()%>/community/deleteAction.do";
	  document.frm.method = "post";
	  document.frm.submit(); 
	  return;
	  }
	  }
 function goBack(){
		
	 
	 document.frm.action ="<%=request.getContextPath()%>/community/51-1.do";
	 document.frm.method = "post";
	 document.frm.submit(); 	 
	 return;
	
}

 </script>
</head>
<body>
<h1 style="text-align:center">공지사항 삭제</h1>

<form name="frm">
<div >
<input type="hidden" name="Nidx" value="<%=Nidx2%>">
<b class="c1" >비밀 번호를 입력하세요</b>	&nbsp;&nbsp; 	&nbsp;&nbsp; 
<p/>
	<div class="p1">
	<input type="password" name="Npassword" class="p2" value="">
	</div>
</div>
<br>
<div class="c4">
<button style="width:100pt; height:25pt" onclick="check()">삭제하기</button>
</div>
<div class="c5">
<button style="width:100pt; height:25pt" onclick="goBack()">뒤로가기</button>
</div>



</form>



</body>
</html>