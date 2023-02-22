<%@page import="java.util.ArrayList"%>
<%@page import="step3_00_boardEx.BoardDTO"%>
<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bList</title>
</head>
<body>
	
	<h2>게시글 리스트</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
			ArrayList<BoardDTO> boardDtos = BoardDAO.getInstance().getBoardList();
		
			for (int i = 0 ; i < boardDtos.size() ; i++) {
				BoardDTO temp = boardDtos.get(i);
		%>
				<tr>
					<td><%=i+1 %></td>
					<td><a href="bDetail.jsp?num=<%= temp.getNum()%>"><%=temp.getSubject() %></a></td>
					<td><%=temp.getWriter() %></td>
					<td><%=temp.getEnrollDt() %></td>
					<td><%=temp.getReadCnt() %></td>
				</tr>
		<%
				
			}
				
			
		%>
		<tr>
			<td colspan="5">
				<input type="button" value="글쓰기" onclick="location.href='bWrite.jsp'">
			</td>
		</tr>
	</table>
	
</body>
</html>