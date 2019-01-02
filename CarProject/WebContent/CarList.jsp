<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<img alt="" src="img/cis.jpg"> <!-- <차량 정보보기>이미지 -->
		<!-- 카테고리 분류 검색을 위하여 서블릿 요청-->	 
		<form action="CarCategoryController.do" method="post">
			<!-- 실제 전체차량에 관한 이미지 정보 뿌려주기 -->
			<table width="1000" border="0" height="470">
			<c:set var="j" value="0"/>
			<!--CarListController에서 넘겨받은 request영역안에 있는 백터를 꺼내서 백터 사이즈만큼 반복-->
			<c:forEach var="carlistbean"  items="${requestScope.vector}">
			<!--4열씩 자동차 이미지, 내용 뿌려주기 위해 4번마다 tr태그를 열어 준다-->
			<c:if test="${j % 4 == 0 }">
				<tr align="center">
			</c:if>
				<td>
					<a href="CarInfoController.do?carno=${carlistbean.carno}">
					<img src="img/${carlistbean.carimg}" width="220" height="180"></a><br/>
					&nbsp;차량명 : ${carlistbean.carname} <br/>
					대여금액: ${carlistbean.carprice}
				</td>					
			<!--j변수값 1씩 증가시키기-->
			<c:set var="j" value="${j+1}"/>
			</c:forEach>
				</tr>
				<tr height="70">
					<td colspan="4" align="center">
					    차량검색 : 
					    <select name="carcategory">
					    	<option value="Small">소형
					    	<option value="Mid">중형
					    	<option value="Big">대형
					    </select> &nbsp;&nbsp;&nbsp;&nbsp;
					    <input type="submit" value="차량 검색">
					</td>				    
				</tr>
			</table>
		</form>	
	</center>

</body>
</html>













