<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	int no = Integer.parseInt(request.getParameter("no"));
    	UserDao dao = new UserDao();
    	dao.deleteUser(no);
    	response.sendRedirect("../index.jsp");
    %>