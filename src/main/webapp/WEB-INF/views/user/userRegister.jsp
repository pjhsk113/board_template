<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/assets/css/bootstrap.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>회원가입</h1>
	<table border="1" class="table">
		<thead>
			<th colspan=2 style="text-align:center;"><h3>회원가입</h3></th>
		</thead>
		<tbody>
			<tr>
				<td>ID</td>
				<td><input type="text"><input type="button" value="중복확인" id = "checkId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="userPw" class="password" minlength="6" maxlength="15"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" id="userPwCheck" class="password" minlength="6"  maxlength="15"><div id="pwAlert"><div></td>
			</tr>
		</tbody>
	</table>
	<a href="/board/List.do"><button type="button">List</button></a>
	<input type="button" id="signUp" value="회원가입">
	</div>
<script type="text/javascript">
$j(document).ready(function(){
	$j(".password").on("input",function(e){
		e.preventDefault();
		var pw=$j("#userPw").val();
		var pwCheck=$j("#userPwCheck").val();
		
		if(!pw || pw==""){
			$j("#pwAlert").html("<div id='pwAlert'><div>");
		 	$j("#userPwCheck").attr('pwCheck','0');
			return false;
		}else if(pw.length>=6){
			if(pwCheck ==""){
				$j("#pwAlert").html("<div id='pwAlert'><div>");
			 	$j("#userPwCheck").attr('pwCheck','0');
			 	return false;
			}else if(pw!=pwCheck) {
				$j("#userPwCheck").blur(function(){
			 		$j("#userPwCheck").val('');
			 	 });
			 	$j("#pwAlert").html("<div id='pwAlert' style='float:left; font-size:15px; color:#FF0000'>비밀번호가 다릅니다.<div>");
			 	$j("#userPwCheck").attr('pwCheck','0');
				return false;
		 	}else if(pw==pwCheck) {
		 		$j("#userPwCheck").blur(function(){
			 		$j("#userPwCheck").val(pw);
			 	 });
				$j("#pwAlert").html("<div id='pwAlert'><div>");
			 	$j("#userPwCheck").attr('pwCheck','1');
			 	return true;
		 	}
		}
	 });
});

</script>
</body>
</html>