<%@page import="step3_00_boardEx.BoardDTO"%>
<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bUpdate</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="../ckeditor/ckeditor.js"></script>
</head>
<body>

	<%
		int num = Integer.parseInt(request.getParameter("num"));	
		BoardDTO boardDTO = BoardDAO.getInstance().getBoardDetail(num , false);
	%>
	
	<div align="center" style="padding-top: 100px">
		<form action="bUpdatePro.jsp" method="post">
			<div class="bs-docs-section">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-header" align="center">
							<h2>게시글 수정</h2>
						</div>
						<div class="bs-component">
							<table class="table table-hover" style="width: 700px;">
								<tr class="table-default">
									<td>작성자</td>
									<td><%=boardDTO.getWriter()%></td>
								</tr>
								<tr class="table-default">
									<td>작성일</td>
									<td><%=boardDTO.getEnrollDt()%></td>
								</tr>
								<tr class="table-default">
									<td>제목</td>
									<td><input type="text" class="form-control" name="subject" value="<%=boardDTO.getSubject()%>" /></td>
								</tr>
								<tr class="table-default">
									<td>패스워드</td>
									<td><input type="password" class="form-control" name="password" /></td>
								</tr>
								<tr class="table-default">
									<td>글내용</td>
									<td>
										<textarea rows="10" cols="60" name="content"><%=boardDTO.getContent()%></textarea>
										<script>CKEDITOR.replace("content");</script>
									</td>
								</tr>
								<tr class="table-default" align="center">
									<td colspan="4">
										<input type="hidden" name="num" value="<%=boardDTO.getNum()%>" /> 
										<input type="submit" class="btn btn-primary btn-sm" value="수정" />
										<input type="button" class="btn btn-primary btn-sm" onclick="location.href='bList.jsp'" value="전체글보기" />
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