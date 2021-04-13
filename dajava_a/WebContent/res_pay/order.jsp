<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#box{
		position: absolute;
        text-align: center;
        width: 100%;
        height: 100%;
        top: 0;
       	left: 0;
        font-size: 50px;
       	margin-top:20%;
    }
    #text{    
		display: inline-block;
        vertical-align: middle;
	}
	#button{
		width:200px;
		height:50px;
	}
</style>
</head>
<body>
<div id="box">
<div id="text">예약이 성공적으로 완료 되었습니다.</div>
<div ><input type="button" onclick="location.href='<%=request.getContextPath()%>/path/index.do'" value="메인 페이지로 이동" id="button"></div>
</div>
</body>
</html>