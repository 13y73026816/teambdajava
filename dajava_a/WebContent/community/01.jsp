<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "service.*" %>
<%@ page import = "domain.*" %>    
<% ArrayList<ReViewVo> al =(ArrayList<ReViewVo>)request.getAttribute("al"); 


 

%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	function check(){
		if(true){
			document.frm2.action="<%=request.getContextPath()%>/community/53.do";
			document.frm2.method="post";
			document.frm2.submit();
			
			
		}
		
		
		
	}


</script> 
<style>
a:link{color:blue; text-decoration:none;}
a:visited { color:black; text-decoration:none; }
a:hover { color:blue;  text-decoration: underline;}
a:active { color:blue;  text-decoration:none;}

</style> 
</head>
<body>

<div id="wrap">
<header class="p1">



</header>


<form name="frm2">
	<table class="table table-hover" style="background-color:#EAEAEA;" border="1">
<% for(ReViewVo rv : al ){ %>		
		<tr>
			<td Style="text-align:center;"><a   href="<%=request.getContextPath()%>/community/52-1.do?Reidx=<%=rv.getREIDX()%>"> <%=rv.getRETITLE() %></a></td>
		</tr>
<% } %>	
	</table>
</form>

</div>

</body>
</html>