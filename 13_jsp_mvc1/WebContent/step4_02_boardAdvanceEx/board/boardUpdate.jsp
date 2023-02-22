<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdate</title>
<script src="../../ckeditor/ckeditor.js"></script>
<link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
		long boardId = Long.parseLong(request.getParameter("boardId"));	
		MainBoardDTO mainBoardDTO = BoardAdvanceDAO.getInstance().getBoardDetail(boardId , false);
	%>
	
	<div align="center" style="padding-top: 100px">
		<form action="boardUpdatePro.jsp" method="post">
			<div class="bs-docs-section">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-header" align="center">
							<h2>게시글 수정</h2>
							<br>
						</div>
						<div class="bs-component">
							<table class="table table-hover" style="width: 700px;">
								<tr class="table-default">
									<td>작성자</td>
									<td><%=mainBoardDTO.getWriter()%></td>
								</tr>
								<tr  class="table-default">
									<td>작성일</td>
									<td><%=mainBoardDTO.getEnrollDt()%></td>
								</tr>
								<tr class="table-default">
									<td>제목</td>
									<td><input type="text" class="form-control" name="subject" value="<%=mainBoardDTO.getSubject()%>" /></td>
								</tr>
								<tr class="table-default">
									<td>패스워드</td>
									<td><input type="password" class="form-control" name="passwd" /></td>
								</tr>
								<tr class="table-default">
									<td>글내용</td>
									<td>
										<textarea rows="10" cols="60" name="content"><%=mainBoardDTO.getContent()%></textarea>
										<script>CKEDITOR.replace("content")</script>
									</td>
								</tr>
								<tr class="table-default" align="center">
									<td colspan="4">
										<input type="hidden" name="boardId" value="<%=mainBoardDTO.getBoardId()%>" /> 
										<input type="submit" class="btn btn-primary btn-sm" value="수정" />
										<input type="button" class="btn btn-primary btn-sm" onclick="location.href='boardList.jsp'" value="전체글보기" />
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