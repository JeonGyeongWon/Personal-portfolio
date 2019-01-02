<%@page import="dao.ProductDao"%>
<%@page import="dto.ProductDto"%>
<%@page import="dto.BasketDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("id")==null){
%>	
<script>
	alert("로그인하지않으면 이용할 수 없는 서비스입니다.");
	location.href="../user/loginForm.jsp";
	</script>
<% 
	}else{
		
	

	int no = Integer.parseInt(request.getParameter("no"));
	int qty = Integer.parseInt(request.getParameter("qty"));
	ProductDao dao = new ProductDao();
	ProductDto p_dto = dao.bringProductInfo(no);
	BasketDto dto = new BasketDto();
	
	dto.setName(p_dto.getName());
	dto.setPrice(p_dto.getPrice());
	dto.setQty(qty);
	dto.setId((String)session.getAttribute("id"));

	ArrayList<BasketDto> list = (ArrayList<BasketDto>)application.getAttribute(session.getAttribute("id")+"basket");
	
	int size;
	if(list==null){
		size =0;
	}else{
		size = list.size();
	}
	
	
	list.add(dto);
	
	if(list.size()>size){
%>
<script>
	alert("장바구니에 추가되었습니다.")
	location.href="shop.jsp?";
</script>
<% 		
	}}
%>	
	
	
	
