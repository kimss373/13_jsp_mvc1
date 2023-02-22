<%@page import="step4_00_boardAdvanceEx.ReplyDTO"%>
<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>replyUpdate</title>
<script src="../../ckeditor/ckeditor.js"></script>
<link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script>

	function checkFormValidation() {
	
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
		long replyId = Long.parseLong(request.getParameter("replyId"));	
		ReplyDTO replyDTO = BoardAdvanceDAO.getInstance().getReplyDetail(replyId);
	%>
	
	<div align="center" style="padding-top: 100px">
		<form action="replyUpdatePro.jsp" method="post" name="f" onsubmit="return checkFormValidation()">
			<div class="bs-docs-section">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-header" align="center">
							<h2>댓글 수정</h2>
							<br>
						</div>
						<div class="bs-component">
							<table class="table table-hover" style="width: 700px;">
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>
								<tr>
									<td>작성자</td>
									<td><%=replyDTO.getWriter()%></td>
								</tr>
								<tr>
									<td>작성일</td>
									<td><%=replyDTO.getEnrollDt()%></td>
								</tr>
								<tr>
									<td align="center"><span style="color: red">*</span> 패스워드</td>
									<td><input type="password" name="passwd" size="70"/></td>
								</tr>
								<tr>
									<td align="center"><span style="color: red">*</span> 댓글</td>
									<td>
										<textarea rows="10" cols="60" name="content"><%=replyDTO.getContent()%></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<input type="hidden" name="boardId" value="<%=replyDTO.getBoardId() %>" /> 
										<input type="hidden" name="replyId" value="<%=replyDTO.getReplyId() %>" /> 
										<input type="submit" class="btn btn-primary btn-sm" value="댓글수정" />
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