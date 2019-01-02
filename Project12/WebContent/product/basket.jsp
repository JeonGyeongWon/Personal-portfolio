<%@page import="dto.BasketDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%
	if(session.getAttribute("id")==null){
%>
	<script>
		alert("로그인해야이용할수 있습니다.");
		location.href="../user/loginForm.jsp";
	</script>
<% 		
	}

%>

<script>

function buyerProc(){
	location.href="buyerProc.jsp";
}

</script>

<%
	ArrayList<BasketDto> list =(ArrayList<BasketDto>)application.getAttribute(session.getAttribute("id")+"basket");
%>
<body>
	<jsp:include page="../header.jsp"/>
	<div class="container">
	<table class="table table-striped">
		<thead>
		<tr>
			<th>번호</th>
			<th>상품</th>
			<th>가격</th>
			<th>수량</th>
		</tr>
		</thead>
		<%-- 게시물이 없을때 보여질 화면 --%>
		<tbody>
		
		<%
		if(list==null){
		%>
			<tr><td colspan="4"><h2>장바구니가 텅텅텅 비어있습니다.</h2></td></tr>
		<% 
		}else{
		int total_price =0;
		for(int i=0; i<list.size(); i++) {
			BasketDto dto = list.get(i);
		%>
			<tr>
				<td><%=i+1%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getPrice() %></td>
				<td><%=dto.getQty() %>
			</tr>
		<% 	
		
		total_price += dto.getPrice()*dto.getQty();
		}
		%>
		<tr>
			<td colspan="4">총 가격은: <%=total_price %></td>
		</tr>
		</tbody>
		</table>
			<button onclick="buyerProc();" class="btn text-center">구매하기!</button>
		<%} %>
		</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>