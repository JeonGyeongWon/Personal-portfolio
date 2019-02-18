<%@page import="java.util.ArrayList"%>
<%@page import="dao.CommentDao"%>
<%@page import="dto.CommentDto"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		
		<%-- 다시 목록으로 돌아가는 함수 --%>
		function fnList(){
			location.href="comunity.jsp";
		}
		<%-- 댓글남길시 로그인 안했으면 로그인으로 보내는 함수--%>
		function goLogin(){
			location.href="../user/loginForm.jsp";
		}
		
		<%-- 댓글 수정시 새창을 띄워줌  --%>
		function fnUpdate(comment_no){
			window.open("commentUpdateForm.jsp?comment_no="+comment_no,
					"updateComment","width=570","height=350","resizable=no",scrollbars="no");
		}
		
		function fndownload(){
			$("#downloadform").submit();	
		}

		
		
	
	</script>
	
	<%
	String key ="";
	String word ="";
	int no = Integer.parseInt(request.getParameter("no")); //게시물번호
	BoardDao dao= new BoardDao();
	BoardDto dto = dao.bringBoardInfo(no);
	key = request.getParameter("key");
	word = request.getParameter("word");

	// 조회수를 1증가시켜줌
	dao.Upcount(no);
	%>
	
	<script>
	<%-- 추천하기를 눌렀을때 이동되는페이지 지정 --%>
	$(function(){
		$("#upBestCount").on("click",function(){
			<%-- 이후 아이디당 1번씩만추천할수 있도록 변경--%>
				location.href="upBestCount.jsp?no="+<%=no%>;
			});
		
	})
	
	function comment(no,id){
		var c_content = $("#c_content").val();
		$.ajax({
			type : "post",
			url : "commentProc.jsp",
			data : {
				"no" : no, "id" : id, "c_content" : c_content
			},
			dataType : "json",
			success : function(comment){
				alert("댓글을 달았습니다.");
				$("#commentList").append("<div class='col-md-12'>");
				$("#commentList").append("<div class='col-md-2'>");
				$("#commentList").append("작성자 : "+comment.id+"<br><a onclick='fnupdate('"+comment.c_no+")'>수정</a>&nbsp;&nbsp;|&nbsp;&nbsp;");
				$("#commentList").append("<a href='DeleteComment.jsp?comment_no='"+comment.c_no+">삭제</a></div>");
				$("#commentList").append("<textarea rows='3' cols='5' class='col-md-8' name='content' readonly='readonly'>");
				$("#commentList").append(comment.comment+"</textarea>");
				$("#commentList").append("<span>작성날짜 : <br>"+comment.regdate+"</span>");
				$("#commentList").append("</div>");
				$("#commentList").append("<br><br>");
			},
			error : function(ee){
				alert("에러");
			}
		});
	}
	
	
	</script>
</head>
<body>
<%-- 게시판 한글에 자세한 종류를 본다 --%>

<form action="download.jsp" method="post" id="downloadform">
	<input type="hidden" name="path" value="<%=dto.getFile() %>">
</form>




<jsp:include page="../header.jsp"/>

	<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m>글읽기</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	 <td align=center bgcolor=#dddddd width=10%> 작성자 </td>
	 <td bgcolor=#ffffe8><%=dto.getId() %></td>
	 <td align=center bgcolor=#dddddd width=10%> 등록날짜 </td>
	 <td bgcolor=#ffffe8><%=dto.getRegdate()%></td>
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd> 제 목</td>
     <td bgcolor=#ffffe8 colspan=3><%=dto.getSubject() %></td>
   </tr>
   <tr> 
     <td align=center bgcolor=#dddddd width=10%>	추천수</td>
     <td bgcolor=#ffffe8 colspan=1><%=dto.getBestCount() %></td>
     <td align=center bgcolor=#dddddd width=10% >	파일</td>
     <td bgcolor=#ffffe8 colspan=1>
     <%
     	if(dto.getFilename().equals("파일이없습니다")){
     %>
     	<%=dto.getFilename() %>
     <% 		
     	}else{
     		System.out.print(dto.getFile());
     %>
     
     <a onclick="fndownload();">
     <%=dto.getFilename()%>
     </a>     
     <% 		
     	}
     %>
     </td>
   </tr>
   <tr> 
    <td colspan=4><%=dto.getContent() %>
    <button id="upBestCount" class="btn btn-default pull-right">추천하기</button>
    </td>
   </tr>
   <tr>
    <td colspan=4 align=right>
     <%=dto.getIp() %>로 부터 글을 남기셨습니다./  조회수 : <%=dto.getCount() %> 
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
 
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="List.jsp" onclick="fnList(); return false;">목 록</a> | 
	<a href="UpdateBoard.jsp?no=<%=no%>">수 정</a> |
	<%-- 답변링크 추가 : Replay.jsp로 이동할때.. 주글에 대한 num, 검색어, 검색기준값 전달--%>
	<a href="Replay.jsp?no=<%=no%>">답 변</a> |
	<a href="Delete.jsp?no=<%=no%>">삭 제</a> |<br>
	
	
	
	
  </td>
 </tr>
</table>

<br><br><br>
<%-- 댓글들을 뿌려주는곳 --%>

<legend class="text-center">댓글목록</legend>
<div class="container" id="commentList">
<%
	CommentDao c_dao = new CommentDao();
	ArrayList<CommentDto> c_list =  c_dao.allSelectComment(no);
	for(int i=0; i<c_list.size(); i++){
		CommentDto c_dto = c_list.get(i);
	
%>


	<div class="col-md-12">
	<div class="col-md-2">작성자 : <%=c_dto.getId() %><br><a onclick="fnUpdate(<%=c_dto.getComment_no()%>);">수정</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	<a href="DeleteComment.jsp?comment_no=<%=c_dto.getComment_no()%>">삭제</a></div>	
	<textarea rows="3" cols="5" class="col-md-8" name=content readonly="readonly">
	<%=c_dto.getContent() %> </textarea>
		<span>작성날짜 : <br><%=c_dto.getRegdate()%></span>
	</div>
	
	<br><br>
	<% }%>
	</div>
<%-- 댓글입력 폼 --%>
<% String id = "";
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}
%>
<legend class="text-center">댓글작성</legend>
<div class="container">
	<div class="col-md-12">
	<%if(!id.equals("")){ %>
	<div class="col-md-2">작성자 : <%=session.getAttribute("id") %></div>	
	<textarea rows="5" cols="20" class="col-md-8" name=content id="c_content"></textarea>
	<button onclick="comment(<%=no %>,'<%=id%>');">댓글남기기</button>
	<% }else{
		%>
		<input type="hidden" name=no value="<%=no %>"> <%-- 게시글번호전달 --%>
		<div class="col-md-2"></div>	
		<textarea rows="5" cols="20" class="col-md-8" name=content readonly="readonly">로그인을 해주세요</textarea>
		<input type="submit" class="col-md-2" value="로그인하러가기" height="30px" onclick="goLogin();" >
		<% 
	}%>
	</div>
	</div>
	<br>
	<br>
	<br>


<form action="List.jsp" name="list" method="post">
	<input type="hidden" name="key" value="<%=key%>">
	<input type="hidden" name="word" value="<%=word%>">
</form>



<jsp:include page="../footer.jsp"/>

</body>
</html>