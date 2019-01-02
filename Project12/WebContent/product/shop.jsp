<%@page import="dao.ProductDao"%>
<%@page import="dto.ProductDto"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>

</script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쇼핑목록</title>
    <link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.3.1.js">
	
	</script>	
	<script>
	
	$(function(){
		
		$("#insertProductBtn").on("click",function(){
			location.href="insertProductForm.jsp";
		})
		
	})
	
	</script>
</head><!--/head-->

<%
	//전체 상품들을 가져옴... 
	// *나중에 카테고리별로 상품가져올때 list값만 바꾸는 dao메서드만 사용하면 된다.* 
	String pa_category="";
	int ch_category;
	ProductDao dao = new ProductDao();
	ArrayList<ProductDto> list=null;
	
	if(request.getParameter("pa_category")!=null && request.getParameter("ch_category")!=null){
		pa_category=request.getParameter("pa_category");
		ch_category=Integer.parseInt(request.getParameter("ch_category"));
		list = dao.allSelectedCategoryProduct(pa_category, ch_category);
	}else if(request.getParameter("pa_category")!=null){
		pa_category=request.getParameter("pa_category");
		list = dao.allSelectedCategoryProduct(pa_category);
	}else if(request.getParameter("pa_category")==null){
		list = dao.allSelectedCategoryProduct("sport");
	}
	
	
	
	
%>
<body>
	
	<jsp:include page="../header.jsp"/>
					<div class="container">
				<div class="col-sm-12 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">판매상품</h2>
						<%
						if(list.isEmpty()){
						%>
							<h1>등록된상품이 없습니다. 상품을 등록해보세요</h1>
						<%
						}else{
						
						for(int i=0; i<list.size(); i++) {
							ProductDto dto = list.get(i);
						%>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="imgs/<%=dto.getImage() %>"/>
										<h2><%=dto.getPrice()%>원</h2>
										<p>추천수 :<%=dto.getBestCount() %></p>
										<a href="productdetail.jsp?no=<%=dto.getNo() %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상품보기</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2><%=dto.getPrice()%>원</h2>
											<p>추천수 :<%=dto.getBestCount() %></p>
											<a href="productdetail.jsp?no=<%=dto.getNo() %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상품보기</a>
										</div>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="basket.jsp"><i class="fa fa-plus-square"></i>장바구니로가기</a></li>
										<li><a href="productdetail.jsp?no=<%=dto.getNo() %>"><i class="fa fa-plus-square"></i>상품보기</a></li>
									</ul>
								</div>
							</div>
						</div>
						<%}} %>
					</div>
					<button class="btn btn-default pull-right" id="insertProductBtn" >상품등록</button>
				</div>
			</div>
						
	<jsp:include page="../footer.jsp"></jsp:include>
	

  
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>