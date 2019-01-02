<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%-- 다음 주소찾기를 위한 js추가 http://postcode.map.daum.net/guide 참조 --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>회원가입 양식</title>

<script
src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
<%-- 인증 하는 부분들은 빨간색으로 표시해줌--%>
$(function(){
	//각 인증하는 플래그를 설정
	$("#email").css("color","red");
	$("#phoneNumber").css("color","red");
	$("#RegisterForm").css("margin","0 auto");
	$("#roadAddress").css("color","red");
	$("#detailAddress").css("color","red");
	$("#jibunAddress").css("color","red");
});
	
		<%-- 이메일 인증시 새창을 띄워줌 --%>
		function fnEmail(){
			window.open("emailAuth.jsp?",
					"emailAuth","width=570","height=350","resizable=no","scrollbars=no");
		}
		<%-- 휴대폰 인증시 새창을 띄워줌  --%> 
		function fnPhone(){
			var rphone = $('#phoneNumber').val();	//사용자에게 입력값을 받음
			var regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;	//휴대폰 정규식
			if(!regExp.test(rphone)){
				alert('잘못된 휴대폰 번호 형식입니다. -를 포함해서 입력해주세요');
				$('#phoneNumber').focus();
				return false;
			}else{
			
			window.open("SMSAuthForm.jsp?phoneNumber="+rphone,
					"SMSAuth","width=570","height=350","resizable=no","scrollbars=no");
			}
		}
		
		<%-- 아이디 중복체크를 하는 메서드 --%>
		function overLabId(){
			var FormID = $("#id").val();
			var pattern = /^[A-Za-z0-9]{4,12}$/;
			if(!pattern.test(FormID)) {
		alert('영문대,소문자 , 숫자 4 ~12 자리로 입력해 주세요.');
			}else{
				
				window.open("overLabckId.jsp?overLabckId="+FormID
				,"SMSAuth","width=570","height=350","resizable=no","scrollbars=no")
			}

		}
			
		
	
<%-- 주소찾기를 위해 다음주소찾기 api를 이용--%>		

	<%--팝업창을 이용한 찾기를 가져옴--%>
	function execDaumPostcode() {
        	new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("roadAddress").value = roadAddr;
                    document.getElementById("jibunAddress").value = data.jibunAddress;
                    
                }
            }).open();
        }
            

		
	//현재는 큰기능만 구현
	//이메일,휴대폰,우편찾기 구현 , 넘어가는값 유효성검사 (다음,구글 참조)
	//-> 정규식 확인해보기 id가 비었을때, pass가 비었을때,
	//-> 이름은 한글만가능하게 주민번호 뒷자리 aSSN은 1,2,3,4만 올수 있게	
function RegisterCk(){
	
	var id = $("#id").val();
	var pass = $("#pass").val();
	var pass2 = $("#pass2").val();
	var email = $("#email")
	var aSSN  = $("#aSSN").val();
	var aSSNck = aSSN.charAt(0);
	var pSSN = $("#pSSN").val();
	var name = $("#name").val();
	//주소 창은 여러개지만 한번에 들어가므로 한개의 값만 비교함
	var addr = $("#roadAddress").val();
	//정규식 체크 인터넷보고 찾았다! 
	// 영어 (대문자+소문자) + 숫자 + 특수문자 가 섞인 8~15자리의 수
	var password_pattern = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	//한글처리만하는 정규식
	var ckName = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	if(!($("#id").attr("readonly")=="readonly")){
		alert("id인증을 해주세요");
		$("#id").focus();
	}else if(pass!=pass2){
		alert('비밀번호와 비밀번호확인 값이 맞지 않습니다.');
		$("#pass2").focus();
		//정규식 사용방법 한글이 있으면 true를 반환함
	}else if(!password_pattern.test(pass)){
		alert("패스워드는 영어+숫자+특수문자형태로 8~15자리만 허용됩니다.");
		$("pass").focus();
	}else if(!(ckName.test(name))){
		alert('이름은 한글입력만 가능합니다!')
		$("#name").focus();
	}else if($("#email").val()=="" || $("#email").val().length==0){
		alert("이메일 인증을 해주세요");
		$("#email").focus();
	}else if(!($("#phoneNumber").attr("readonly")=="readonly")){	//이메일 인증을 하지 않았을때
		alert("휴대폰 인증을 해주세요");
		$("#phoneNumber").focus();
	}else if(pSSN.length!=6){
		alert('주민번호 앞자리 형식이 맞지 않습니다.');
		$("#pSSN").focus();
	}else if(!(aSSNck==1 || aSSNck==2 || aSSNck==3 || aSSNck==4) || aSSN.length!=7){
		alert('주민번호 뒷자리 형식이 맞지 않습니다.');
		$("#aSSN").focus();
	}else if($("#roadAddress").val() ==null || $("#roadAddress").val().length==0 || $("#jibunAddress").val() ==null ||$("#jibunAddress").val().length==0){
		alert('주소인증을 해주세요');
		$("#addrAuth").focus();
		
	}else{
		
		$("#RegisterForm").submit();
	}
}


</script>
<link rel="stylesheet" type="text/css" href="css/RegisterForm.css">
</head>
<body>
<jsp:include page="../header.jsp"/>

<div class="container text-center">
<form id="RegisterForm" action ="RegisterProc.jsp" method="post">
	<div class="form-group ">
		<label for="id">아이디 <a onclick="overLabId();">[중복확인]</a></label>
		 <input id="id" name="id" type="text" equired autofocus maxlength="8" class="form-control">
	</div>
	<div class="form-group">
		<label for="password">비밀번호</label>
		<input id="pass" name="pass" type="password"  required maxlength="10" class="form-control">
	</div>
	<div class="form-group">
		<label pwd="pass2">비밀번호 확인</label>
    <input id="pass2" type="password" required maxlength="10" class="form-control">
	</div>
	<div class="form-group">
		<label pwd="name">이름</label>
    <input id="name" name="name" type="text" placeholder="5자미만 공백없이" required class="form-control">
	</div>
	<div class="form-group">
		<label pwd="email">메일주소  <a id="AuthEmailTagA" onclick="fnEmail();">[인증]</a></label>
    <input id="email" name="email" type="email" placeholder="이메일인증을해주세요" class="form-control" 
    readonly>
	</div>
	<div class="form-group">
		<label pwd="tel">연락처 <a onclick="fnPhone();">[인증]</a></label>
    <input id="phoneNumber" name="phoneNumber" type="tel" value="" autocomplete="off" 
     placeholder="ex)010-3453-0091처럼 입력해주세요" class="form-control">
	</div>
	<div class="form-group">
		<label pwd="pSSN">주민번호 앞자리</label>
    <input id="pSSN" name="pSSN" type="text" autocomplete="off" class="form-control" maxlength="6">
	</div>
	<div class="form-group">
		<label pwd="aSSN">주민번호 뒷자리</label>
    <input id="aSSN" name="aSSN" type="text" autocomplete="off" class="form-control" maxlength="7">
	</div>
	<div class="form-group">
		<label pwd="aSSN">주소 <a id="addrAuth" onclick="execDaumPostcode();">[인증]</a></label>
		<input type="text" id="roadAddress" placeholder="도로명주소" readonly name="addr1" class="form-control">
		<input type="text" id="jibunAddress" placeholder="지번주소" readonly name="addr2" class="form-control">
		<input type="text" id="detailAddress" placeholder="상세주소" name="addr3" class="form-control">
	</div>
	<fieldset>
  <button type="button" class="btn btn-default" onclick="RegisterCk()"> 회원가입 </button> 
</fieldset>
</form>
</div>


<jsp:include page="../footer.jsp"/>


</body>
</html>