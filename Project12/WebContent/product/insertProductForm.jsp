<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<%
	String id = null;
	if(session.getAttribute("id")!=null)
		id= (String)session.getAttribute("id");

	if(id==null){
		
%>		
	<script>
		alert("로그인하시지않으면 이용할수 없는 서비스입니다.")
		location.href="../user/loginForm.jsp"
	</script>
<%
	}
%>
<script>
<%-- 상위카테고리 셀렉트되면 하위카테고리 값 만들어주기--%>
<%-- 바뀔때 각 값들을 처음 초기화시키귀ㅙ html을 써줌 --%>
$(function(){
	$("#pa_category").change(function(){
		if($("#pa_category option:selected").val()=="sport"){
			$("#ch_category").html("<option value='1'>헬스/요가/댄스</option>");
			$("#ch_category").append("<option value='2'>부위별 운동용품</option>");
			$("#ch_category").append("<option value='3'>라켓스포츠</option>");
			$("#ch_category").append("<option value='4'>킥보드/스케이트</option>");
		}else if($("#pa_category option:selected").val()=="food"){
			$("#ch_category").html("<option value='1'>과일/견과</option>");
			$("#ch_category").append("<option value='2'>즉석식품</option>");
			$("#ch_category").append("<option value='3'>쌀/잡곡</option>");
			$("#ch_category").append("<option value='4'>냉동식품</option>");	
		}else if($("#pa_category option:selected").val()=="fasion"){
			$("#ch_category").html("<option value='1'>남성패션</option>");
			$("#ch_category").append("<option value='2'>여성패션</option>");
			$("#ch_category").append("<option value='3'>스포츠패션</option>");
			$("#ch_category").append("<option value='4'>신발</option>");
			$("#ch_category").append("<option value='5'>헬스/요가/댄스</option>");
		}else if($("#pa_category option:selected").val()=="home"){
			$("#ch_category").html("<option value='1'>노트북/PC/휴대폰</option>");
			$("#ch_category").append("<option value='2'>모니터/프린터</option>");
			$("#ch_category").append("<option value='3'>PC부품/그래픽카드</option>");
			$("#ch_category").append("<option value='4'>냉장고</option>");
		}else if($("#pa_category option:selected").val()=="car"){
			$("#ch_category").html("<option value='1'>인테리어</option>");
			$("#ch_category").append("<option value='2'>세차/관리용품</option>");
			$("#ch_category").append("<option value='3'>오일/배터리</option>");
			$("#ch_category").append("<option value='4'>차량용디지털</option>");
			$("#ch_category").append("<option value='4'>부품/튜닝</option>");
		}
	})
});		

<%-- 유효성 검사 부분--%>

function insertProductCk(){
var productNameCk = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;	//한글,영문,숫자허용 정규식
var onlynumberCk = /^[0-9]+$/;	//숫자만 허용 정규식
var fileImageCk = /\.(jpg|gif|jpg|jpeg|png)$/i;	//파일이미지제한
if(!productNameCk.test($("#name").val())){
	alert("상품명을 입력하지 않았거나 특수문자가 들어가있습니다.");
	$("#name").focus();
}else if(!onlynumberCk.test($("#price").val())){
	alert("가격은 숫자만 입력 가능합니다.!");
	$("#price").focus();
}else if(!onlynumberCk.test($("#stock").val())){
	alert("재고는 숫자만 입력 가능합니다.!");
	$("#stock").focus();
}else if(!fileImageCk.test($("#image").val())){
	alert("이미지 파일을 선택하지 않았거나, bmp,gif,jpg,jpeg,png 파일이 아닙니다..");
	$("#image").focus();
}else if($("#content").val().length==0 ||$("#content").val()==""){
	alert("상품설명을 입력해주세요");
	$("#content").focus();
}else{
	$("#pform").submit();
}
}

</script>
<%-- 나중에 유효성검사하기 12-19--%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"/>

	<%
		//SESSION 작업
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	
	<!-- 회원가입 양식 -->
	<div class="container">
<!-- 	먼저 회원가입 양식부분의 form에 onSubmit="return finalCheck();" 를 추가하여 
       submit 버튼을 눌렀을 때 submit이 되기 전에 finalCheck() 라는 JavaScript를 실행하도록 하였습니다. -->
		<form method="post" action="insertProductProc.jsp" enctype="multipart/form-data" id="pform">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="4" class="text-center"><h4>상품등록</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 80px;">
							<h5>상위카테고리</h5>
						</td>
						<td colspan="1" style="width:80px;">
							<select name="pa_category" id="pa_category">
								<option value="sport"selected>스포츠/레저</option>
								<option value="food">식품</option>
								<option value="fasion">패션의류</option>
								<option value="home">가전디지털</option>
								<option value="car">자동차용품</option>
							</select>
						</td>
						<td style="width: 80px;">
							<h5>하위카테고리</h5>
						</td>
						<td style="width: 80px;">
							<select name="ch_category" id="ch_category">
								<option value="1">헬스/요가/댄스</option>	<!-- 기본값설정 -->
								<option value="2">부위별 운동용품</option>
								<option value="3">라켓스포츠</option>
								<option value="4">킥보드/스케이트</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="width: 80px;">
							<h5>상품명</h5>
						</td>
						<td colspan="4">
							<input class="form-control" type="text" id="name" name="name" maxlength="20" placeholder="상품명은 20자 이하로해주세요">
						</td>
					</tr>
					<tr>
						<td style="width: 80px;">
							<h5>가격</h5>
						</td>
						<td colspan="1" style="width:80px;">
							<input class="form-control" type="text" id="price" name="price" placeholder="가격을 적어주세요">
						</td>
						<td style="width: 80px;">
							<h5>재고</h5>
						</td>
						<td style="width: 80px;">
							<input class="form-control" type="text" id="stock" name="stock" placeholder="가격을 적어주세요">
						</td>
					</tr>
					<tr>
						<td style="width: 80px;">
							<h5>이미지</h5>
						</td>
						<td colspan="3">
							<input class="form-control" type="file" id="image" name="image" placeholder="이미지를 선택해주세요">
						</td>
					</tr>
					<tr align="center">
						<td style="width: 80px;" rowspan="1">
							<h5 class="text-center">상품설명</h5>
						</td>
						<td colspan="3" rowspan="1">
							<textarea class="form-control" rows="5" id="content" name="content" placeholder="상품설명을 적어주세요"></textarea>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;">
							<h5>세일유무</h5>
						</td>
						<td colspan="2">
							<div class="form-group" style="text-align: center; margin:0 auto;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active">
										<input type="radio" name="sale"  value="true" checked>세일중
									</label>
									<label class="btn btn-primary">
										<input type="radio" name="sale"  value="false">세일안함
									</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 80px;">
							<h5>id</h5>
						</td>
						<td colspan="3">
							<input class="form-control" type="text" id="id" name="id" readonly value="<%=id%>">
						</td>
					</tr>
					<tr>
						<td style="text-align: left;" colspan="4">
							<h5 style="color: red;" id="passwordCheckMessage"></h5>
							<input class="btn btn-primary pull-right" type="button" value="등록" onclick="insertProductCk();">
						</td>   
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<jsp:include page="../footer.jsp"/>
</body>
</html>