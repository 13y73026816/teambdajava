<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>회원로그인</title>
		<script src="<%=request.getContextPath()%>/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
		
		function check(){
			if(document.frm.id.value == ""){
				alert("아이디를 입력해주세요");
				document.frm.id.focus();
				return;
			}else if(document.frm.password.value == ""){
				alert("패스워드를 입력해주세요");
				document.frm.password.focus();
				return;
			}
			
			alert("로그인합니다!!");
			
			document.frm.action ="<%=request.getContextPath()%>/mypage/memberloginAction.do";
			document.frm.method ="post";
			document.frm.submit();
			return;
		}
		</script>
		<style>
			* {margin: 0;padding: 0;}
	
			.login{
				display:flex;
				height:100vh;
				justify-content:center;
				align-items:center;
			}
			
			h1{
				font-size:2.3rem;
			}
					
			.tr{
				border-bottom:hidden;
				border-left:hidden;
				border-right:hidden;
			}
			
			.tr1{
				border-top:hidden;
				border-left:hidden;
				border-right:hidden;
				border-left-width:100px;
			}
			
			table{
				height:28rem;
				width:30rem;
				border-collapse:collapse;
			}
		
			input:not(#cb1){
				width:28rem;
				height:5rem;
				clear:none;
				border:0px none;
				float:none;
				background-color:#fff;
				font-size:1.8rem;
				margin:auto;
				padding-left:2rem;
			}
		
			#cb1{
				width: 1.7rem;
				height: 1.7rem;
				border: 2px solid;
				cursor: pointer;
			}
			
			
			@media screen and (max-width:1000px){
				html{font-size:80%;}
			}
			
			#cb1:checked{
				background-color: #666666;
			}
			
		</style>
	</head>
	<body>
		<div class="login">
			
			<form name="frm">
			<table border="1px" style="solid" >
			<tr class="tr1">
				<td colspan="2" align="center"><h1>회원 로그인</h1></td>
			</tr>
			<tr class="tr1">
				<td colspan="2" height="50px"></td>
			</tr>
			<tr>
				
				<td colspan="2"><input type="text" name="id" placeholder="아이디" ></td>
				
			</tr>
			
			<tr>
				<td colspan="2"><input type="password" name="password" placeholder="비밀번호"></td>
			</tr> 
			<tr>
				<td style="background-color:red" colspan="2"><input type="button" style="background-color:red; color:white;" value="로그인" onclick="check();"></td>
			</tr>
			<tr class="tr">
				<td  width="40%"><input type="checkbox" name="saveId" id="cb1" value="chk">&nbsp;&nbsp;아이디 저장</td>
				<td align="right"><a>아이디 찾기</a> | <a>비밀번호 찾기</a> | <a>회원가입</a></td>
			</tr>
			</table>
			</form>
		</div>
	</body>
</html>