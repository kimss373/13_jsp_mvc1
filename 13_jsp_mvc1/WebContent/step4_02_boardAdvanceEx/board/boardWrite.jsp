<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWrite</title>
<script src="../../ckeditor/ckeditor.js"></script>
<link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"> 
<script>

	function checkFormValidation() {
		
		var writer = document.f.writer;
		if (writer.value == ""){
			alert("작성자를 입력하세요.");
			writer.focus();
			return false;
		}
		
		var subject = document.f.subject;
		if (subject.value == ""){
			alert("제목을 입력하세요.");
			subject.focus();
			return false;
		}
		
		var passwd = document.f.passwd;
		if (passwd.value == ""){
			alert("비밀번호를 입력하세요.");
			passwd.focus();
			return false;
		}
		
		var content = document.f.content;
		if (content.value == ""){
			alert("내용을 입력하세요.");
			content.focus();
			return false;
		}
		
		return true;
		
	}
	
</script> 
</head>
<body>

	<div align="center" style="padding-top: 100px">
		<form action="boardWritePro.jsp" name="f" method="post" onsubmit="return checkFormValidation()">
			<div class="bs-docs-section">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-header" align="center">
							<h2>게시글 쓰기</h2>
							<br>
						</div>
						<div class="bs-component">
							<table class="table table-hover" style="width: 700px;">
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>
								<tr class="table-default">
									<td align="center"><span style="color: red">*</span> 작성자</td>
									<td><input type="text" class="form-control" name="writer" /></td>
								</tr>
								<tr class="table-default">
									<td align="center"><span style="color: red">*</span> 제목</td>
									<td><input type="text" class="form-control" name="subject" /></td>
								</tr>
								<tr class="table-default">
									<td align="center"><span style="color: red">*</span> 비밀번호</td>
									<td><input type="password" class="form-control" name="passwd" /></td>
								</tr>
								<tr class="table-default">
									<td align="center"><span style="color: red">*</span> 글내용</td>
									<td>
										<textarea class="form-control" rows="10" cols="50" name="content"></textarea>
										<script>CKEDITOR.replace("content");</script>
									</td>
								</tr>
								<tr align="center">
									<td colspan="2">
										<input type="submit" class="btn btn-primary btn-sm" value="작성하기" />
										<input type="button" class="btn btn-primary btn-sm" onclick="location.href='boardList.jsp'" value="전체게시글보기">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>