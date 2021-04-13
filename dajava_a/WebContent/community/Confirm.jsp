<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="service.*" %>      
<% QAVo qv =(QAVo)request.getAttribute("qv");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호를 입력해주세요</h1>
<input type="password" name="">
<button style="width:100pt; height:25pt" id="i1" onclick="location.href='<%=request.getContextPath()%>/community/54-2.Qo?qidx=<%=qv.getQIDX()%>'">수정</button>
<input type="hidden" value="<%=qv.getMIDX()%>" name="M2" class="M2">
<div class="c0">
<div class="c1">
<%=qv.getQTITLE() %>
</div>
<div class="c2">
<span><%=qv.getNAME()%></span>  &nbsp;&nbsp;  <span><%=qv.getQDATE()%></span> &nbsp;&nbsp;
</div>
<div class="c3">
<div class="c01">
주소:www.fdsfdsf.com<span></span>
</div>
<%=qv.getQCONTENTS() %>
</div>
<div class="c4">
기타 정보 <div></div>
</div>
<div class="c5">
댓글란 
<div></div><!--댓글 작성자 -->

<div></div> <!-- 댓글 내용 -->
</div>
</div>
</body>
</html>