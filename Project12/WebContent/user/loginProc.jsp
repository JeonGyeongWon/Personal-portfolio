<%@page import="dto.BasketDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.UserDto"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%-- 아이디,비번 비교후 알람을 띄워줌 id와 pw가 일치할때는 세션영역에 id값을 생성 
	만약 기억하기 버튼을 체크했다면 쿠키도 보내줌
	checkbox는 체크되면 on으로 체크안하면 null로 넘어온다.
	--%>
	
	<%
		if(session.getAttribute("id")==null){
	%>
		<script>
			alert("로그인하지않으면 이용하실수 없습니다.");
			location.href="../user/loginForm.jsp";
		</script>
	<% 
		}
	
	%>
    <%
    	String remember = request.getParameter("remember"); 
    	String id = request.getParameter("id");
    	String pass = request.getParameter("pass");
    	
    	UserDao dao = new UserDao();
    	UserDto dto = dao.CheckLogin(id);
    	
    	if(dto.getId()!=null){
    	
    		if(pass.equals(dto.getPass())){
    			session.setAttribute("id", id);
    			application.setAttribute(session.getAttribute("id")+"basket", new ArrayList<BasketDto>());
    			if("on".equals(remember)){
    			Cookie cookie = new Cookie("id",id);
    			cookie.setMaxAge(60*60*24);
    			response.addCookie(cookie);
    			}
    			response.sendRedirect("../index.jsp");
    		}else{
    		%>
    			<script>
    			alert('입력하신 비밀번호가 맞지 않습니다.');
    			history.back();
    			</script>
    			<% 
    		}
    		 
    	}else{
    	%>
    	<script>
    		alert('입력한 아이디가 존재하지않습니다.');
    		history.back();
    	</script>
    	<%
    	}
    	%>
    