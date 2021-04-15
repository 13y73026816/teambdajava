<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "service.*" %>
<%@ page import = "domain.*" %>  

<% ArrayList<NoticeVo> alist =(ArrayList<NoticeVo>)request.getAttribute("alist"); 
PageMaker pm =(PageMaker)request.getAttribute("pm");

%> 

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="<%=request.getContextPath()%>/community/style4.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script type="text/javascript">
	function check(){
		if(true){
			document.frm.action="<%=request.getContextPath()%>/community/51.do";
			document.frm.method="post";
			document.frm.submit();
			
			
		}
		
	
		
	}
		
		/*
    	if(grade.equals('G')).css(p3 , 'display') =='none'){
    		$('.p3').show();
    	}else{
    		$('.p3').hide();
    		
    	}
    	*/
    	
    	
    

</script> 
<style>
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
<h1>공지사항</h1>
</header>

<section class="p2">
<form name="frm">
	<table class="table table-hover">
		<tr>
		<th width="10%" class="c1" Style="text-align:center;">글 번호</th>
		<th width="55%" class="c1" Style="text-align:center;">제목</th>
		<th width="15%" class="c1" Style="text-align:center;">작성자</th>
		<th width="20%" class="c1" Style="text-align:center;">작성일</th>
		</tr>
<% for(NoticeVo nv : alist ){ %>			
		<tr>
		<td Style="text-align:center;"><%=pm.getTotalCount()-((alist.indexOf(nv)+1)+(pm.getScri().getPage()-1)*pm.getScri().getPerPageNum())+1 %></td>
		<td Style="text-align:center;"><a href="<%=request.getContextPath()%>/community/51-1.do?Nidx=<%=nv.getNIDX()%>"><%=nv.getNTITLE() %></a></td>
		<td Style="text-align:center;"><%=nv.getNAME() %></td>
		<td Style="text-align:center;"><%=nv.getNDATE().substring(0,10) %></td>
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

<form name="frm1" action="<%=request.getContextPath()%>/community/50.do" method="get">
		<div class="Search" >
  		<input type="text"  placeholder="검색" name="keyword">
  		<input type="submit" name="submit" value="검색">
		</div>
</form>



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
   
    <a class="page-link" href="<%=request.getContextPath()%>/community/50.do?page=<%=i%>"><%=i%></a>
   
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
	
	document.getElementById("i1").style.display="none";
}

</script>

<%@ include file="footer.jsp" %>
</body>
</html>