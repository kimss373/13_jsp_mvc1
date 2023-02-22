<%@page import="step3_00_boardEx.BoardDTO"%>
<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bDetail</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO boardDTO = BoardDAO.getInstance().getBoardDetail(num , true);
	%>
	
	<div align="center" style="padding-top: 100px">
		<div class="bs-docs-section">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header" align="center">
						<h2>게시글 상세</h2>
					</div>
					<div class="bs-component">
						<table class="table table-hover"style="width: 700px; text-align: center">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tr class="table-default">
								<td>조회수</td>
								<td><%=boardDTO.getReadCnt()%></td>
							</tr>
							<tr class="table-default">
								<td>작성자</td>
								<td><%=boardDTO.getWriter()%></td>
							</tr>
							<tr class="table-default">
								<td>작성일</td>
								<td><%=boardDTO.getEnrollDt()%></td>
							</tr>
							<tr class="table-default">
								<td>이메일</td>
								<td><%=boardDTO.getEmail()%></td>
							</tr>
							<tr class="table-default">
								<td>제목</td>
								<td><%=boardDTO.getSubject()%></td>
							</tr>
							<tr class="table-default">
								<td>글 내용</td>
								<td><%=boardDTO.getContent()%></td>
							</tr>
							<tr class="table-default">
								<td colspan="2">
									<input type="button" class="btn btn-primary btn-sm" value="수정하기" onclick="location.href='bUpdate.jsp?num=<%=boardDTO.getNum()%>'">
									<input type="button" class="btn btn-primary btn-sm" value="삭제하기" onclick="location.href='bDelete.jsp?num=<%=boardDTO.getNum()%>'">
									<input type="button" class="btn btn-primary btn-sm" value="목록보기" onclick="location.href='bList.jsp'">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>