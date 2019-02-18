

# Personal-portfolio
개인포트폴리오 저장공간

https://github.com/JeonGyeongWon/TeamProject << 팀프로젝트보러가기


        ● 프로젝트명 : 
        - 쇼핑몰과 커뮤니티를 같이 할 수 있는 사이트

        ● 개요 
        - 쇼핑을 할 수 있는 사이트며 다른 사용자와 대화가 가능한 커뮤니티 게시판

        ● 사용언어 : JAVA1.8, JSP2.3 JavaScript, Jquery3.3.1, Ajax, 
	- 사용 api : 네이버스마트에디터, CAFE24(문자보내기), 다음 주소찾기

	● 개발환경 
	OS/DB/Tools/ETC : Windows10 / MYSQL5.6 / Eclipse Mars2 / HTML5&CSS3 / BootStrap4 
	다음 주소검색 API, 네이버스마트에디터, 구글 이메일보내기, cafe24의 SMS보내기 api

        ● 구현목록
	 회원가입, 로그인, 회원정보수정, 게시판(CRUD), 자료실(파일업로드, 다운로드), 이미지갤러리게시판, 답변달기, 추천하기, 
	 댓글달기, 우편번호 검색(다음api), 페이징, 장바구니, 관련상품 보여주기, 검색기능, 메일보내기, 문자보내기(Caff24)


        #로그인 : 
                -로그인시 쿠키값을 식별하여 쿠기값이 있다면 자동으로 로그인해주며 쿠키값이 없다면 입력 후 
                 DB에 저장되어 있는 id와 비밀번호를 매칭에 맞으면 세션값에 해당 id값을 넣어 로그인 표시를 해줍니다.
                 아이디기억하기 버튼을 누르면 해당 id값으로 쿠키를 생성하여 해당 클라이언트에게 보내줍니다.
        
        #회원가입 :
                -회원가입시에는 각 입력란에 정규식과 유효성검사를 실시하여 DB에 올바른 값들만 전송되도록 설정해놨습니다. 
                 

                 1. 아이디 중복체크 확인시 입력값이 DB에 존재하는지 체크하여 유효성검사를 실시했습니다

                 2. 이메일 인증시 : 랜덤값으로 6자리 숫자를 생성한 뒤 구글 SMTP프로토콜을 이용하여 입력한 이메일로 해당 인증번호
                 를 전송합니다. 이 후 전송된 값과 입력값이 같으면 이메일 인증이 완료됩니다.

                 3. 휴대폰 인증시 : 유효성검사를 통하여 '000-0000-0000- 의 형태의 휴대폰번호만 입력하게 해놓았으며 카페24에
                 SMS보내기 api를 사용하여 랜덤값으로 6자리 숫자를 만든뒤 해당 휴대폰번호로 전송합니다. 이후 만들어진 인증번호와
                 입력된 인증번호가 일치하면 휴대폰 인증이 완료됩니다.

        
         2019-02-16 설명란 미완 추후수정

	개인정보 수정 및 본인이 작성한 글 및 구매목록확인	: 로그인한 상태에서 마이페이지에 접속하면 본인의 개인정보를 수정가능하며 본인이 작성한 글과 구매목록을 확인할 수 있습니다.
	게시판 구현	일반게시판 및 자료실게시판 : 글쓰기,수정,삭제 기능이 가능하며 답변달기 기능이 가능합니다. 검색기능과 페이징처리를 하였으며 커뮤니티에 들어가서 확인할 수 있습니다.  커뮤니티에는 일반 게시판과 + 자료실을 같이 사용할수 있습니다. 파일 업로드 및 다운로드에서는 multipartRequest를 사용하였고,  각 글에 댓글갯수와 파일이있으면 파일 아이콘을 보여줘서 파일다운로드가 가능함을 알려주고있습니다.각 게시판에 들어가면 해당 게시물에대한 댓글목록을 볼 수 있고로그인을  한 상태라면  댓글작성이 가능합니다.
	상품게시판(이미지) :  각 카테고리의 맞는 상품들을 보여주는 게시판입니다. 상품 등록시 로그인을 해야하며 이미지 파일에 정규식조건을 걸어 이미지파일이 아니면 업로드가 되지 않습니다.  그리고 Product테이블에 이미지 경로를 넣어 각 상품의 이미지를 보여 줄수 있게 만들었습니다. 
	장바구니 구현	로그인시 해당 id값+basket이라는 이름으로 application영역에 장바구니를 만들었습니다. 각 장바구니에 구매하기를 누르면 장바구니에 담긴 상품들이 Buyer테이블에 들어가며 장바구니가 비워집니다.


	사용언어 : JAVA1.8, JavaScript, Jquery, Ajaxm
	사용 api : 네이버스마트에디터, CAFE24(문자보내기), 다음 주소찾기


	● 개발환경 
	OS/DB/Tools/ETC : Windows / MYSQL / Eclipse / HTML&CSS B , 
	다음 주소검색 API, 네이버스마트에디터, 구글 이메일보내기, cafe24의 SMS보내기 api
　
	● DB ERD 
	
![ERD](https://user-images.githubusercontent.com/45536211/52761430-ba27c500-3056-11e9-8da2-ac7d1f8fa530.png)

<br>
<br>

<details>
	<summary><h1>클릭하시면 쇼핑몰 이미지가 나옵니다.</h1></summary>
<div markdown="1">

<br>
<br>

	● 메인페이지
	
![메인이미지](https://user-images.githubusercontent.com/45536211/52777052-4a313300-3086-11e9-8ce6-a4d575de3e18.jpg)

	//메인페이지 화면입니다 카테고리별로 상품을 보거나 전체페이지로 이동이 가능합니다.

　
	● 회원가입 페이지입니다.
	
![회원가입](https://user-images.githubusercontent.com/45536211/52799325-ef66fe00-30bc-11e9-8d03-7284aaadeed6.jpg)

	//각 요효성 은 이렇습니다.
	ID : 영문대,소문자 , 숫자 4 ~12 자리 (정규식 사용)
	비밀번호 :(대문자+소문자) + 숫자 + 특수문자 가 섞인 8~15자리의 수 (정규식 사용)
	이름 : 한글처리만 가능 (정규식 사용)
	이메일 : input type을 email로 지정
	휴대폰 : 숫자3자리 - 숫자4자리 - 숫자3자리 (정규식사용) 
	주민번호 : input태그 속성에 maxlength제한 설정
	주소 : 비어있는 값이 있으면 안됨
	
　
	● 이메일인증
	
![이메일인증](https://user-images.githubusercontent.com/45536211/52792834-a8bed700-30af-11e9-9bf8-a8f97ef3218d.jpg)

	//구글 Gmail을 사용했습니다.
 　

	● 휴대폰인증
	
![휴대폰인증](https://user-images.githubusercontent.com/45536211/52792845-b07e7b80-30af-11e9-8474-39b83f6b08f8.jpg)

	//cafe24의 sms보내기 api를 사용하여 Random으로 6자리를 만들어 해당 휴대폰번호로 전송했습니다.
	//이후 랜덤숫자와 입력한 숫자가 맞으면 인증이 가능하게 만들었습니다.
　

	● 주소인증
	
![주소인증](https://user-images.githubusercontent.com/45536211/52792839-abb9c780-30af-11e9-9035-203691f83731.jpg)

	//다음 주소찾기 api를 사용하여 만들었습니다.
　

	● 로그인페이지
	
![로그인](https://user-images.githubusercontent.com/45536211/52790946-26341880-30ab-11e9-87a3-7cace4f40cc1.jpg)

	//로그인이 성공적으로 이루어졌으면 로그인 정보를 세션에 저장합니다.
　

	● 커뮤니티 메인페이지
	
![커뮤니티 메인](https://user-images.githubusercontent.com/45536211/52778302-0b50ac80-3089-11e9-879d-c4f1f0b57ecf.jpg)

	//커뮤니티 페이지 메인 화면입니다.
　	

	● 검색기능
	
![검색기능](https://user-images.githubusercontent.com/45536211/52778708-f88aa780-3089-11e9-92db-9cccbebc2b14.jpg)

	//검색기능을 구현하였습니다. 해당 조건과 검색어를 전달받아 검색한 화면입니다.
　

	● 페이징처리
	
![페이징처리](https://user-images.githubusercontent.com/45536211/52779016-a7c77e80-308a-11e9-991d-0d9d632994e8.jpg)

	// 페이지를 클릭할때마다 get방식으로 현재페이지 번호와 페이지 블럭(한페이지당 보여줄페이지)를 
	전달하여 페이징 처리하였습니다.
　

	● 글쓰기 페이지

![글쓰기페이지](https://user-images.githubusercontent.com/45536211/52780743-41dcf600-308e-11e9-94d5-2581f357b40b.jpg)

	// 유효성검사를 실시하고 통과하면
	　
	
![글작성완료](https://user-images.githubusercontent.com/45536211/52781100-13134f80-308f-11e9-8119-3a8f64eeb4e8.jpg)

	//사진과 같이 글이 등록됨을 확인 할 수 있습니다.

　
	● 글보기 페이지입니다.
	
![글보기페이지](https://user-images.githubusercontent.com/45536211/52781607-54582f00-3090-11e9-802e-538ed8efebba.jpg)

	// 추천하기 버튼을 누르면
　

![추천확인](https://user-images.githubusercontent.com/45536211/52781844-ebbd8200-3090-11e9-8f1f-b8975741478b.jpg)

	// 추천이 되었음을 확인 할 수 있습니다.
　	

	● 파일 다운로드
![파일 다운로드](https://user-images.githubusercontent.com/45536211/52783414-2a553b80-3095-11e9-99ea-2f867bca6779.jpg)

	//시간을 보시면 파일이 성공적으로 다운로드 됬음을 확인할수 있습니다.
	
　
	● 댓글남기기
![댓글관련](https://user-images.githubusercontent.com/45536211/52783606-c121f800-3095-11e9-9314-01b2bc23841a.jpg)

	// 위사진과 같이 댓글을 남기면 댓글목록에 댓글이 출력됩니다.
	// 댓글역시 본인인지 확인하여 수정/삭제가 가능합니다.
　
	● 게시글수정
![게시글수정](https://user-images.githubusercontent.com/45536211/52783812-663cd080-3096-11e9-8423-88f250a23592.jpg)

	// 게시글 수정폼입니다. 이곳역시 정규식이 모두 걸려있습니다.
	

![게시글수정완료](https://user-images.githubusercontent.com/45536211/52783890-b451d400-3096-11e9-93bd-be723ee58549.jpg)

	//게시글이 수정되었다는 알람과 확인을 누르면 게시글이 수정됨을 확인할수 있습니다.
　
	● 답글달기
![답글달기](https://user-images.githubusercontent.com/45536211/52784010-127eb700-3097-11e9-9882-e98d28df6e1c.jpg)

	//답변달기 폼입니다. 이후 확인을 누르면 
	

![답글달기완료](https://user-images.githubusercontent.com/45536211/52784127-6ab5b900-3097-11e9-8df8-d043de73d517.jpg)

	//들여쓰기를 통해 답글이 달렸음을 확인 할 수 있습니다.
	
　
	● 글삭제
![글삭제](https://user-images.githubusercontent.com/45536211/52784232-c2542480-3097-11e9-9087-0cbb952dbc5a.jpg)

	//글이 삭제됨을 알 수 있습니다.
	//댓글역시 이와같은 형태로 수정/삭제가 가능합니다.

　
	● 상위카테고리 눌렀을때
![shop](https://user-images.githubusercontent.com/45536211/52852456-fe50bd80-315b-11e9-8c15-90feb45d861b.jpg)

	// 하위 카테고리를 누르지않곳 상위카테고리만 눌렀을때 해당
	// 카테고리의 모든 상품들을 보여줍니다.
	

	● 하위카테고리 눌렀을때	　
![하위카테고리](https://user-images.githubusercontent.com/45536211/52852501-204a4000-315c-11e9-950e-5d0bfd826512.jpg)

	//하위카테고리를 누르면 해당 카테고리의 대한 정보들을 보여줍니다.

　
	● 상품등록폼
![상품등록폼](https://user-images.githubusercontent.com/45536211/52852462-04df3500-315c-11e9-9550-06f083000fc3.jpg)

	//상위카테고리 선택시 하위카테고리가 자동으로바뀜
	이미지의 정규식을 걸어 이미지파일 (png, jpg, jpeg)만 	올라가게설정했습니다.!

	
	
![상품등록완료](https://user-images.githubusercontent.com/45536211/52852495-1d4f4f80-315c-11e9-9e7f-be8d24576f0f.jpg)

	//상품이 등록됨을 확인할수 있습니다.
　
	● 상품보기
![상품보기](https://user-images.githubusercontent.com/45536211/52852525-30fab600-315c-11e9-80cd-35cf4fe7cb03.jpg)

	//상품을 누르면 해당 상품의 대한 정보가 나오며 수량을 입력후
	//장바구니에 담으면 장바구니에 해당 상품의 대한 정보가 보입니다.
	//보고있는 상품과 같은 카테고리의 상품들을 관련상품들에 보여줍니다.
	
　
	● 장바구니목록
![장바구니목록](https://user-images.githubusercontent.com/45536211/52854054-ab2d3980-3160-11e9-884a-ec3d5177bb99.jpg)

	//장바구니에 담은 목록들을 보여줍니다.
	//구매하기 버튼을 누르면 구매가 완료되며 마이페이지에서 확인이 가능합니다
	
　
	● 마이페이지[개인정보수정]
![개인정보](https://user-images.githubusercontent.com/45536211/52854045-a5cfef00-3160-11e9-842f-f4b56ea97e28.jpg)

	//이메일과 휴대폰은 다시 인증을 해야만 바꿀수 있습니다.
　
	● 마이페이지[내가쓴글보기]
![내가쓴글목록](https://user-images.githubusercontent.com/45536211/52854285-50481200-3161-11e9-92bf-d0dea5444b5c.jpg)

	//로그인한 유저가 작성한 글목록을 보여줍니다. 여기도 페이징
	//처리하였습니다.
　	
	● 마이페이지[구매목록]
![구매목록](https://user-images.githubusercontent.com/45536211/52853946-699c8e80-3160-11e9-95e1-63c1e13e42f1.jpg)

	//장바구니에서 결제한 목록들을 볼수있습니다.
	
</div>
</details>
	

	●개발과정
2018/12/02
-> 부트스트랩 템플릿을 가져왔고 디자인 부분수정 후 header와 footer로 영역을 나누고 회원가입 구현(DB연결)

2018/12/03
-> 회원가입 및 로그인 구현(로그인 유효성검사ok 회원가입 x) 세션 및 쿠키전송 ok 로그인 디자인 ok 

2018/12/05
-> 회원가입 로그인 유효성 검사 ok 마이페이지 디자인 및 개인정보 수정 로그아웃 구현 DB 게시판테이블 구현

2018/12/06
-> 게시판 입력 수정 삭제 완료 

2018/12/09 
->product(제품), buyer(구매자) DB생성완료 게시판 답변달기 완료 oracle과 mysql이 조금달라서 햇갈린다...

2018/12/10
-> 게시판 뷰에서 뿌리는데 예외가 발생해서 다시 없애고하니 된다... 4시간동안 해맸다 ㅠㅠ... 게시판 뿌리기, 입력 완료 게시판 입력시 유효성검사ok
-> (이렇게 적으니 내가 뭘했는지 보기힘들다. 내일부터는 표를 그려서 올려야겠다)

2018/12/11
-> DB수정 users 테이블에 level컬럼 추가 -> 판매자와 구매자를 구분! -> 판매자 구매자 회원가입 따로 구현

2018/12/14
-> 페이징 완료, 검색기능 부분 구현, 마이페이지에 내가쓴글 목록 뿌려주기 추가(a링크를 나중에 form태그 hidden으로 전송예정) product DAO,DTO완성
및 View페이지 디자인 

2018/12/15  
->검색기능 커뮤니티에서 완벽구현!!! (메인에있는 검색은 product 완료후 구현예정) 답변달기 구현!! re_group, re_seq depth을 통해구현했음,
댓글달기 구현 및 DB추가  sql파일 참조!! 
-> 예외나고 오류고친다고 오늘 8시간정도했는데 3개기능밖에 못했다. 내일은 자료실 파일(업/다운로드) 메일및 문자, 주소api(다음)을 해야겠다.

2018/12/16
->  댓글 수정 및 삭제 구현 및 이메일인증(구글2단계인증 후 앱 비밀번호 발급 후 사용) 
->  (자바스크립트가 조금 약한거같다. window.open을 사용하여 인증창을 열었는데 다시 값 가져올려하니 opener가 생각이 나지않아 고생했다..)

2018/12/17
-> Register(회원가입)에 정규식을 넣어서 유효성을 좀더 깔끔하게함, 다음 주소찾기 api를 넣어서 좀더 간편히 만듬
-> cafe24에서 SMS서비스신청후 SMS문자인증 기능을 만들었으나.... -> Test에서는 Succes가 성공적으로 이뤄지나
-> 실제로 보낼때에는 -100(서버오류)가 남 내일 완벽구현예정
-> 이제 이미지 갤러리와 자료실(파일다운로드)만 만들면 일반 커뮤니티 사이트의 기본은 다만든것같다.
-> 근데... 쇼핑몰인데 25일까지 상품까지 다 만들지 모르겠다..

2018/12/18
-> SMS인증(아직미완 오류를 찾지못함) 파일업로드 완료(다운로드x)
-> 파일업로드에 따른 board테이블 컬럼추가 file(실제파일경로), filename(클라이언트가올린원본파일이름) 
-> 오늘하면서 DB설계의 중요성을 깨달았다. 나중에 추가하니 dao에 추가하는것을 잊고 한시간동안 왜 null값이 들어가는지 확인했다...
-> SMS인증은 좀더 살펴보고 내일내로 파일업로드는 완료해야겠다.

2018/12/19
->SMS인증(미완)... 다른거 찾느라 잊어버렸다..
->파일업로드 및 다운로드 완료! 기존comunity.jsp에 파일업로드/다운로드를 추가했다.
->comunity.jsp에 댓글수와 파일이있으면 파일아이콘을 표시해줬다
->상품등록 폼과 등록하는 기능을 만들었다. 내일 상품사진들로 보이는 이미지갤러리를 만들고 요번주말까지 완성도를 올려야겠다.
*ajax를 배웠다. 비동기방식으로 속도문제로 많이쓰인다고하니 올려놓고 공부해야겠다.
-> JSON형태로 데이터를 받아왔다. https://marobiana.tistory.com/77 사이트를 참조했다.

2018/12/20
->SMS인증(미완)... cafe24 좀 큰회사에 api인데도 구글링에 정보가 나오지않는다. 주말에 okky.kr <- jsp커뮤니티사이트 에서 글을 올려봐야겠다.
->파일업로드 및 다운로드 완료 <- 12/19에 경로관련해서 문제가 생겨서 수정했다. 
->이미지 갤러리를 완성했다. (WebContent/product)에서 확인할수있다. -> 경로지정하는게 좀 어려웠다.
->남은것 : 상품관련 폼에 유효성검사 부분, 댓글 작성 수정 및 이메일,휴대폰(아직미완)에 ajax처리, 가입시 판매자(기본폼+이메일+휴대폰), 
구매자(기본폼+이메일) 나누는것 현재 내 DB ERD다이어그램 그려보기, 장바구니 정도가 남은거같다. 주말안에 다해야겠다.

2018/12/22
->SMS문자보내기 완료(인증은 아직미완) 상품관련 폼 유효성검사 OK 오늘로 큰틀은 전부 다한거같다
->이제 12/20에 적힌것들 하나하나씩 하면서 작은 것들을 해봐야겠다.

2018/12/23
->SMS문자보내기 인증까지 완료 (확인됨) 이로써 모든기능이 끝났다. 테이블 및 컬럼이 추가되면서 DTO나 DAO에 누락된 부분이있는데 추가로 넣어주었다.
-> 25일까지 마무리 짓고 모델1은 끝내야겠다.

2018/12/25
-> 장바구니 구현완료 웹브라우저가 닫히더라도 장바구니에는 계속 유지가 되어야하기때문에 application영역에 저장시켜주었다. 

2018/01/01
->전체 완료



-아쉬웠던점 : 맨처음 DB를 설계할떄 꼼꼼히 하지않아 중간중간 DB를 다시 만들었다 -> 그 때문에 코드수정을 많이해야해서 시간을 많이 소비했다. 아임포트 결제 api를 찾았지만 시간부족으로 하지못했다. 다시 넣어보고싶다.

-느낀점     : 맨처음 독학을 한 후 학원에와서 공부를 배웠을때 실력향상이 된다고 느꼈는데. 이번 포트폴리오를 만들면서 전체적으로 복습(특히 Jquery)
            을 했고 수업때 배운것을 다시 혼자 힘으로 만드니 생각보다 실력이 부족하다고 느꼈다. 이번 프로젝트를 진행하면서 부족한점(JAVA문법 등)을
            다시 공부할수 있어서 좋았다.
            
          

