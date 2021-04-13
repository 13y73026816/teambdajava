<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "service.*" %>
<% NoticeVo nv =(NoticeVo)request.getAttribute("nv"); 
	
%> 
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=ctx %>/community/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/dajava_a/community/SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
 
 
 
</script>
<link href="<%=request.getContextPath()%>/community/style5.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
</head>
<body>
<h1>공지사항 수정</h1>
<form name="frm" id="frm" action="<%=request.getContextPath()%>/community/changeAction.do" method="post">
<input type="hidden" name="Nidx" value="<%=nv.getNIDX() %>">
<b class="c1">제목</b>	&nbsp;&nbsp; 	&nbsp;&nbsp; 
<table >
	<tr>
		<th class="c3"><input type="text" style="width:940px; height:50px;" class="c2" name="Ntitle" value="<%=nv.getNTITLE() %>" id="title"></th>
	</tr>
</table>
<b class="c1">본문</b>	&nbsp;&nbsp; 	&nbsp;&nbsp; 
<table>
	<tr>
		<td><textarea rows="25" cols="131" name="Ncontents" id="ir1"><%=nv.getNCONTENTS()%></textarea></td>
	</tr>
</table>
<div style= "white-space: nowrap;" >
<button style="width:100pt; height:25pt; margin-left:1180px; margin-top:10px; "  id="save">등록</button>
<button style="width:100pt; height:25pt; margin-top:10px; " type="reset">초기화</button>
</div>

</form>
</body>
</html>