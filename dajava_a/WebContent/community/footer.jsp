<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>footer</title>
		<style>
			* {margin: 0;padding: 0;}

			html{
				
				font-family:sans-serif;
			}
			
			.footer {
			  margin-top: 0;
			  display: flex;
			  flex-direction: column;
			     

  				margin-bottom:0;

    			width:100%;

   					 height:70px;   

    				background:#ccc;
    				position:absolute;

			}
			
			.copy{
				margin:auto;
				width:100%;
				height:7.2rem;
				text-align:center;
				background-color:#487e95;
				color:#fff;
				font-weight:600;
				font-size:0.9rem;
				line-height:1.6;
				
				
			}
						
			.copy2{
				padding-top:10px;
				width:100%;
				height:2.5rem;
				text-align:center;
				background-color:#0a043c;
				color:#fff;
				font-weight:600;
				font-size:1rem;
			}
			
			.copy2 a{
				color:#fff;
			}
			
			.copy h1{
				font-size:2rem;
				line-height:2;
				display:inline;
				margin:0;
			}
			
		</style>
	</head>
	<body>
		<footer>
		<div class="footer">
			<div class="copy">
				<h1>TEL. 063-222-2222</h1><br>
				다자바돌체 | 전주시 덕진구 금암동 | 대표. 홍길동<br>
				ACC. 농협 111-1111-111-1111 (예금주 : 홍길동) | 사업자번호. 333-33-33333 
			</div>
			<div class="copy2">
				<a href="#">ADMIN</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="a()" >개인정보취급방침 및 저작권</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">홈페이지제작 포유</a>
			</div>
		</div>
		</footer>
		<script>
		function a(){
		window.open("<%=request.getContextPath()%>/community/etc.jsp","PopupNew", "width=550, height=600, top=265, left=690");
		}
		
		</script>

		
		
	</body>
</html>








		


