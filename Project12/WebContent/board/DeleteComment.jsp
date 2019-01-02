<%@page import="dto.CommentDto"%>
<%@page import="dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%-- 댓글 삭제관련--%>
    <%
    	int comment_no=Integer.parseInt(request.getParameter("comment_no"));
    	boolean ckDeleteComment = false;
    	CommentDao dao = new CommentDao();
    	// 댓글입력한 id와 삭제할 id를 비교하기위해...
    	CommentDto dto = dao.bringCommentInfo(comment_no);
    	String id = "";
    	if(session.getAttribute("id")!=null)
    		id=(String)session.getAttribute("id");
    	
    	if(!(dto.getId().equals(id))){
    %>
    		<script>
    			alert("댓글삭제는 본인만 가능합니다.");
    			histoy.back();
    		</script>
    <% 
    	}else{
    		dao.DeleteComment(comment_no);
    %>		
    <script>
    	alert('삭제되었습니다.');
    	history.back();
 	</script>
    <% 		
    	}
    %>

