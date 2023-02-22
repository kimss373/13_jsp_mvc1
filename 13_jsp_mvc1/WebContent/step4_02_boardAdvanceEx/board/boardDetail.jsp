<%@page import="step4_00_boardAdvanceEx.ReplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDetail</title>
<link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
</head>
<body>

	<%
		long boardId = Long.parseLong(request.getParameter("boardId"));
		MainBoardDTO mainBoardDTO = BoardAdvanceDAO.getInstance().getBoardDetail(boardId , true);
	%>
	
	<div align="center" style="padding-top: 100px">
		<div class="bs-docs-section">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header" align="center">
						<h2>게시글 상세</h2>
						<br>
					</div>
					<div class="bs-component">
						<table class="table table-hover" style="width: 700px; text-align: center">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tr class="table-default">
								<td>제목</td>
								<td><%=mainBoardDTO.getSubject()%></td>
							</tr>
							<tr class="table-default">
								<td>조회수</td>
								<td><%=mainBoardDTO.getReadCnt()%></td>
							</tr>
							<tr class="table-default">
								<td>작성자</td>
								<td><%=mainBoardDTO.getWriter()%></td>
							</tr>
							<tr class="table-default">
								<td>작성일</td>
								<td><%=mainBoardDTO.getEnrollDt()%></td>
							</tr>
							<tr class="table-default">
								<td>글 내용</td>
								<td><%=mainBoardDTO.getContent()%></td>
							</tr>
							<tr class="table-default">
								<td colspan="2">
									<input class="btn btn-primary btn-sm" type="button" value="수정"  onclick="location.href='boardUpdate.jsp?boardId=<%=mainBoardDTO.getBoardId()%>'">
									<input class="btn btn-primary btn-sm" type="button" value="삭제"  onclick="location.href='boardDelete.jsp?boardId=<%=mainBoardDTO.getBoardId()%>'">
									<input class="btn btn-primary btn-sm" type="button" value="목록보기"  onclick="location.href='boardList.jsp'">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	<hr>
	<br>
		
	<div align="center" style="padding-top: 100px">
		<div class="bs-docs-section">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header" align="center">
						<h2>댓글 리스트</h2>
						<br>
					</div>
					<table class="table table-hover" style="width: 700px; text-align: center">
						<% 
							ArrayList<ReplyDTO> replyList = BoardAdvanceDAO.getInstance().getReplyList(boardId);
							for (ReplyDTO replyDTO : replyList) {
						%>
							<tr>
								<td>
									작성자 : <%=replyDTO.getWriter() %> / 작성일 : <%=replyDTO.getEnrollDt() %> <br>
									<%=replyDTO.getContent() %>
									<input type="button" class="btn btn-primary btn-sm" value="수정" onclick="location.href='../reply/replyUpdate.jsp?replyId=<%=replyDTO.getReplyId()%>'">
									<input type="button" class="btn btn-primary btn-sm" value="삭제" onclick="location.href='../reply/replyDelete.jsp?replyId=<%=replyDTO.getReplyId()%>'">
								</td>
							</tr>			
						<% 		
							}
						%>
						<tr>
							<td align="right">
								<input type="button" class="btn btn-primary btn-sm" value="댓글작성"  onclick="location.href='../reply/replyWrite.jsp?boardId=<%=mainBoardDTO.getBoardId()%>'">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>