<%@page import="java.util.ArrayList"%>
<%@page import="step3_00_boardEx.BoardDTO"%>
<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bList</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div align="center" style="padding-top: 100px">
		<div class="bs-docs-section">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header" align="center">
						<h2>게시글 리스트</h2>
					</div>
					<div class="bs-component">
						<table class="table table-hover">
							<colgroup>
								<col width="10%">
								<col width="40%">
								<col width="20%">
								<col width="20%">
								<col width="10%">
							</colgroup>
							<tr class="table-primary"  align="center">
								<td>번호</td>
								<td>제목</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>조회수</td>
							</tr>
			<%
									int idx = 1;
									ArrayList<BoardDTO> boardList = BoardDAO.getInstance().getBoardList(); 
									for (BoardDTO boardDTO : boardList){
			%>
							<tr class="table-default" align="center">
								<td><%=idx %></td>
								<td><a href="bDetail.jsp?num=<%= boardDTO.getNum() %>"><%= boardDTO.getSubject() %></a></td>
								<td><%= boardDTO.getWriter() %></td>
								<td><%= boardDTO.getEnrollDt() %></td>
								<td><%= boardDTO.getReadCnt() %></td>
							</tr>
			<%
							idx++;
				}
			%>
							<tr class="table-default" align="right">
								<td colspan="5">
									<input type="button" class="btn btn-primary btn-sm" style="float: right" value="글쓰기" onclick="location.href='bWrite.jsp'">
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