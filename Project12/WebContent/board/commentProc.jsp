<%@page import="dao.CommentDao"%>
<%@page import="dto.CommentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

	<jsp:useBean id="dto" class="dto.CommentDto"/>
	<jsp:useBean id="dao" class="dao.CommentDao"/>
	<jsp:setProperty property="*" name="dto"/>
	
	
<%
	dao.InsertComment(dto); 
%>
<script>
	alert('댓글을 달았습니다.');
	history.back();
</script>