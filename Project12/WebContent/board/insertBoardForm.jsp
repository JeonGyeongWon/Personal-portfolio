<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.UserDto"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
 <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	
	<%-- 아이디 입력이 안되면 글쓰기를 할수 없음--%>
	<%
		if(session.getAttribute("id")==null){
	%>
		<script>
			alert("로그인 하지않으면 글쓰기를 할수 없습니다.");
			location.href="../user/loginForm.jsp"
		</script>
	<%
		}
	%>

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
	
</head>
<body>
<%
	UserDao dao = new UserDao();
	String id=(String)session.getAttribute("id");
	UserDto dto = dao.BringUserInfo(id);  
%>
	<jsp:include page="../header.jsp"/>
	
<div class="container">
			<%-- 파일업로드를 위해 enctype="multipart/form-data"를 추가해줌 --%>
			<%-- multipart파일은 post방식만 지원한다. --%>
		<legend>글쓰기</legend>											
	<form action="insertBoardProc.jsp" name="form" id="form2" enctype="multipart/form-data" method="post"> 	<%-- 비밀정보들은 히든으로줌 --%>
	<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>" width="30">
	<div class="form-group">
		<label for="제목">제목</label>
		<input type="text" id="subject" name="subject" class="form-control"  maxlength="20">
	</div>
	<div class="form-group">
		<label for="제목">작성자</label>
		<input type="text" name="id" class="form-control" value="<%=dto.getId()%>" readonly>
	</div>
	<div class="form-group">
		<label for="파일">파일</label>
		<input type="file" id="file"name="file" class="form-control" >
	</div>
	<textarea name="content" id="content" rows="10" cols="100"> 게시글을 입력하세요 </textarea>
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
	<input type="button" id="insertboardForm" class="btn btn-default pull-right" value="글쓰기" 
	onclick="ckInsertBoard();">
	</form>
</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>