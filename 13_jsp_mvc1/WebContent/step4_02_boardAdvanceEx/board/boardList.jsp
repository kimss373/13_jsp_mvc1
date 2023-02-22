<%@page import="java.util.ArrayList"%>
<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>
	ul {
	    list-style:none;
	    margin:0;
	    padding:0;
	}
	
	li {
	    margin: 0 0 0 0;
	    padding: 0 0 0 0;
	    border : 0;
	    float: left;
	}
</style>
<script>

	function getBoardList() {
		
		var onePageViewCnt   = document.getElementById("onePageViewCnt").value; 
		var searchKeyword    = document.getElementById("searchKeyword").value;
		var searchWord       = document.getElementById("searchWord").value;
		
		var url = "boardList.jsp?searchKeyword=" + searchKeyword;
		   url += "&searchWord=" + searchWord 
		   url += "&onePageViewCnt=" + onePageViewCnt;
		
		location.href = url;
	
	}
	
</script>
</head>
<body>

	<p align="right">
		<input type="button" class="btn btn-outline-primary" value="테스트 데이터 생성" onclick="location.href='setDummy.jsp'">
	</p>

	<%
		request.setCharacterEncoding("utf-8");	
		
		String searchKeyword = request.getParameter("searchKeyword");
		if (searchKeyword == null) {
			searchKeyword = "total";
		}
		
		String searchWord = request.getParameter("searchWord");
		if (searchWord == null) {
			searchWord = "";
		}
		
		String tempCnt = request.getParameter("onePageViewCnt");		
		if (tempCnt == null) {
			tempCnt = "10";	
		}	
		
		int onePageViewCnt = Integer.parseInt(tempCnt);
		
		String tempPageNum  = request.getParameter("currentPageNumber");
		if (tempPageNum == null){
			tempPageNum = "1";
		}
		
		int currentPageNumber = Integer.parseInt(tempPageNum); 
		int totalBoardCnt = BoardAdvanceDAO.getInstance().getAllBoardCnt(searchKeyword,searchWord);
		int startBoardIdx = (currentPageNumber -1) * onePageViewCnt;
		ArrayList<MainBoardDTO> boardAdvanceList = BoardAdvanceDAO.getInstance().getBoardList(searchKeyword, searchWord, startBoardIdx, onePageViewCnt);
	
	%>
	<div align="center" style="padding-top: 100px">
		<div class="bs-docs-section">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header" align="center">
						<h2>게시글 리스트</h2>
						<br>
					</div>
					<table class="table table-hover">
						<colgroup>
							<col width="10%">
							<col width="40%">
							<col width="20%">
							<col width="20%">
							<col width="10%">
						</colgroup>
						<tr>
							<td> 
								조회 : <span style="color:red"><%=totalBoardCnt%></span>개
							</td>
							<td colspan="4" align="right" >
								<select id="onePageViewCnt" class="form-control" onchange="getBoardList()" style="width: 100px; display: inline;">
									<option <%if (onePageViewCnt == 5) {%> selected <%}%>>5</option>
									<option <%if (onePageViewCnt == 7) {%> selected <%}%>>7</option>
									<option <%if (onePageViewCnt == 10) {%> selected <%}%>>10</option>
								</select>
							</td>
						</tr>
						<tr class="table-primary" align="center">
								<td>번호</td>
								<td>제목</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>조회수</td>
						</tr>
				<%
						for (MainBoardDTO mainBoardDTO : boardAdvanceList) {
				%>						
							<tr class="table-default" align="center">
								<td><%=++startBoardIdx %></td>
								<td align="left">
									<a href="boardDetail.jsp?boardId=<%=mainBoardDTO.getBoardId()%>"><%= mainBoardDTO.getSubject() %></a>
								</td>
								<td> <%= mainBoardDTO.getWriter() %> </td>
								<td> <%= mainBoardDTO.getEnrollDt() %> </td>
								<td> <%= mainBoardDTO.getReadCnt() %> </td>
							</tr>
				<% 
							}
				%>				
						<tr class="table-default" align="right">
							<td colspan="5">
								<input type="button" class="btn btn-primary btn-sm" style="float: right" value="글쓰기" onclick="location.href='boardWrite.jsp'">
							</td>
						</tr>
						<tr >
							<td colspan="5" align="center">			
								<select id="searchKeyword"  class="form-control" style="width: 150px; display: inline;">
									<option <%if (searchKeyword.equals("total")) {%>selected<% }%> value="total">전체검색</option>
									<option <%if (searchKeyword.equals("writer")) {%> selected <% }%> value="writer">작성자</option>
									<option <%if (searchKeyword.equals("subject")) {%> selected <% }%> value="subject">제목</option>
								</select>
								<input type="text" class="form-control" style="width: 300px; display: inline;" id="searchWord" name="searchWord" value=<%=searchWord %>> 
								<input type="button" class="btn btn-outline-primary" value="검색" onclick="getBoardList()">
							</td>
						</tr>
					</table>
					<div style="display: table; margin-left: auto; margin-right: auto">
				<% 
					if (totalBoardCnt > 0) {
						
						// 전체페이지 개수 = 전체게시판 수 / 한페이지에서 보여지는 글수
						int addPage = totalBoardCnt % onePageViewCnt == 0 ? 0 : 1; // 나머지가 0이면 추가 x , 나머지가 0이 아니면 +1페이지
						int totalPageCnt = totalBoardCnt / onePageViewCnt + addPage;
						
						
						// 시작페이지
						int startPage = 1;
						
						if (currentPageNumber % 10 == 0) {  
							startPage = (currentPageNumber / 10 - 1) * 10 + 1;
								/*
									currentPage 10 : 1  
									currentPage 20 : 11  
									currentPage 30 : 21 
								*/
						} 
						else {
							startPage = (currentPageNumber / 10) * 10 + 1;							
							/*
								currentPage 1  : 1  
								currentPage 11 : 11  
								currentPage 21 : 21 
							*/
						}
					
						
						//끝페이지
						int endPage = startPage + 9;
							
						// 끝페이지가 전체 페이지 개수보다 크다면 
						if (endPage > totalPageCnt) {
							endPage = totalPageCnt;
						}
						
						// 게시물이 한페이지에 보여지는 것보다 작다면
						if (onePageViewCnt > totalBoardCnt) {
							startPage = 1;
							endPage = 0;
						}
				%>
						<ul class="pagination">
				<% 
					if (startPage > 10) {
				%>
							<li class="page-item">
								<a class="page-link" href="boardList.jsp?currentPageNumber=<%= startPage - 10 %>&onePageViewCnt=<%=onePageViewCnt%>&searchKeyword=<%=searchKeyword%>&searchWord=<%=searchWord%>" >이전 </a>
							</li> 
				<% 				
						}	
				
						for (int i=startPage; i<=endPage; i++) {
				%>	
							<li class="page-item">
								<a class="page-link" href="boardList.jsp?currentPageNumber=<%= i %>&onePageViewCnt=<%=onePageViewCnt%>&searchKeyword=<%=searchKeyword%>&searchWord=<%=searchWord%>"><%=i%> &nbsp;</a>
							</li>
				<% 				
						}
								
						if (endPage <= totalBoardCnt && endPage >= 10){
				%>
							<li class="page-item">
								<a class="page-link" href="boardList.jsp?currentPageNumber=<%= startPage + 10 %>&onePageViewCnt=<%=onePageViewCnt%>&searchKeyword=<%=searchKeyword%>&searchWord=<%=searchWord%>"> 다음 </a>
							</li> 
				<% 		
						}
					}	
				%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>