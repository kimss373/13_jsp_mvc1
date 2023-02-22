<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% 
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select 쿼리문의 결과를 저장할 객체
		
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC", "root", "1234");
			
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER");
			
			rs = pstmt.executeQuery();
			
			/*
			
			# db의 컬럼명을 가져 오는 2가지 방법
			
				1) rs.get자료형메서드("컬럼명");
				  
					ex) 
						rs.getString("PRODUCT_CD"); 
						rs.getInt("PRODUCT_PRICE");
						rs.getDate("REG_DATE");
				
						
				2) rs.get자료형메서드(index);
					
					ex) 
						rs.getString(1);
						rs.getInt(2);
						rs.getDate(3);
				
					- 유지보수 및 가독성 향상을 위해서 컬럼명지정 방식을 권장한다.
					- index가 1부터 시작되는 점을 유의해야 한다.
			
			*/
			%>
				<h2>회원 리스트</h2>
				<table border = "1">
				<tr>
					<th>ID</th>
					<th>PASSWD</th>
					<th>NAME</th>
					<th>JOIN DATE</th>
				</tr>
			<%  
			
			while (rs.next()) { // rs.next() : 1row를 가져온다.
				
				String id = rs.getString("ID");			// rs.getString(1);
				String passwd = rs.getString("PASSWD");		// rs.getString(2);
				String name = rs.getString("NAME");		// rs.getString(3);
				Date joinDate = rs.getDate("JOIN_DATE");	// rs.getDate(4);
				
				// System.out.println(id + " / " + passwd + " / " + name + " / " + joinDate);
				%>
					<tr>
						<td><%=id %></td>
						<td><%=passwd %></td>
						<td><%=name %></td>
						<td><%=joinDate %></td>
					</tr>
				
				
				<%
			}
			%>
				</table>
			<%
			
		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			if (rs != null) try{rs.close();} catch(Exception e) {e.printStackTrace();}
			if (pstmt != null) try{pstmt.close();} catch(Exception e) {e.printStackTrace();}
			if (conn != null) try{conn.close();} catch(Exception e) {e.printStackTrace();}
			
		}
		
	%>


</body>
</html>