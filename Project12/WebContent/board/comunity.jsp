<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
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
<script>
	<%-- 글읽기를 누르면 form태그를 통해 전송해줌--%>

	function seeboard(num){
		$("#no").val(num);
		$("#to_seeboardForm").submit();
	}

</script>

<%-- 검색기능을 구현 및 게시글을 뿌려줌 --%>
<%
	//검색기능을 위한 변수선언
	String key ="";
	String word ="";
	BoardDao dao = new BoardDao();
	//전체 글들을 출력하는걸로 맞춤
	ArrayList<BoardDto> list = dao.allSelectBoard();
	
	//검색어를 입력하면 그값으로 게시판글들을 조회
	if(request.getParameter("word")!=null){
	key = request.getParameter("key");
	word = request.getParameter("word");
	list = dao.allSelectBoard(key, word);
	}
%>

<%-- 페이징 기법을 구현 --%>
<% 
		int totalRecord = list.size();//게시판에 저장된 전체 글의 갯수 [2]
		int numPerPage = 5; //한페이지당 보여질 글의 갯수 
		int pagePerBlock = 3;//한블럭당 묶여질 페이지수 
		int totalPage = 0; //전체페이지수  
		int totalBlock = 0; //전체 블럭수 
		int nowPage = 0; //현재 보여지는 페이지 번호를 저장 [7]		
		int nowBlock = 0; //현재 보여지는 페이지번호가 속하는? 블럭위치[8]
		int beginPerPage = 0; //각페이지의 시작글번호를 저장하는 변수 [10]
				
		totalPage = (int)Math.ceil((double)totalRecord / numPerPage);
		totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
		
		if(request.getParameter("nowPage") != null){	//페이지를 눌렀을때 
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		if(request.getParameter("nowBlock") != null){	// >>을 눌렀을때 
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
		}
		beginPerPage = nowPage * numPerPage;
%>
</head>
<body>
	<jsp:include page="../header.jsp"/>

	<form id="to_seeboardForm" action="seeBoard.jsp" method="post">
	<input type="hidden" name="no" id="no">
	<input type="hidden" name="key" value="<%=key %>">
	<input type="hidden" name="word" value="<%=word %>">
	</form>

	
<div class="container">
	<table class="table table-striped">
		<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		</thead>
		<%-- 게시물이 없을때 보여질 화면 --%>
		<tbody>
		
		
		<% for(int i=beginPerPage; i<(beginPerPage+numPerPage); i++) {
			
			if(i == totalRecord){	//마지막글을 뽑으면 필요없는 반복문을 중지.
				break;
			}
			BoardDto dto = list.get(i);
			int count = dao.commentCount(dto.getNo());
			//해당글에 대한 댓글에 갯수를 가져온다.
			
			//답변글일경우 앞에 공백을 줘서 구분한다.
			String depth = "";
			if(dto.getDepth()>0)
			depth = dao.useDepth(dto.getDepth());
		%>
			<tr>

				<td><%=depth%><%=dto.getNo()%></td>
				<%
				//파일이 있으면 파일이미지를 넣어줌
				if(!("파일이없습니다".equals(dto.getFilename()))){
			%>	
				<td class="glyphicon glyphicon-file"><a class="btn" onclick="seeboard(<%=dto.getNo()%>);"><%=dto.getSubject()%></a>
				[<%=count %>]
				</td>
			<% 
				}else{
			%>		
				<td><a class="btn" onclick="seeboard(<%=dto.getNo()%>);"><%=dto.getSubject()%></a>
				<%-- 해당글의 대한 댓글이 달린갯수를 적어줌 --%>
				[<%=count %>]
				</td>
			<% 	
				}
			%>	
				
				
				
				<td><%=dto.getId() %></td>
				<td><%=dto.getRegdate() %></td>
				<td><%=dto.getCount() %></td>
			</tr>
	
	<%-- 글을 읽을때 같이보내줄 값들 (글번호,기준값,검색어) --%>		

			
		
		
		<% }
		%>
		</tbody>
		
		
	</table>
	<div class="text-center">
	<a id="insertboardForm" class="btn btn-default pull-right" href="insertBoardForm.jsp">글쓰기</a>
	
	<form class="form-group" action="comunity.jsp">
	<div class="col-offset-sm-5"></div>	
	 	<select class="col-sm-2 center" name="key">
	 		<option value="id" selected>작성자</option>
	 		<option value="content">내용</option>
	 		<option value="subject">제목</option>
	 	</select>
	 
	 	<input type="text" name="word">
	 	<input type="submit" value="검색">
	 	</form>
	 </div>
	 	
	
	
	<%-- 페이지네이션! 페이징기법 넣기 --%>
		<div class="text-center">
		<ul class="pagination">
		<%
		if(totalBlock > 0){ //게시판에 글이 하나라도 존재 한다면?
			if(nowBlock > 0){
	%>
				<li class="page-item">
				<a href="comunity.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1)*pagePerBlock%>">
				Privious
				</a>
				</li>
				 
	<%
			}
	%>
	<% 
	for(int i=0; i<pagePerBlock; i++){ 
	    	
		    //현재 보여질 페이지 번호가  == 전체페이지수와 같으면 더 반복할 필요없으니 나간다.
		    if((nowBlock * pagePerBlock) + i == totalPage ){
		    	break;
		    }
	 %>  	
		<li class="page-item"><a class="page-link" href="comunity.jsp?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock)+i%>">
	   		<%=(nowBlock*pagePerBlock)  + 1 + i%>
	 	</a>
	 	<% 
			if( ((nowBlock * pagePerBlock) + 1 + i) == totalRecord ){
				break; //반복문 끝내라 
			}
	    }
	%>
	<%if(totalBlock > nowBlock + 1){ %>
		<li class="page-item"><a class="page-link" href="comunity.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>">
		next
		</a>
	<%} }%>
		<br>
		</li>
		</ul>
		</div>
	 	
	 	
	
	
	
</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>