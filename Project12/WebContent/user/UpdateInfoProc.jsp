<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>


<jsp:useBean id="dto" class="dto.UserDto"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dao" class="dao.UserDao"/>

<%
	
	int result =dao.UpdateInfo(dto);

	if(result>0){
%>
	<script>
		alert('수정되었습니다.');
		location.href="index.jsp"
	</script>

<% 		
	}else{
%>
	<script>
		alert('수정안됬습니다.');
		history.back();
	</script>
<% 		
	}
%>
