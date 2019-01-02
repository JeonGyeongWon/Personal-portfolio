<%@page import="db.CarConfirmBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	 <center>
			<img src="img/naeyeok.jpg">
			<p></p>
			<table width="1000" border="1" align="center">
			
			<tr align="center">
				<td align="center" width="150">차량이미지</td>
				<td align="center" width="100">차량명</td>
				<td align="center" width="100">대여일</td>
				<td align="center" width="50" >대여기간</td>
				<td align="center" width="100">차량금액</td>
				<td align="center" width="70">보험여부</td>
				<td align="center" width="70">무선WIFI</td>
				<td align="center" width="70">네비게이션</td>
				<td align="center" width="70">베이비시트</td>
				<td align="center" width="150">수정</td>
				<td align="center" width="100">삭제(취소)</td>
				
			</tr>
			<%-- 
			<c:forEach var="CarConfirmBean" items="${requestScope.v }"> 
				<tr>
					<td align="center" width="150"><img src="img/${CarConfirmBean.carimg }" width="140" height="90"></td>
				<td align="center" width="100">${CarConfirmBean.carname }</td>
				<td align="center" width="100">${CarConfirmBean.carbegindate}</td>
				<td align="center" width="50" >${CarConfirmBean.carreserveday }</td>
				<td align="center" width="100">${CarConfirmBean.carprice }</td>
				<td align="center" width="70">
					<c:if test="${carConfirmBean.carins==1 }">
						보험가입
					</c:if>
					<c:if test="${carConfirmBean.carins==0 }">
						보험미가입
					</c:if>
				</td>
				<td align="center" width="70">
					<c:if test="${carConfirmBean.carwifi==1 }">
						대여
					</c:if>
					<c:if test="${carConfirmBean.carwifi==0 }">
						미대여
					</c:if>
				</td>
				<td align="center" width="70">
					<c:if test="${carConfirmBean.carnave==1 }">
						대여
					</c:if>
					<c:if test="${carConfirmBean.carnave==0 }">
						미대여
					</c:if>
				</td>
				<td align="center" width="70">
					<c:if test="${carConfirmBean.carbabyseat==1 }">
						대여
					</c:if>
					<c:if test="${carConfirmBean.carbabyseat==0 }">
						미대여
					</c:if>
				</td>
				<td align="center" width="100">
					<button onclick="location.href='CarConfirmUpdateController.do?orderid=${carConfirmBean.orderid}&carimg=${carConfirmBean.carimg}'">수정
					</button>
				</td>
				<td align="center" width="100">
					<button onclick="location.href='CarMain.jsp?center=CarConfirmDelete.jsp&orderid=${carConfirmBean.orderid}'">
					</button>
				
				</td>
				</tr>
			</c:forEach>
			--%>
			
			<%
				Vector<CarConfirmBean> v = (Vector<CarConfirmBean>)request.getAttribute("v");
				for(int i=0; i<v.size(); i++){
					CarConfirmBean bean = v.get(i);
			%>
				<tr align="center">
					<td align="center" width="150"><img src="img/<%=bean.getCarimg()%>"></td>
					<td align="center" width="100"><%=bean.getCarname() %></td>
					<td align="center" width="100"><%=bean.getCarbegindate() %></td>
					<td align="center" width="50" ><%=bean.getCarreserveday() %></td>
					<td align="center" width="100"><%=bean.getCarprice() %></td>
					<td align="center" width="70"><%if(bean.getCarins()==1){%>적용<%}else{%>미적용 <%} %></td>
					<td align="center" width="70"><%if(bean.getCarwifi()==1){%>적용<%}else{%>미적용 <%} %></td>
					<td align="center" width="70"><%if(bean.getCarnave()==1){%>적용<%}else{%>미적용 <%} %></td>
					<td align="center" width="70"><%if(bean.getCarbabyseat()==1){%>적용<%}else{%>미적용 <%} %></td>
					<td align="center" width="150">
					<button onclick="location.href='CarConfirmUpdateController.do?orderid=<%=bean.getOrderid() %>}&carimg=<%=bean.getCarimg()%>'">수정
					</button>
					</td>
					<td align="center" width="100">
					<button onclick="location.href='CarMain.jsp?center=CarConfirmDelete.jsp&orderid=<%=bean.getOrderid()%>'">
					</button>
					</td>
				</tr>
			<%
				}
			%>	
			</table>
			
			
				 
	 
	 </center>
</body>
</html>