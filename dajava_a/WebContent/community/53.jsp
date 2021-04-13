<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
int Midx = (int)session.getAttribute("midx");
String Mi = Integer.toString(Midx);

 String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
 
 
 
%>

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
          if (document.frm.RePassword.value ==""){		  
     		 confirm("비밀번호를 입력해주세요");
     		  document.frm.RePassword.focus();
     		  }
          else if (document.frm.Ridx.value == "리뷰하실 방을 선택해주세요"){		  
      		 confirm("상품 종류를 선택해주세요");
      		  document.frm.Ridx.focus();
      		
      		  }
          else{
       	  
         
          $('#frm').attr('action','<%=request.getContextPath()%>/community/writeAction2.do').submit(); 
          // 아이디 값을 얻어오고 attr()즉 속성을 쓰겠다 선언 그리고 그 안에 속성명과 , 주소를 입력하고 submit 한다 가 위의 내용임 
     		  }
      });    
});

 
 
</script>
<script type="text/javascript">


function Check(){
	 if (document.frm.RePassword.value ==""){		  
		 alert("비밀번호를 입력해주세요");
		  document.frm.RePassword.focus();
		  return;
	  }else if (document.frm.Ridx.value ==""){
		  alert("리뷰하실 방을 선택해주세요");
		  document.frm.Ridx.focus();
		  return;
	  
	  }

}





</script>
<style>
.content{
 
    outline-offset:-10px;  
    text-align: center;
    transition: all .15s ease-in-out;
    width: 300px;
    height: 300px;
   
}

.content img, .content video{
    width:100%;
    height:100%;
    display:none;
}

</style>
















<link href="<%=request.getContextPath()%>/community/style5.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

</head>
<body>
<div>
<h1>ReView 등록</h1>
<form name="frm"  id="frm"   method="post"> 
<input type="hidden" name="Midx" value="<%=Mi%>">
<b class="c1">제목</b>	&nbsp;&nbsp; 	&nbsp;&nbsp; 
<table>
	<tr>
		<th class="c3"><input type="text" style="width:940px; height:50px;" class="c2" name="Retitle" id="title"></th>
	</tr>
</table>
<b class="c1">본문</b>	&nbsp;&nbsp; 	&nbsp;&nbsp; 
<table>
	<tr>
		<td><textarea rows="25" cols="131" name="Recontents" id="ir1" ></textarea></td>
		
	</tr>	
</table>
<div style= "white-space: nowrap;"	>
<b class="c0" >상품 종류</b>	&nbsp;&nbsp; 	&nbsp;&nbsp;<b class="c0" style="positon:;">게시글 비밀번호</b> <input type="password" style="width:170px; height:30px;  "  name="RePassword"  id="P1">
<br>
<select class="form-select form-select-sm c01" aria-label=".form-select-sm example" name="Ridx">
  <option selected>리뷰하실 방을 선택해주세요</option>
  <option value="1">방1</option>
  <option value="2">방2</option>
  <option value="3">방3</option>
  <option value="4">방4</option>
  <option value="5">방5</option>
  <option value="6">방6</option>
  <option value="7">방7</option>
  <option value="8">방8</option>
  <option value="9">방9</option>
</select>
<button style="width:100pt; height:25pt; margin-left:480px; margin-top:10px; " id="save" type="button">등록</button>
<button style="width:100pt; height:25pt; margin-left:0px; margin-top:10px; ">초기화</button>
</div>	
</form>

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
    $('.content')
    .on("dragover", dragOver)
    .on("dragleave", dragOver)
    .on("drop", uploadFiles);

  function dragOver(e){
    e.stopPropagation();
    e.preventDefault();
    if (e.type == "dragover") {
      $(e.target).css({
        "background-color": "black",
        "outline-offset": "-20px"
      });
    } else {
        $(e.target).css({
        "background-color": "gray",
        "outline-offset": "-10px"
      });
      }
  }

  function uploadFiles(e) {
      e.stopPropagation();
      e.preventDefault();
      dragOver(e);
    
      e.dataTransfer = e.originalEvent.dataTransfer;
      var files = e.target.files || e.dataTransfer.files;
      if (files.length > 1) {
          alert('하나만 올려라.');
          return;
      }
      if (files[0].type.match(/image.*/)) {
                  $(e.target).css({
              "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
              "outline": "none",
              "background-size": "100% 100%"
          });
      }else{
        alert('이미지가 아닙니다.');
        return;
      }
  }
 
  
  
  
  
    </script>
<script>





</script>


</body>
</html>