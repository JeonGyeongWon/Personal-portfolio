<%@page import="dao.BoardDao"%>
<%@page import="dto.BoardDto"%>
<%@page import="dto.UserDto"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	//글쓰기 유효성 검사를 하는 부분
	function ckInsertBoard(){
		<%-- 스마트에디터에 유효성검사는 해당 스크립트에 연결된 id값을 이용해서 해야한다. 
		http://neptune297.tistory.com/51 참조--
		집에가서 파일 연구하기--%>
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
        var ir1 = $("#content").val();
		var subject = $("#subject").val();
		var content = $("#content").val();
		var file = $("#file").val();
		
		if(subject.length==0 || subject==null){
			alert('제목을 입력하세요');
			$("#subject").focus();
		}else if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
            alert("내용을 입력하세요.");
            oEditors.getById["content"].exec("FOCUS"); //포커싱
        }else{
     	   $("#form2").submit();
        }
		
		
	}
	</script>

<%-- 작성자랑 글수정하는 인물이 동일인물인지확인 -> 글정보작성자와 로그인되어잇는(세션)비교 --%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.bringBoardInfo(no);
	String id = (String)session.getAttribute("id");
%>
<script>
	$(function(){
		<%-- ''때문에 문자열로 인식을 안해서 30분해맸다..--%>
		var userid	= '<%=id%>'
		var boardid = '<%=dto.getId()%>'
		if(userid!=boardid){
			alert("수정은 작성자만 할수있습니다.");
			history.back();
		}
	})
</script>
</head>
<body>


<div class="container">
			 
	<jsp:include page="../header.jsp"/>
	<form action="UpdateBoardProc.jsp" name="form" id="form2" enctype="multipart/form-data" method="post">
	<legend>글 수정하기</legend>
	<%-- 비밀정보들은 히든으로줌 --%>
	<input type="hidden" name="regdate">
	<input type="hidden" name="no" value="<%=no%>"> 
	

	<div class="form-group">
		<label for="제목">제목</label>
		<input type="text" id="subject" name="subject" class="form-control" maxlength="20" value="<%=dto.getSubject()%>">
	</div>
	<div class="form-group">
		<label for="제목">작성자</label>
		<input type="text" name="id" class="form-control" value="<%=dto.getId()%>" readonly>
	</div>
	<div class="form-group">
		<label for="파일">파일</label>
		<input type="file" id="file"name="file" class="form-control" >
	</div>
	<textarea name="content" id="content" rows="10" cols="100"><%=dto.getContent() %>  </textarea>
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
	<input type="submit" id="submit" class="btn btn-default pull-right" value="글수정하기">
	</form>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>