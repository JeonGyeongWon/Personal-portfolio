<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	request.setCharacterEncoding("utf-8");
		
	
   		ServletContext context =request.getServletContext(); //현재 프로젝트의 컨텍스트를 가져옴 server.xml확인
		String realPath = context.getRealPath("board/File"); //이클립스에있는 가상경로로 실제파일이 업로드되는 경로를 알수있음
		//가상경로 /File
		//현재 내 실제저장되는 경로인데. 톰캣경로가아닌 workspace.meta폴더안으로 되어있다. 
		System.out.println(realPath);
    	int max = 50 * 1024 * 1024; //최대용량을 50mb로 잡았음
    	MultipartRequest multi = new MultipartRequest(request,realPath,max,"utf-8",new DefaultFileRenamePolicy());
    	//form태그의 정보를 얻기위한 request, 저장될 경로, 사이즈, 인코딩방식, 이름중복을막아주는객체를 인자로 객체를 생성
    	int no = Integer.parseInt(multi.getParameter("no"));
    	String subject =multi.getParameter("subject");
    	String content =multi.getParameter("content");
    	
    	Enumeration e = multi.getFileNames();
    	String file = null;
    	String filename = null;
    	//업로드할 파일들을 Enumeration객체에 저장
    	while(e.hasMoreElements()){
    		String name = (String)e.nextElement();
    		file = realPath+"/"+multi.getFilesystemName(name);	//서버에 저장되는 파일경로
    		filename = multi.getOriginalFileName(name);			//클라이언트가 올린 파일이름
    		}
    	
    	BoardDao dao = new BoardDao();
    	BoardDto dto = dao.bringBoardInfo(no);
    	dto.setContent(content);
    	dto.setSubject(subject);
    	
    	
    	if(filename == null ){
    		filename ="파일이없습니다";
    	}
    	
    		dto.setFile(file);
    		dto.setFilename(filename);
    		dao.UpdateBoardInfo(dto);
    	%>
    	
    <script>
    	alert("수정되었습니다.");
    	location.href="comunity.jsp";
    </script>
    

    