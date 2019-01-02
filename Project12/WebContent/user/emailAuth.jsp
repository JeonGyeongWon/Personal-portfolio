<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>

function fneamilCk(){
var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
if(!regExp.test($("input[name=receiver]").val())){
	alert("올바른 이메일 형식이 아닙니다.");
	return false;
}else{
	$("#emailForm").submit();
}
}
// 출처: http://epthffh.tistory.com/entry/비밀번호-정규식 [물고기 개발자의 블로그]
</script>
<body>
	<div class="container">
	<%-- 인증창, hidden값으로 보내는사람(사이트운영자)를적어준다. --%>
		<form action="emailAuthProc.jsp" id="emailForm">
			<input type="hidden" name="sender" value="a34530091@gmail.com">
			<input type="email" name="receiver" placeholder="이메일인증해주세요">
			<input type="button" value="인증받기" onclick="fneamilCk();">
		</form>
	</div>
</body>
</html>