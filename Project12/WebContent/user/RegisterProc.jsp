<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="dto.UserDto"/>
<jsp:useBean id="dao" class="dao.UserDao"/>
<jsp:setProperty property="*" name="dto"/>

<%
	String addr = request.getParameter("addr1")+","+request.getParameter("addr1")+","+request.getParameter("addr3");
	dto.setAddr(addr);	
int result = dao.InsertRegister(dto);
	
	if(result > 0){
%>
		<script>
			alert('회원가입 되셨습니다.');
			location.href = "../index.jsp";
		</script>
<%
	}
%>