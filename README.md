# Personal-portfolio
개인포트폴리오 저장공간

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

2018/12/20
->SMS인증(미완)... cafe24 좀 큰회사에 api인데도 구글링에 정보가 나오지않는다. 주말에 okky.kr <- jsp커뮤니티사이트 에서 글을 올려봐야겠다.
->파일업로드 및 다운로드 완료 <- 12/19에 경로관련해서 문제가 좀생겨서 수정했다. 
->이미지 갤러리를 완성했다. (WebContent/product)에서 확인할수있다. -> 경로지정하는게 좀 어려웠다.
->남은것 : 상품관련 폼에 유효성검사 부분, 댓글 작성 수정 및 이메일,휴대폰(아직미완)에 ajax처리, 가입시 판매자(기본폼+이메일+휴대폰), 
구매자(기본폼+이메일) 나누는것 현재 내 DB ERD다이어그램 그려보기, 장바구니 정도가 남은거같다. 주말안에 다해야겠다.

2018/12/22
->SMS문자보내기 완료(인증은 아직미완) 상품관련 폼 유효성검사 OK 오늘로 큰틀은 전부 다한거같다
->이제 12/20에 적힌것들 하나하나씩 하면서 작은 것들을 해봐야겠다.

2018/12/23
->SMS문자보내기 인증까지 완료 (확인됨) 이로써 모든기능이 끝났다. 테이블 및 컬럼이 추가되면서 조금 수정해야할곳이있는데
-> 25일까지 마무리 짓고 모델1은 끝내야겠다.
