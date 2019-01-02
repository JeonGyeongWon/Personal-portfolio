<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	String id = (String)session.getAttribute("id");
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.bringBoardInfo(no);
	if(id.equals(dto.getId())){
%>
	<script>
		alert('삭제완료');
		location.href="comunity.jsp";
	</script>
<% 
	dao.deleteBoard(no);
	dao.deleteBoardComment(no);
	}else{
%>
	<script>
		alert('본인만 삭제가 가능합니다');
		history.back();
	</script>
<%		
	}
%>
<%

%>