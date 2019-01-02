<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$("#loginFormDiv").css("margin","0 auto");
</script>
<title>로그인</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div id="loginFormDiv" class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>로그인 정보</h2>
						<form action="loginProc.jsp" method="post">
							<input type="text" name="id" placeholder="ID를 입력하세요" />
							<input type="password" name="pass" placeholder="비밀번호를 입력하세요" />
							<span>
								<input type="checkbox" name="remember" class="checkbox" checked> 로그인정보 저장
							</span>
							<button type="submit" class="btn btn-default">로그인</button>
						</form>
						<br>
						<button class="btn btn-default"><a href="RegisterForm.jsp">회원가입</a></button>
					</div><!--/login form-->
				</div>				
			</div>
		</div>
	</section><!--/form-->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>