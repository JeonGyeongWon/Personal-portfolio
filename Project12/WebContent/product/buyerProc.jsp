<%@page import="dto.BasketDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BuyerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    ArrayList<BasketDto> list =(ArrayList<BasketDto>)application.getAttribute(session.getAttribute("id")+"basket");
    	
    BuyerDao dao = new BuyerDao();
    
    dao.insertBuyerProduct(list);
    
    application.removeAttribute(session.getAttribute("id")+"basket");
    %>
    <script>
    	alert("추가되었습니다.! 마이페이지에서 확인 가능합니다.");
    	location.href="shop.jsp";
    </script>