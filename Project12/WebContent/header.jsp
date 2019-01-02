<%@page import="dto.UserDto"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>바껴라</title>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
	

	function fnmemberout(no){
		var memberout = confirm("정말로 회원탈퇴 하시겠습니까?");
			if(memberout){
				var memberout2 = confirm("진짜로? 탈퇴하실건가요?");
					if(memberout2){
						location.href="/Project12/user/memberout.jsp?no="+no;
					}
			}
	}
	
	
	</script>
<title>헤더영역</title>
</head>
<body>
<%-- 세션정보를 확인한후 마이페이지,장바구니등에 정보를 보냄  --%>
<%
UserDao dao = new UserDao();
String ckLogin =(String)session.getAttribute("id");
UserDto dto =  dao.CheckLogin(ckLogin);


%>	
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="/Project12/index.jsp"><i class="fa"></i>HOME</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav"><%if(ckLogin != null) { // 세션이 존재하면 로그아웃으로 바꿈
							%>
								<li><a href="/Project12/user/logoutProc.jsp"><i class="fa"></i>로그아웃</a></li>
								<li><a onclick="fnmemberout(<%=dto.getNo()%>)"><i class="fa"></i>회원탈퇴</a></li>
								<li><a href="/Project12/product/basket.jsp"><i class="fa"></i>장바구니</a></li>
							<%
							}else{	//세션이 없으면 로그인페이지와 회원가입을 보여줌
							%>
								<li><a href="/Project12/user/loginForm.jsp"><i class="fa"></i>로그인</a></li>
								<li><a href="/Project12/user/RegisterForm.jsp"><i class="fa"></i>회원가입</a></li>
							<% 
							}
							%>
									<!-- 로그인된회원번호값을 전달해줌 -->
								<li><a href="/Project12/user/myPage.jsp?no=<%=dto.getNo()%>"><i class="fa"></i>마이페이지</a></li>
								<li><a href="/Project12/board/comunity.jsp"><i class="fa"></i>커뮤니티</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-md-4 clearfix">
						<div class="logo pull-left"> <!-- 로고부분 -->
							<a href="/Project12/index.jsp"><img src="/Project12/images/home/logo.png" alt="" /></a>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li class="dropdown"><a href="/Project12/product/shop.jsp?pa_category=sport">스포츠/레저<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="/Project12/product/shop.jsp?pa_category=sport&ch_category=1">헬스/요가/댄스</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=sport&ch_category=2">부위별 운동용품</a></li> 
										<li><a href="/Project12/product/shop.jsp?pa_category=sport&ch_category=3">라켓스포츠</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=sport&ch_category=4">킥보드/스케이트</a></li>
                                    </ul>
                                </li>
								<li class="dropdown"><a href="/Project12/product/shop.jsp?pa_category=food">식품<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">	
                                        <li><a href="/Project12/product/shop.jsp?pa_category=food&ch_category=1">과일/견과</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=food&ch_category=2">즉석식품</a></li> 
										<li><a href="/Project12/product/shop.jsp?pa_category=food&ch_category=3">쌀/잡곡</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=food&ch_category=4">냉동식품</a></li>
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="/Project12/product/shop.jsp?pa_category=fasion">패션의류<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="/Project12/product/shop.jsp?pa_category=fasion&ch_category=1">남성패션</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=fasion&ch_category=2">여성패션</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=fasion&ch_category=3">스포츠패션</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=fasion&ch_category=4">신발</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=fasion&ch_category=5">유니폼</a></li>
                                    </ul>
                                </li> 
								<li><a href="/Project12/product/shop.jsp?pa_category=home">가전디지털</a>
									<ul role="menu" class="sub-menu">
										<li><a href="/Project12/product/shop.jsp?pa_category=home&ch_category=1">노트북/PC/휴대폰</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=home&ch_category=2">모니터/프린터</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=home&ch_category=3">PC부품/그래픽카드</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=home&ch_category=4">냉장고</a></li>
									</ul>
								</li>
								
								<li><a href="/Project12/product/shop.jsp?pa_category=car">자동차용품</a>
									<ul role="menu" class="sub-menu">
										<li><a href="/Project12/product/shop.jsp?pa_category=car&ch_category=1">인테리어</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=car&ch_category=2">세차/관리용품</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=car&ch_category=3">오일/배터리</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=car&ch_category=4">차량용디지털</a></li>
										<li><a href="/Project12/product/shop.jsp?pa_category=car&ch_category=5">부품/튜닝</a></li>
									</ul>
								</li>
								
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
	<script src="/Project12/js/main.js"></script>
</body>
</html>