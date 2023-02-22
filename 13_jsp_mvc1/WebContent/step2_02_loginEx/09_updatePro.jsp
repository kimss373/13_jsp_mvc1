<%@page import="step2_00_loginEx.MemberDto"%>
<%@page import="step2_00_loginEx.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
		request.setCharacterEncoding("utf-8");
			
		MemberDto memberDTO = new MemberDto();
		memberDTO.setId(request.getParameter("id"));
		memberDTO.setPasswd(request.getParameter("passwd"));
		memberDTO.setName(request.getParameter("name"));
			
		boolean isUpdate = MemberDao.getInstance().updateMember(memberDTO);
		
		if (isUpdate) {
	%>
			<script>
				alert("Information has changed");
				location.href = "00_main.jsp";
			</script>
	<% 		
		}
		else {
	%>	
			<script>
				alert("Check your Id and Password");
				history.go(-1);
			</script>
	<% 		
		}
	%>

</body>
</html>




