<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>replyWrite</title>
<link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script>

	function checkFormValidation() {
	
		var writer = document.f.writer;
		if (writer.value == ""){
			alert("작성자를 입력하세요.");
			writer.focus();
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

	<%
		long boardId = Long.parseLong(request.getParameter("boardId"));
	%>
	
	<div align="center" style="padding-top: 100px">
		<form action="replyWritePro.jsp" name="f" method="post" onsubmit="return checkFormValidation()">
			<div class="bs-docs-section">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-header" align="center">
							<h2>댓글 작성</h2>
							<br>
						</div>
						<div class="bs-component">
							<table  class="table table-hover" style="width: 700px;">
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>
								<tr class="table-default">
									<td align="center"><span style="color: red">*</span> 작성자</td>
									<td><input type="text" name="writer" /></td>
								</tr>
								<tr class="table-default">
									<td align="center"><span style="color: red">*</span> 비밀번호</td>
									<td><input type="password"  name="passwd" /></td>
								</tr>
								<tr class="table-default">
									<td align="center"><span style="color: red">*</span> 글내용</td>
									<td>
										<textarea rows="10" cols="50" name="content" placeholder="200자 이내로 작성하세요."></textarea>
									</td>
								</tr>
								<tr align="center">
									<td colspan="2">
										<input type="hidden" name="boardId" value="<%=boardId %>">
										<input type="submit" class="btn btn-primary btn-sm" value="댓글쓰기">
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