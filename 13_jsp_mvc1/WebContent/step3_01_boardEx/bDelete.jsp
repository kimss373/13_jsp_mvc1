<%@page import="step3_00_boardEx.BoardDTO"%>
<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bDelete</title>
</head>
<body>
	
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO boardDTO = BoardDAO.getInstance().getBoardDetail(num, false);
		
	%>

	<h2>게시글 삭제하기</h2>
	<form action="bDeletePro.jsp" method="post">
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><%=boardDTO.getWriter()%></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=boardDTO.getEnrollDt() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=boardDTO.getSubject() %></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="hidden" name="num" value="<%=boardDTO.getNum() %>">
					<input type="submit" value="삭제">
					<input type="button" onclick="location.href='bList.jsp'" value="목록보기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>