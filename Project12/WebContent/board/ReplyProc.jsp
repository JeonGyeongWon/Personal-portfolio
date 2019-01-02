<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao" %>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	//Replay.jsp에서 답글내용을 작성하고 버튼을 눌렀을때... 전달 받은 데이터 한글처리
	request.setCharacterEncoding("utf-8");
%>

	

<%-- 요청받은 답글내용을 BoardDto객체에 저장 --%>
<jsp:useBean id="dto" class="dto.BoardDto"/>
<%
//"subject id, file
//내노트북과 학원컴터꺼 구분하기 (절대경로) 
	// String realPath = "E:\\upfile"; //학원경로
	// 우리집경로 String realPath = "D:\\upload";
	ServletContext context =request.getServletContext(); //현재 프로젝트의 컨텍스트를 가져옴 server.xml확인
		String realPath = context.getRealPath("board/File");
	int max = 50 * 1024 * 1024; //최대용량을 50mb로 잡았음
	MultipartRequest multi = new MultipartRequest(request,realPath,max,"utf-8",new DefaultFileRenamePolicy());

	BoardDao dao = new BoardDao();
	//BoardDto객체에 추가적으로 답글을 작성한 시간 저장
	String subject = multi.getParameter("subject");
	String id = multi.getParameter("id");
	String content = multi.getParameter("content");
	
	Enumeration e = multi.getFileNames();
	
	String file = null;
	String filename = null;
	//업로드할 파일들을 Enumeration객체에 저장
	while(e.hasMoreElements()){
		String name = (String)e.nextElement();
		file = realPath+"/"+multi.getFilesystemName(name);	//서버에 저장되는 파일경로
		filename = multi.getOriginalFileName(name);			//클라이언트가 올린 파일이름
		}
	
	//Replay.jsp(답변작성 디자인 페이지)에서 등록버튼을 눌렀을때 전달 받은 3개의 값 저장
	int no = Integer.parseInt(multi.getParameter("no"));
	String keyField =multi.getParameter("key");
	String keyWord = multi.getParameter("word");
	String ip = multi.getParameter("ip");
	
	//부모글 num을 전달하여 검색한 부모글에 대한 BoardDto객체 얻기
	BoardDto Parentdto = dao.bringBoardInfo(no);
	
	//부모글에 대한 pos값을 전달하여 .. 부모글보다 큰 pos갓에 1을 더해서 수정한다.
	dao.UpRe_seq(Parentdto);
	
	//답변글에 부모글에 seq,group등을 저장시켜준다
	dto.setRe_group(Parentdto.getRe_group());
	dto.setRe_seq(Parentdto.getRe_seq());
	dto.setDepth(Parentdto.getDepth());
	dto.setContent(content);
	dto.setSubject(subject);
	dto.setId(id);
	dto.setFile(file);
	
	dto.setIp(ip);
	
	if(filename == null ){
		filename ="파일이없습니다";
	}
	dto.setFilename(filename);
	//부모글의 pos, depth, 답글내용을 저장하고 있는 BoardDto객체를 메소드의 매게변수로 전달하여 답변 달기
	
	dao.ReplyBoard(dto);
	
	response.sendRedirect("comunity.jsp");
%>
