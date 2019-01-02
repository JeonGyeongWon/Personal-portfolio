<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%-- JSTL CORE라이브러리 태그 사용을 위한 선언 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"  %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String center = request.getParameter("center");
		
		if(center == null){
			center = "Center.jsp";
		}
		
	%>
	
	
 	<%--
 		센터 공간은 사용자로 부터 계속해서 정보가 바뀌는 부분 이기에 해당 Center.jsp의 정보를 읽어 들여야 한다.
 	 --%>
 	<!--<c:set var="center" value="${param.center}"/>
 	
 	<c:out value="${center}"/>
 	
 	
 	<%-- 처음 CarMain.jsp페이지를 실행하면 당연히 ~ param.center값은? null이기에 조건 추가  --%>
 	<c:if test="${center == null }">
 		<c:set var="center" value="Center.jsp"/>
 	</c:if>-->
 	

	<center>
		<table  width="1000" height="700">
			<tr align="center">
				<td>
					<jsp:include page="Top.jsp"/>  <!-- 헤더 영역 포함 -->
				</td>
			</tr>
			<tr>
				<td height="500">
					<jsp:include page="<%=center %>"/> <!-- 가운데 영역 -->
				</td>
			</tr>
			<tr>
				<td>
					<jsp:include page="Bottom.jsp"/> <!-- 하단 영역 포함 -->
				</td>
			</tr>
		</table>	
	
	</center>

</body>
</html>





