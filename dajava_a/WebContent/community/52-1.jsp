<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "service.*" %>
<%@ page import = "domain.*" %>  
<% ReViewVo rv =(ReViewVo)request.getAttribute("rv"); %> 
<% 
int Midx =0;
if(session.getAttribute("midx") == null || session.getAttribute("midx")=="") {
out.print("test");
	 
	
	}else
	{
		
		 Midx = (int)session.getAttribute("midx");
		
	}
	
String midx = Integer.toString(Midx);
ArrayList<CommentVo> alist =(ArrayList<CommentVo>)request.getAttribute("alist"); 
CommentVo cv2 =(CommentVo)request.getAttribute("cv2"); 

PageMaker pm2 =(PageMaker)request.getAttribute("pm2");


ArrayList<ReViewVo> alist2 =(ArrayList<ReViewVo>)request.getAttribute("alist2"); 
request.setAttribute("alist2", alist2);
PageMaker pm =(PageMaker)request.getAttribute("pm");
request.setAttribute("pm", pm);





ArrayList<ReViewVo> al =(ArrayList<ReViewVo>)request.getAttribute("al"); 
%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/community/style8.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script type="text/javascript">


function check3(){
	
	if(true){
		
		document.frm.action="<%=request.getContextPath()%>/community/CommentAction.do";
		document.frm.method="post";
		docment.frm.submit();
		
	}

}
function check2(){
	
	if(true){
		
		document.frm.action="<%=request.getContextPath()%>/community/ReAction.do";
		document.frm.method="post";
		document.frm.submit();
		
	}

}
function Reco(){
	
	if(true){
		
		document.fr.action="<%=request.getContextPath()%>/community/Recommendation.do";
		document.fr.method="post";
		document.fr.submit();
		
	}

}


</script>
<script type="text/javascript">
 var stmnLEFT = 200; // 오른쪽 여백 
 var stmnGAP1 = 0; // 위쪽 여백 
 var stmnGAP2 = 250; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
 var stmnBASE = 150; // 스크롤 시작위치 
 var stmnActivateSpeed = 20; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
 var stmnScrollSpeed = 10; //스크롤 속도 (클수록 느림)
 var stmnTimer; 
 
 function RefreshStaticMenu() { 
  var stmnStartPoint, stmnEndPoint; 
  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
  if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
  if (stmnStartPoint != stmnEndPoint) { 
   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
   document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
   stmnRefreshTimer = stmnScrollSpeed; 
   }
  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
  } 
 function InitializeStaticMenu() {
  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
  RefreshStaticMenu();
  }
</script>

<style type="text/css">
#STATICMENU { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
a:link {text-decoration: none; color:blue;}
a:visited {text-decoration: none; color: black;}
a:hover {text-decoration: underline; color: blue;}
</style>

</head>
<body onload="InitializeStaticMenu();">
<%@ include file="header.jsp" %>
<div id="wrap">
<input type="hidden" value="<%=rv.getMIDX()%>" name="M2" class="M2">
<br>
<br>
<br>
<div class="c0">
<div class="c1"> <!-- 1  -->
<%=rv.getRETITLE() %>
</div>
<div class="c2"> <!-- 2 -->
<span>작성자:<%=rv.getNAME()%></span>  &nbsp;&nbsp;  <span>작성일:<%=rv.getREDATE().substring(0,10)%></span> &nbsp;&nbsp; 조회수:<%=rv.getRCOUNT() %> &nbsp;&nbsp; 추천수:<%=rv.getRECOMMENDATION() %>
</div>
<div class="c3">
<div class="c01">
<span>주소:www.fdsfdsf.com</span>

</div>
<br>

<br>
<img id="image"/>
<br>
<%=rv.getRECONTENTS() %>



</div>
<div class="c4">
그 외 기능 <div>

<form name="fr"><input type="hidden" value="<%=rv.getREIDX()%>" name="Reidx">
<input type="button" value="추천하기" name="Recommendation" style="text-align:center; float:right; height:18pt; display:none;" onclick="Reco()" id="reco"></form>
</div>
</div>
<div class="c5">
댓글
<br>
<br>
<p/>

<form name="frm">
<table  style="text-align:center; width:100%; border-collapse: collapse;" >
<% for(CommentVo cv : alist ){ 

if(cv.getCDEPTH()==0){
 
%>
	

    <tr>
		<td style="background-color:#EAEAEA"colspan="4" ><span style="float:left;"><%=cv.getNAME() %></span><span style="float:right;"><%=cv.getCDATE() %></span></td> 
	</tr>
	<tr>
	
		<td colspan="4"  class="re03" style="text-align:left;"><%=cv.getCCONTENTS() %> <div>
	

	
	<% 	
	
	if (cv.getMIDX()  == Integer.parseInt(midx)) {
		    
		%>
		 <a href="<%=request.getContextPath()%>/community/CommentdeleteAction.do?Cidx=<%=cv.getCIDX()%>&Reidx=<%=rv.getREIDX()%>" class="c00" id="i4">
		 삭제</a>
	<% } %>
		<% 	
	
	if (cv.getMIDX()  == Integer.parseInt(midx)) {
		    
		%>
		  <a href="#none"  class="c00" id="i5" onclick="window.open('<%=request.getContextPath()%>/community/52-4.do?Cidx=<%=cv.getCIDX()%>&Reidx=<%=rv.getREIDX() %>','new','scrollbars=yes,resizable=no width=380 height=285, left=770,top=397.5');return false" >
        	수정</a>
	<% } %>
		<% 	
	
	if (cv.getMIDX()  != Integer.parseInt(midx)) {
		    
		%>
		 <a href="#" onclick="window.open('<%=request.getContextPath()%>/community/52-5.do?Cidx=<%=cv.getCIDX()%>&CoriginCidx=<%=cv.getCORIGINCIDX()%>&Cdepth=<%=cv.getCDEPTH()%>&Clevel=<%=cv.getCLEVEL()%>&Reidx=<%=cv.getREIDX() %>','new','scrollbars=no,resizable=no width=380 height=285, left=770,top=397.5');return false" class="c01 re03" id="i6">답댓글</a></div>
	<% } %>
				 
		 
		 </td>
	
	</tr>

	
	
	
	
<% for(CommentVo ccv : alist ){ 	

if(ccv.getCORIGINCIDX() == cv.getCIDX()){
	if(ccv.getMIDX()  != cv.getMIDX()){

%>
	<tr>
	<td><input id="ii" class="MM" value="<%=ccv.getMIDX()%>" type="hidden"></td>
	</tr>

	 <tr class="re00">
	 <td width="10%" style="background-color:white" ></td>
		<td style="background-color:#EAEAEA"colspan="3" width="90%" ><span style="float:left;"><%=ccv.getNAME() %></span><span style="float:right;"><%=ccv.getCDATE() %></span></td> 
	</tr>
	
	
	
	<tr class="re000">
		<td width="10%"></td>
		<td colspan="3"  style="text-align:left;">
		<%=ccv.getCCONTENTS() %>
		</td>
	</tr>
	<tr>
	<td width="10%"></td>
		<td colspan="3"  style="text-align:left;">
		<% 	
	
	if (ccv.getMIDX()  == Integer.parseInt(midx)) {
		    
		%>
		 <a href="<%=request.getContextPath()%>/community/CommentdeleteAction.do?Cidx=<%=ccv.getCIDX()%>&Reidx=<%=rv.getREIDX()%>" class="c00" id="i4">
		 삭제</a>
	<% } %>
	<% 	
	
	if (ccv.getMIDX()  == Integer.parseInt(midx)) {
		    
		%>
		  <a href="#none"  class="c00" id="i5" onclick="window.open('<%=request.getContextPath()%>/community/52-4.do?Cidx=<%=ccv.getCIDX()%>&Reidx=<%=rv.getREIDX() %>','new','scrollbars=yes,resizable=no width=380 height=285, left=770,top=397.5');return false" >
        	수정</a>
	<% } %>
	
	
		
	</td>
	</tr>
	
	
	
	
	<% }
	}
}
}
}%>
 	
		

</table>


<ul class="pagination  justify-content-center">
    <li>
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
     <% for(int i2 =pm2.getStartPage(); i2<=pm2.getEndPage(); i2++){%>
    <li>
   
    <a class="page-link" href="<%=request.getContextPath()%>/community/52-1.do?page=<%=i2%>&Reidx=<%=rv.getREIDX()%>"><%=i2%></a>
   
    </li>
      <%	} %>
    <li>
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>











<div style="width:100%;" id="i3">
<input type="hidden" value="<%=rv.getREIDX()%>" name="Reidx" class="R1">
<input type="hidden" value="<%=session.getAttribute("midx")%>" name="Midx"  >
<br>
<textarea rows="3" style="width:100%;" placeholder="댓글을 작성하는 곳입니다" name="Ccontents"></textarea>
<button onclick="check3()" style="float:right;">댓글등록</button>
</div>
</form>

<br>
<br>




<div  class ="d1" style="float:right;" >
<button style="width:100pt; height:25pt" onclick="location.href='<%=request.getContextPath()%>/community/52-2.do?Reidx=<%=rv.getREIDX()%>'" id="i1">수정</button>
<button style="width:100pt; height:25pt" onclick="location.href='<%=request.getContextPath()%>/community/52-3.do?Reidx=<%=rv.getREIDX()%>'" id="i2">삭제</button>

</div>

</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div style="bottom-padding:50px;"></div>
<div style="clear:both;">


<jsp:include page="00.jsp" >
<jsp:param value="<%=alist2%>" name="alist"/>
<jsp:param value="<%=pm%>" name="pm"/>

</jsp:include>


</div>




</div>



<div id="STATICMENU">
<table  width="200" style="background-color:#F6F6F6; border: 1px solid black;">
	<tr style="text-align:center; text-font:20px;">
		<td>
		<a href="<%=request.getContextPath()%>/reserve/reserveState.do">방예약 하기</a>
		</td>
	</tr>
	
	<tr style="text-align:center;">
		<td>
		<a href="<%=request.getContextPath()%>/path/room1.do">방 정보보기</a>
		</td>
	</tr>
	
	<tr style="text-align:center;">
		<td>
		<a href="<%=request.getContextPath()%>/community/52.do">방 리뷰보기</a>
		</td>
	</tr>
</table>

<br>
<b>인기 리뷰</b>

<jsp:include page="01.jsp" >
<jsp:param value="<%=al%>" name="al"/>
</jsp:include>






</div> 

































</div>
<%@ include file="footer.jsp" %>
<script>
var M1 = '<%=session.getAttribute("midx")%>';
var M2 = '<%=rv.getMIDX()%>';

if(M1 == M2 ){
	document.getElementById("i1").style.display="block";
	document.getElementById("i2").style.display="block";
	
}else if(M1 == "null"){
	
	document.getElementById("i1").style.display="none";
	document.getElementById("i2").style.display="none";
	document.getElementById("i3").style.display="none";
}else if(M1 != M2){
	
	document.getElementById("i1").style.display="none";
	document.getElementById("i2").style.display="none";

}
if(M2 == "null"){
	document.getElementById("i4").style.display="none";
	document.getElementById("i5").style.display="none";
	document.getElementById("i6").style.display="none";
	
	
}
if(M1 != "null" && M1 != ""){
	
	document.getElementById("reco").style.display="block";
}


</script>
 <script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
    var M1 = '<%=session.getAttribute("midx")%>';
    var M2 = '<%=rv.getMIDX()%>';
    var M3 = $(".MM").val();
   	var M4 = $(".re01")
    var M5 = $(".re02")
    
      $( document ).ready( function() {
       if(M1 === 'null'){
    	   $(".c00").css("display","none");
    	   $(".c01").css("display","none");
       }
      
       
        
      } );
   	
 

   
        	

    
       

       
      
    </script>

    <script>
    document.onpaste = function(event){

        var items = (event.clipboardData || event.originalEvent.clipboardData).items;

        console.log(JSON.stringify(items)); // will give you the mime types

        for (index in items) {

                var item = items[index];

                if (item.kind === 'file') {

                        var blob = item.getAsFile();

                        var reader = new FileReader();

                        reader.onload = function(event){

                                console.log(event.target.result)

                        }; // data url!

                        reader.readAsDataURL(blob);

                        

                        var urlCreator = window.URL || window.webkitURL;

                        var imageUrl = urlCreator.createObjectURL(blob);

                        var img = document.getElementById("image");

                        img.src =imageUrl;              

                }

        }

}
    
    
    </script>





</body>
</html>