<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>
	#login_wrapper {
		position: absolute;
		top:25%;
		left:47%;
		margin-left:-150px;
	}
</style>
<script>
	
	function formValidationCheck() {
	
		var id = document.getElementById("id");
		if (id.value == "") {
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		}
		
		var passwd = document.getElementById("passwd");
		if (passwd.value == "") {
			alert("패스워드를 입력하세요.");
			passwd.focus();
			return false;
		}
	}

</script>
</head>
<body>
	<div id="login_wrapper">
		<h3 align="center">회원 탈퇴</h3>
		<br>
		<form method="post" action="04_deletePro.jsp" onsubmit="return formValidationCheck()">
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" class="form-control" size="40" autofocus>
			</div>
			<div class="form-group">
				<label for="passwd">패스워드</label>
				<input type="password" name="passwd" id="passwd" class="form-control" >
			</div>
			<div class="form-group" align="right">
				<input type="submit" value="탈퇴" class="btn btn-primary">
			</div>
		</form>	
	</div>
</body>
</html>