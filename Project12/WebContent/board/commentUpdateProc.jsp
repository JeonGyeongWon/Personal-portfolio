<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script	src="https://code.jquery.com/jquery-3.3.1.js">

    </script>

    <%
    	request.setCharacterEncoding("utf-8");
    %>
    
    <jsp:useBean id="dao" class="dao.CommentDao"/>
    <jsp:useBean id="dto" class="dto.CommentDto"/>
    <jsp:setProperty property="*" name="dto"/>
    <%
    	dao.updateComment(dto);
    %>
    <script>
    	alert('수정되었습니다.');
    </script>