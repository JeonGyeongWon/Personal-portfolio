<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="auth.GoogleAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<script>
<%
	//메일인증을 위해 임의의 숫자 6개를 만듬
	String randomNumber="";
	String receiver = "";
	if(request.getParameter("receiver")!=null){
	receiver = request.getParameter("receiver");
	}
	String sender = "";
	if(request.getParameter("sender")!=null){
	sender = request.getParameter("sender");
	}
	for(int i=0; i<6; i++)
	randomNumber += (int)(Math.random()*9)+1;
%>

<%-- 보낸 인증번호와 입력한 인증번호가 맞는지 확인하는 메서드  --%>

function ckAuthForm(){
		var randomNumber = <%=randomNumber%>
		var auth = $("#ckAuth").val();
		
		if(randomNumber != auth){
			alert('인증번호가 틀립니다.');
			return false;
		}else{
			alert('인증되었습니다.');
			opener.document.getElementById("email").value="<%=receiver%>"
			window.close();
		}
	}
</script>
</head>
<body>

<%-- 구글 SMTP를 사용하여 이메일인증을 구현함 --%>
<%

	
	//메일보내는 부분
	try{
		Properties properties = System.getProperties(); //서버정보를 properties에 저장함
		properties.put("mail.smtp.starttls.enable","true"); //Starttls Command를 사용할 수 있게 설정하는 부분
		properties.put("mail.smtp.host","smtp.gmail.com"); //SMTP 서버를 지정하는부분 (구글로했음)
		properties.put("mail.smtp.auth","true"); //auth command를 사용하여 사용자 인증을 할 수 있게 하는 부분
		properties.put("mail.smtp.port","587");	//서버(구글)포트를 지정하는 부분
		Authenticator auth = new GoogleAuthentication(); //인증정보를 생성하는 부분
		Session s = Session.getDefaultInstance(properties,auth); //메일 전송역활을 하는 단위인 Session 객체를 생성하는 부분.
		Message message = new MimeMessage(s);	//생성된 Session객체를 사용하여 전송한 Message 객체를 생성하는 부분
		Address sender_address = new InternetAddress(sender); // 메일 송신주소를 생성하는부분
		Address receiver_address = new InternetAddress(receiver); //메일 수신주소를 생성하는 부분
		message.setHeader("content-type", "text/html; charset=utf-8");	// 보낼 메시지에 MIME타입을 지정
		message.setFrom(sender_address);	//보내는사람의 주소를 저장
		message.addRecipient(Message.RecipientType.TO, receiver_address);	//받는사람의 주소를저장...햇갈림
		message.setSubject("메일인증입니다!");
		message.setContent("인증번호는 :"+randomNumber,"text/html; charset=UTF-8");
		message.setSentDate(new java.util.Date());
		Transport.send(message);	//ㄸ럽ㄹㅈ다렞ㅁㅎ저	
	}catch(Exception e){
		System.out.println("이메일인증중 문제가 생기면 안되는데 왜생길까?"+e);
	}
	//여기까지 예외처리나지않으면 문제가 없는것
%>	<form action="RegisterForm.jsp" id="AuthForm">
	<input type="hidden" name="receiver" value="<%=receiver %>">
	인증번호 : <input type="text" id="ckAuth"> 
	</form>
	<button onclick="ckAuthForm();">인증 </button>
</body>

</html>	
	

