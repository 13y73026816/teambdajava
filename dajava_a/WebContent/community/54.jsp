<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "service.*" %>
<%@ page import = "domain.*" %>    
<% ArrayList<QAVo> alist =(ArrayList<QAVo>)request.getAttribute("alist"); 

PageMaker pm =(PageMaker)request.getAttribute("pm");

%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="<%=request.getContextPath()%>/community/style4.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	function check(){
		if(true){
			document.frm.action="<%=request.getContextPath()%>/community/55.do";
			document.frm.method="post";
			document.frm.submit();
			
			
		}
		
		
		
	}


</script> 
<style type="text/css"> 
a { text-decoration:none; } 
a:visited {text-decoration: none; color: black;}


</style> 
</head>
<body>
<%@ include file="header.jsp" %>
<br>
<br>
<br>
<div id="wrap">
<header class="p1">

<h1>Q&A</h1>

</header>
<br>
<br>
<br>
<section class="p2">
<form name="frm">
	<table class="table table-hover">
		<tr>
			<th width="10%" Style="text-align:center;">번호</th>
			<th width="45%" Style="text-align:center;">제목</th>
			<th width="10%" Style="text-align:center;">작성자</th>
			<th width="20%" Style="text-align:center;">날짜</th>
			<th width="15%" Style="text-align:center;">객실</th>
		</tr>
<% for(QAVo qv : alist ){ %>		
		<tr>
			<td Style="text-align:center;"><%=pm.getTotalCount()-((alist.indexOf(qv)+1)+(pm.getScri().getPage()-1)*pm.getScri().getPerPageNum())+1 %></td>

			<td Style="text-align:center;">
			<%for(int i= 1; i<=qv.getQLEVEL(); i++){
	out.print("&nbsp;&nbsp;");
	if(i==qv.getQLEVEL()){
		out.print(" Re:");
		
		
	}



}
	
	
	
	
	
	%>					
			
			
			
			<a href="<%=request.getContextPath()%>/community/54-1.do?Qidx=<%=qv.getQIDX()%>"><%=qv.getQTITLE() %></a></td>
			<td Style="text-align:center;"><%=qv.getNAME() %></td>
			<td Style="text-align:center;"><%=qv.getQDATE().substring(0,10) %></td>
			<td Style="text-align:center;"><%=qv.getROOMNUM() %></td>
			
		</tr>
<% } %>	
	</table>
</form>
</section>



	<section class="p3" >
	<div class="d1" id="i1">
	<button style="width:100pt; height:25pt" onclick="check()">글 쓰기</button>
	</div>	
	</section>


<br>
<br>

<form name="frm1" action="<%=request.getContextPath()%>/community/54.do" method="get">
		<div class="Search" >
  		<input type="text"  placeholder="검색" name="keyword">
  		<input type="submit" name="submit" value="검색">
		</div>
</form>

<br>
  <br>
  <br>
  <br>
  <ul class="pagination  justify-content-center">
    <li>
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
     <% for(int i =pm.getStartPage(); i<=pm.getEndPage(); i++){%>
    <li>
   
    <a class="page-link" href="<%=request.getContextPath()%>/community/54.do?page=<%=i%>"><%=i%></a>
   
    </li>
      <%	} %>
    <li>
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</div>
<script>
var ses = '<%=(String)session.getAttribute("grade")%>';

if(ses == "G"){
	document.getElementById("i1").style.display="block";
	
	
}else if(ses == "null"){
	
	document.getElementById("i1").style.display="none";
		

}else if(ses == "U"){
	
	document.getElementById("i1").style.display="block";
}

</script>


<%@ include file="footer.jsp" %>
</body>
</html>