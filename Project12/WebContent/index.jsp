<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDao"%>
<%@page import="dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<!-- 세션을 가져옴 밑에 로그인->로그아웃 마이페이지구현 및 장바구니에 사용 -->
	<%
		ProductDao dao = new ProductDao();
		ArrayList<ProductDto> list = dao.allBringProduct();
	%>
	
	
<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
						<%-- 슬라이더 부분 나중에  --%>
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
						<%for(int i=0; i<list.size(); i++) {%>
							<%-- 처음이면 active 클래스값을 줌 --%>
							<div class="item <%if(i==0) {%> active <%} %>" >
								<div class="col-sm-6">
									<h1><span>E</span>-SHOPPER</h1>
									<h2>요기저기</h2>
									<p>쇼핑하세요!</p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img src="images/home/girl2.jpg" class="girl img-responsive" alt="" />
									<img src="images/home/pricing.png"  class="pricing" alt="" />
								</div>
							</div>		
						<%
						}
						%>	
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	
	<section>
		<div class="container">
				<div class="col-sm-12 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">전체상품들~</h2>
						<%
							//상품을 뿌려주는부분
							for(int i=0; i<list.size(); i++){
							ProductDto dto = list.get(i); 
						%>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="product/imgs/<%=dto.getImage() %>"/>
										<h2><%=dto.getPrice()%>원</h2>
										<p>추천수 :<%=dto.getBestCount() %></p>
										<a href="product/productdetail.jsp?no=<%=dto.getNo() %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상품보기</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2><%=dto.getPrice()%>원</h2>
											<p>추천수 :<%=dto.getBestCount() %></p>
											<a href="product/productdetail.jsp?no=<%=dto.getNo() %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상품보기</a>
										</div>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="product/basket.jsp"><i class="fa fa-plus-square"></i>장바구니로가기</a></li>
										<li><a href="product/productdetail.jsp?no=<%=dto.getNo() %>"><i class="fa fa-plus-square"></i>상품보기</a></li>
									</ul>
								</div>
							</div>
						</div>
						<%} %>
							</div>
						</div>
						
					</div><!--features_items-->
					
				
		
	</section>
	<jsp:include page="footer.jsp"/>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>