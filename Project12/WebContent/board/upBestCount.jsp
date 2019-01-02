<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 추천수 증가--%>

<%
	int no =Integer.parseInt(request.getParameter("no"));
	System.out.println(no);
	BoardDao dao = new BoardDao();
	dao.UpbestCount(no);
%>
<script>
alert('추천되었습니다.');
history.back();
</script>