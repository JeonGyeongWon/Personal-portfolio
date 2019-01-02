<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 메인로고 이미지를 누르면 메인페이지로 이동하도록 하기  -->
	<a href="CarMain.jsp">
		<img src="img/RENT.jpg" width="300" height="80">
	</a>
	
	<!-- 메뉴 만들기  -->
	<table width="1000" background="img/aa.jpg" height="5">
		<tr>
			<td align="center" bgcolor="red">
				<a href="CarMain.jsp?center=CarReservation.jsp">
					<img src="img/bb.jpg"> <!-- 예약하기 메뉴 이미지 -->
				</a>
			</td>
			<td align="center" bgcolor="red">
				<a href="CarMain.jsp?center=CarReserveConfirm.jsp">
					<img src="img/cc.jpg"> <!-- 예약확인 메뉴 이미지  -->
				</a>
			</td>
			<td align="center" bgcolor="red">
				<a href="CarMain.jsp?center=BoardlistController.do"> <!-- 자유게시판 관련 컨트롤러 클래스를 요청할 가상주소 -->
					<img src="img/dd.jpg"> <!-- 자유게시판 메뉴 이미지  -->
				</a>
			</td>
			<td align="center" bgcolor="red">
				<a href="CarMain.jsp?center=CarEven.jsp"> 
					<img src="img/even.jpg"> <!-- 이벤트 메뉴 이미지  -->
				</a>
			</td>
			<td align="center" bgcolor="red">
				<a href="CarMain.jsp?center=AdminBoardListController.do"> <!-- 공지사항 관련 게시판 컨트롤러 요청 --> 
					<img src="img/ee.jpg"> <!-- 고객센터 메뉴 이미지  -->
				</a>
			</td>			
			
		
		</tr>
	
	
	</table>
</body>
</html>





















