<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<%-- 답글달기 관련  --%>
	<% 
	String id =(String)session.getAttribute("id");
	if(id==null){
	%>
	<script>
		alert('로그인 하지 않으면 답변을 달 수 없습니다.');
		location.href="../user/loginForm.jsp";
	</script>
	
	<% 
	}
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.bringBoardInfo(no); // 게시판에대한 정보를들고옴! 
	%>
	<div class="container">
		<legend>답변달기</legend>											
	<form action="ReplyProc.jsp" name="form" id="form2" onsubmit="ckInsertBoard();" enctype="multipart/form-data" method="post">
	<%-- 비밀정보들은 히든으로줌 --%>
	<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
	<input type="hidden" name="no" value="<%=no %>">	

	<div class="form-group">
		<label for="제목">제목</label>
		<input type="text" id="subject" name="subject" class="form-control"  maxlength="20">
	</div>		
	<div class="form-group">
		<label for="제목">작성자</label>
		<input type="text" name="id" class="form-control" value="<%=id%>" readonly>
	</div>
	<div class="form-group">
		<label for="파일">파일</label>
		<input type="file" id="file"name="file" class="form-control" >
	</div>
	<textarea name="content" id="content" rows="15" cols="100"> 게시글을 입력하세요 </textarea>
	<%-- 네이버 스마트 에디터 사용  --%>
	<script>
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({

	    oAppRef: oEditors,

	    elPlaceHolder: "content",

	    sSkinURI: "smarteditor/SmartEditor2Skin.html",

	    fCreator: "createSEditor2"

	});
	</script>
	<input type="submit" id="submit" class="btn btn-default pull-right" value="답변달기">
	</form>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>