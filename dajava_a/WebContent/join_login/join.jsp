<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="../jquery-3.5.1.min.js"></script>  
<script type="text/javascript">

	function check_input_onblur(){
		var theForm=document.frm;
		if(isNaN(theForm.input1.value)){
			$('.tel1').val("");
			$('.tel1').focus();
			alert("휴대폰 번호 양식이 아닙니다.");
			theForminput.select();
		}else if(isNaN(theForm.input2.value)){
			$('.tel2').val("");
			$('.tel2').focus();
			alert("휴대폰 번호 양식이 아닙니다.");
			theForminput.select();
		}
		return false;
	}
	
		
	$(document).ready(function(){	
		$('#mail_domain').on("change",function(){
			$("#mail_domain option:selected").each(function(){
				if($(this).val()=="b"){
					$("#domaintextbox").attr("disabled",false);	
					$("#domaintextbox").val("");
					$("#domaintextbox").focus();
				}else{
					$("#domaintextbox").val($(this).text());
					$("#domaintextbox").attr("disabled",true);					
				}
			});
		});
		
	});
	
	function check(){
		if(document.frm.name.value == ""){
			alert("이름을 입력해주세요");
			document.frm.name.focus();
			return;
		}else if(document.frm.id.value == ""){
			alert("아이디를 입력해주세요");
			document.frm.id.focus();
			return;
		}else if(document.frm.password.value == ""){
			alert("비밀번호를 입력해주세요");
			document.frm.password.focus();
			return;
		}else if(document.frm.password2.value == ""){
			alert("비밀번호를 다시 입력해주세요");
			document.frm.password.focus();
			return;
		}else if(document.frm.password.value != document.frm.password2.value){
			alert("비밀번호가 일치하지 않습니다.");
			document.frm.password2.focus();
			return;
		}else if(document.frm.email1.value == ""){
			alert("이메일을 입력해주세요");
			document.frm.email1.focus();
			return;
		}
		
		var phone= $("select[name=sel]").val()+$("input[name=input1]").val()+$("input[name=input2]").val();
		$("input[name=phone]").val(phone);
		
		var email= $("input[name=email1]").val()+"@"+$("input[name=email2]").val();
		$("input[name=email]").val(email);
		
		alert("가입합니다!!");
		document.frm.action ="<%=request.getContextPath()%>/mypage/memberjoinAction.do";  
		document.frm.method ="post";
		document.frm.submit();
		return;
		
	}
</script>
<style>
	* {margin: 0;padding: 0;}
	
	.join{
		display:flex;
		height:100vh;
		justify-content:center;
		flex-direction:column;
		}
	
	table{
		margin:auto;
	}
	
	h2{
		margin-bottom:20px;
	}
		
	input:not(.tel, .email>input){
		width:500px;
		height:35px;
		padding-left:20px;
		background-color:#e8eae6;
		}
		
	.tel,.sel,.email>input{
		width:147px;
		height:35px;
		padding-left:20px;
		background-color:#e8eae6;
		}
		
	select:not(.sel){
		width:120px;
		height:35px;
		padding-left:20px;
		background-color:#e8eae6;
		}
	
	button{
		width:150px;
		height:30px;
		text-align:center;
		border:2px solid;
		background-color:#e8eae6;
		
	}	
	
	.button{
		text-align:center;
	}
	
	#domaintextbox{
		width:300px;
	}
	
</style>
</head>
<body>

<div class="join">
<h2><center>회원 가입</center></h2>
<form name="frm">
	<table height="450px"> 
		<tr>
			<td>
				<input type="text" name="name" placeholder="이름">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="id" placeholder="아이디">
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="password" placeholder="비밀번호">
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="password2" placeholder="비밀번호 재입력">
			</td>
		</tr>
		<tr>
			<td><div class="phone">
				<select class="sel" name="sel">
				<option value="010" selected>010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				</select> -
				<input type="text" name="input1" class="tel tel1" size="4" maxlength="4" onblur=check_input_onblur()> - <input type="text" name="input2" class="tel tel2" size="4" maxlength="4" onblur=check_input_onblur()>
				</div>
				<input type="hidden" name="phone">
			</td>
		</tr>
		<tr>
			<td class="email">
				<input type="text" width="400px" name="email1" placeholder="이메일"> @			
				<input type="text" name="email2" value="naver.com" id="domaintextbox">
				<select name="sel" id="mail_domain">
					<option value="n" selected>naver.com</option>
					<option value="g">gmail.com</option>
					<option value="h">hamail.net</option>
					<option value="b">직접입력</option>
				</select>
				<input type="hidden" name="email">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="addr" placeholder="주소">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="birthday" placeholder="생년월일">
			</td>
		</tr>
		<tr>
			<td class="button"><br/><br/>
				<button onclick="check();">가입하기</button>
			</td>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>