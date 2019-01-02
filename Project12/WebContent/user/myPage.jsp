<%@page import="dto.BasketDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.BoardDto"%>
<%@page import="dto.UserDto"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	//로그인되어있지않으면 로그인 페이지로 이동시킴
	if(session.getAttribute("id")==null){
	%>
	<script>
		alert("로그인을 하지않으면 이용하실수 없는 페이지입니다.");
		location.href="loginForm.jsp";
	</script>
<%
	}
%>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$("#loginFormDiv").css("margin","0 auto");
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
form{
text-align: center;
}

</style>
</head>

<%-- user개인의 회원번호를 들고와서 개인정보,쓴글목록,내가판매한 글목록 등을 보여준다. --%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	UserDao dao = new UserDao();
	UserDto dto = dao.BringUserInfo(no);
	
	
	
	// 각 탭에 맞는 기능을 위해 category에 값을 가져옴
	int category = 1;
	if(request.getParameter("category")!=null)
	category = Integer.parseInt(request.getParameter("category"));
	// 내가 쓴 글 목록을 뿌려줌 
	
		BoardDao b_dao = new BoardDao();
		ArrayList<BoardDto> b_list = b_dao.AllbringBoardInfo(dto.getId());
					
		// 페이징 기법을 구현 //
		 
				int totalRecord = b_list.size();//게시판에 저장된 전체 글의 갯수 [2]
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
		
				ArrayList<BasketDto> buyer_list = dao.bringUserProductInfo(dto.getId()); //구매목록을 가져오기위한...
%>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="brands_products">
		<div class="brands-name col-sm-1">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="myPage.jsp?no=<%=no%>&category=1"> <span class="pull-right"></span>개인정보수정</a></li>
				<li><a href="myPage.jsp?no=<%=no%>&category=2"> <span class="pull-right"></span>내가 쓴 글 목록[<%=b_list.size() %>]</a></li>
				<li><a href="myPage.jsp?no=<%=no%>&category=3"> <span class="pull-right"></span>구매목록[<%=buyer_list.size() %>]</a></li>
			</ul>
		</div>
	</div>
	
<%-- 개인정보를 수정을 위한 변경폼 --%>
<%if(category==1) {%>
	<div class="container">
	<form id="RegisterForm" action ="UpdateInfoProc.jsp" method="post">

<legend>개인정보수정</legend>				
	<%-- 개인정보구별을 위해 no값을 히든으로 넘겨줌 --%>
	<input type="hidden" name="no"value="<%=no %>">

  <div class="form-group col-md-offset-2 col-sm-6 center">
		<label for="아이디">아이디</label>
    <input id="id" name="id" type="text" value="<%=dto.getId()%>"equired autofocus maxlength="8" class="form-control">
  </div>
  <div class="form-group col-md-offset-2 col-sm-6">
		<label for="비밀번호">비밀번호</label>
    <input id="pass" name="pass" type="password" value="<%=dto.getPass()%>" required maxlength="10" class="form-control">
  </div>
 <div class="form-group col-md-offset-2 col-sm-6">
		<label for="이름">이름</label>
    <input id="name" name="name" type="text" value="<%=dto.getName()%>" placeholder="5자미만 공백없이" required class="form-control">
  </div>
  <div class="form-group col-md-offset-2 col-sm-6">
		<label for="파일"><a href="#">이메일</a></label>
    <input id="email" name="email" type="email" value="<%=dto.getEmail() %>" readonly class="form-control">
    </div>
  <div class="form-group col-md-offset-2 col-sm-6">
		<label for="파일">휴대폰번호</label>
    <input id="phoneNumber" name="phoneNumber" type="tel" value="<%=dto.getPhoneNumber()%>" autocomplete="off" readonly class="form-control">
 </div>
 <div class="form-group col-md-offset-2 col-sm-2">
   <input type="submit" value="개인정보변경" class="form-control"> 
 </div>  

</form>
</div>

<%}else if(category==2) {
%>	
	</head>
	<body>



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
			<%-- 이부분을 게시물 뿌려주는걸로하면됨 --%>
			<tbody>
			<% for(int i=beginPerPage; i<(beginPerPage+numPerPage); i++) {
				
				if(i == totalRecord){	//마지막글을 뽑으면 필요없는 반복문을 중지.
					break;
				}
				BoardDto b_dto = b_list.get(i);
			%>
				
				<tr>
					<td><a href="../board/seeBoard.jsp?no=<%=dto.getNo()%>"><%=dto.getNo()%></a></td>
					<td><%=b_dto.getSubject()%></td>
					<td><%=b_dto.getId() %></td>
					<td><%=b_dto.getRegdate() %></td>
					<td><%=b_dto.getCount() %></td>
				</tr>
				
			
			
			<% }
			%>
			</tbody>
			
		</table>
		
		<form class="form-group">
		 	
		 	</form>
		 	
		 	
		
		
		<%-- 페이지네이션! 페이징기법 넣기 --%>
			<div class="text-center">
			<ul class="pagination">
			<%
			if(totalBlock > 0){ //게시판에 글이 하나라도 존재 한다면?
				if(nowBlock > 0){
		%>
					<li class="page-item">
					<a href="myPage.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1)*pagePerBlock%>&no=<%=dto.getNo()%>
					&category=2">
					이전
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
			<li class="page-item"><a class="page-link" href="myPage.jsp?nowBlock=<%=nowBlock%>&nowPage=
			<%=(nowBlock*pagePerBlock)+i%>&no=<%=dto.getNo()%>&category=2">
		   		<%=(nowBlock*pagePerBlock)  + 1 + i%>
		 	</a>
		 	<% 
				if( ((nowBlock * pagePerBlock) + 1 + i) == totalRecord ){
					break; //반복문 끝내라 
				}
		    }
		%>
		<%if(totalBlock > nowBlock + 1){ %>
		
			<li class="page-item"><a class="page-link" href="myPage.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>
			&no=<%=dto.getNo()%>&category=2">
			다음
			</a>
			</li>
			</ul>
		<%}
		}
	}else{
		
	
	
%>
	<div class="container">
	 <table class="table table-striped">
		<thead>
		<tr>
			<th>구매자</th>
			<th>상품</th>
			<th>가격</th>
			<th>수량</th>
		</tr>
		</thead>
		<%-- 게시물이 없을때 보여질 화면 --%>
		<tbody>
		
			<tr>
			<% 
			int total_price = 0;
			for(int i =0; i< buyer_list.size(); i++){
				BasketDto Bas_dto = buyer_list.get(i);
				total_price += Bas_dto.getPrice()*Bas_dto.getQty();
			%>
				<td><%=Bas_dto.getId() %></td>
				<td><%=Bas_dto.getName() %></td>
				<td><%=Bas_dto.getPrice() %></td>
				<td><%=Bas_dto.getQty() %></td>
				
			</tr>
		<% 	
			}
		%>
		<tr>
			<td colspan="4" class=" text-center">총가격 : <%=total_price %></td>
		</tr>
		</tbody>
		</table>
		</div>
		<%} %>
</div>
</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>