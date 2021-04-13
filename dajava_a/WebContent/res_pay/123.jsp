<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
    <input type="button" value="새창열기"  onclick="nwindow()"/>
    <script>
        function nwindow(){
            var url="pay.jsp";
            window.open(url,"","width=700,height=700,left=600,toolbar=no, menubar=no, location=no, scrollbar=yes, fullscreen=no,channelmode=no,resizable=no,status=no,left=620, top=140 ");
        }
    </script>
    
    


</body>
</html>