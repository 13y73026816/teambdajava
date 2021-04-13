<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "service.*" %>  
<% QAVo qv =(QAVo)request.getAttribute("qv"); 
	
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
    if (document.frm.Ridx.value == "질문하실 사항을 선택해주세요"){		  
		 confirm("상품 종류를 선택해주세요");
		  document.frm.Ridx.focus();
		
		  }
    
    else if(document.frm.Ridx.value != "질문하실 사항을 선택해주세요"){
 	  
   
    $('#frm').attr('action','<%=request.getContextPath()%>/community/changeAction1.do').submit(); 
    // 아이디 값을 얻어오고 attr()즉 속성을 쓰겠다 선언 그리고 그 안에 속성명과 , 주소를 입력하고 submit 한다 가 위의 내용임 
		  }








});    
}); 
 
 
</script>

<link href="<%=request.getContextPath()%>/community/style5.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
</head>
<body>
<h2 style="margin-left:900px; font-size:60px; white-space: nowrap;">수정</h2>
<form name="frm" id="frm"  method="post">
<input type="hidden" name="Qidx" value="<%=qv.getQIDX() %>">
<b class="c1">제목</b>	&nbsp;&nbsp; 	&nbsp;&nbsp; 
<table >
	<tr>
		<th class="c3"><input type="text" style="width:940px; height:50px;" class="c2" name="Qtitle" value="<%=qv.getQTITLE() %>" id="title"></th>
	</tr>
</table>
<b class="c1">본문</b>	&nbsp;&nbsp; 	&nbsp;&nbsp; 
<table>
	<tr>
		<td><textarea rows="25" cols="131" name="Qcontents" id="ir1"><%=qv.getQCONTENTS()%></textarea></td>
	</tr>
</table>
<div style="white-space:nowrap;">
<b class="c0">문의 사항</b>	&nbsp;&nbsp; 	&nbsp;&nbsp; 
<br>
<select class="form-select form-select-sm c01" aria-label=".form-select-sm example" name="Ridx">
  <option selected>질문하실 사항을 선택해주세요</option>
  <option value="1">방1</option>
  <option value="2">방2</option>
  <option value="3">방3</option>
  <option value="4">방4</option>
  <option value="5">방5</option>
  <option value="6">방6</option>
  <option value="7">방7</option>
  <option value="8">방8</option>
  <option value="9">방9</option>
  <option value="100">기타사항</option>
</select>

<button style="width:100pt; height:25pt; margin-left:470px; margin-top:10px; " id="save">수정완료</button>
<button style="width:100pt; height:25pt; margin-left:0px; margin-top:10px;">뒤로가기</button>
</div>

</form>
</body>
</html>