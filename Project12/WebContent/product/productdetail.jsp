<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDao"%>
<%@page import="dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
function gobasketProc(no){
	var qty = $("#qty").val();
	location.href="basketProc.jsp?no="+no+"&qty="+qty;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%	
	//해당 상품정보를 들고옴
	int no =Integer.parseInt(request.getParameter("no"));

	ProductDao dao = new ProductDao();
	ProductDto dto = dao.bringProductInfo(no); 
%>
<jsp:include page="../header.jsp"/>
<div class="container">
<div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="imgs/<%=dto.getImage() %>"/>
								<h3>ZOOM</h3>
							</div>

						</div>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<img src="images/product-details/new.jpg" class="newarrival" alt="" />
								<h2>상품이름 :<%=dto.getName() %></h2>
								<p>판매자 :<%=dto.getId() %></p>
								<img src="images/product-details/rating.png" alt="" />
								<span>
									<span>가격: <%=dto.getPrice() %></span>
									<label>수량:</label>
									<input type="text" id="qty"  />
									<button type="button" class="btn btn-fefault cart" onclick="gobasketProc(<%=dto.getNo()%>);">
										<i class="fa fa-shopping-cart"></i>
										장바구니에담기
									</button>
								</span>
								<p><b>재고:</b> <%=dto.getStock() %></p>
								<p><b>재품설명 :</b> <%=dto.getContent() %></p>
								<a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					
					<br><br><br><br><br><br><br><br>
					
					
					
					
					<%-- 관련상품들 뿌려주기 --%>
					<%
						ArrayList<ProductDto> p_list = dao.allSelectedCategoryProduct(dto.getPa_category(), dto.getCh_category(), dto.getNo());
					%>
					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">관련상품들</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
							<%for(int i=0; i<p_list.size(); i++) {
								ProductDto p_dto = p_list.get(i);
								%>
								<div class="item active">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="imgs/<%=p_dto.getImage() %>" />
													<h2>가격 : <%=p_dto.getPrice() %></h2>
													<p>상품이름 :<%=p_dto.getName() %></p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>장바구니담기</button>
												</div>
											</div>
										</div>
									</div>
									
									
								</div>
								<%} %>
							</div>
							
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			
						</div>
					</div><!--/recommended_items-->
					</div>
					</div>
					<jsp:include page="../footer.jsp"/>
</body>
</html>