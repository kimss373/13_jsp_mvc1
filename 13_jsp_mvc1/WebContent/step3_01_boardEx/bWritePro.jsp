<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bwritePro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");		
	%>
	
	<jsp:useBean id="boardDTO" class="step3_00_boardEx.BoardDTO">
		<jsp:setProperty property="*" name="boardDTO"/>
	</jsp:useBean>
	
	<%
		BoardDAO.getInstance().insertBoard(boardDTO);
	%>
	
	<script>
		alert("등록 되었습니다.");
		location.href="bList.jsp";
	</script>
	
</body>
</html>