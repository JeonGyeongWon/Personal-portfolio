package auth;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

//구글서버를 사용하기 위해 만들어줘야하는....곳
public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;

	public GoogleAuthentication(){
		passAuth = new PasswordAuthentication("a34530091", "xjkcfpggqvkadnau"); //구글 아이디, 앱비밀번호
		// 여기서 말하는 비번은 2단계인증 후 앱 비밀번호를 말하는것!!! 내휴대폰에 사진찍어놓았다
	}
	
	//필수 오버라이딩 메서드
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
	
	
}
