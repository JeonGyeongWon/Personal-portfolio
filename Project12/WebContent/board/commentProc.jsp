<%@page import="org.json.simple.JSONObject"%>
<%@page import="dao.CommentDao"%>
<%@page import="dto.CommentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

	<jsp:useBean id="dto" class="dto.CommentDto"/>
	<jsp:useBean id="dao" class="dao.CommentDao"/>
	
	
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String id = request.getParameter("id");
	String content = request.getParameter("c_content");
	dto.setBoard_no(no);
	dto.setContent(content);
	dto.setId(id);
	int c_no = dao.InsertComment(dto); 
	
	// 최근댓글을 가져와서 ajax로 리턴해준다
	
	CommentDto cdto= dao.bringCommentInfo(c_no);
	
	JSONObject obj = new JSONObject();
	
	obj.put("id", cdto.getId());
	obj.put("comment", cdto.getContent());
	obj.put("regdate", ""+cdto.getRegdate());
	obj.put("c_no",cdto.getComment_no());
	
	response.getWriter().write(obj.toJSONString());
%>
