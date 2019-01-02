<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ID 중복 체크 --%>

<%
	String id =request.getParameter("overLabckId");

	UserDao dao = new UserDao();
	int result = dao.ckoverLabId(id);
	
	if(result == 0){
%>
	<script>
		alert("이미 사용중인 아이디입니다!. 다른 ID를 사용해주세요");
		window.close();
	</script>
<%
	}else{
%>
	<script>
		var yesId = confirm("사용가능한 아이디 입니다 사용하시겠습니까?");
		
		if(yesId){
			opener.document.getElementById("id").value = "<%=id%>";
			opener.document.getElementById("id").setAttribute("readonly", "readonly");
			window.close();
		}else{
			alert("다시인증해주세요");
			window.close();
		}
	</script>
<%		
	}
%>