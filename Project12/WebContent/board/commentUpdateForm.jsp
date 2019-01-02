
<%@page import="dto.CommentDto"%>
<%@page import="dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<script>
<%-- 업데이트시 유효성검사--%>
 function CkUpdate(){
 	if($("#content").val.length==0){
 		alert('빈문자는 입력하실수 없습니다.');
 		return false;
 	}else{
 		$("#updateFormComment").submit();
 	}
 }
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
		// 댓글 고유의 번호를 가져온후 번호를 이용해 해당댓글에 정보들을 들고온다.
    	int comment_no=Integer.parseInt(request.getParameter("comment_no"));
    	boolean ckDeleteComment = false;
    	CommentDao dao = new CommentDao();
    	// 댓글입력한 id와 삭제할 id를 비교하기위해
    	CommentDto dto = dao.bringCommentInfo(comment_no);
    	String id = "";
    	if(session.getAttribute("id")!=null)
    		id=(String)session.getAttribute("id");
    	
    	if(!(dto.getId().equals(id))){
   %> 	
   		<script>
    			alert("댓글수정은 본인만 가능합니다.");
    			histoy.back();
    	</script>	
    <% 		
    	}else {
    		
    	
   	%>
   	<form id="updateFormComment" action="commentUpdateProc.jsp">
   	<input type="hidden" name="comment_no" value="<%=dto.getComment_no()%>">
   	<input type="hidden" name="id" value="<%=dto.getId() %>">
   	<input type="hidden" name="board_no" value="<%=dto.getBoard_no() %>">
   		<textarea name="content" rows="10" cols="100">
   			<%=dto.getContent() %>
   		</textarea>
   		<input type="button" onclick="CkUpdate()" value="댓글수정">
   	</form>	
   	<% 
    	}
  %>
</html>