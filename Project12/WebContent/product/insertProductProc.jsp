<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="dto.ProductDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%-- 이미지를 올려야 하기 때문에 multipart로받음--%>
    /*	***현재 내 노트북 경로에 한글이 들어가있어서 경로로인식하지않는다. 그래서 절대경로를 지정했다. 
    
    	★★
    
    	
    	ServletContext context =request.getServletContext(); //현재 프로젝트의 컨텍스트를 가져옴 server.xml확인
    	String realPath = context.getRealPath("File"); //이클립스에있는 가상경로로 실제파일이 업로드되는 경로를 알수있음
    	//가상경로 /File
    	//현재 내 실제저장되는 경로인데. 톰캣경로가아닌 workspace.meta폴더안으로 되어있다. 
    	System.out.println(realPath);
   	*/
    <%
    	
    	ServletContext context = request.getServletContext();
    	String path = context.getRealPath("/product/imgs");
  		System.out.println(path);
    	String image = "";
    	int max = 50 * 1024 * 1024;
    	MultipartRequest multi = new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
    	
    	ProductDto dto = new ProductDto();
    	dto.setPa_category(multi.getParameter("pa_category"));
    	dto.setCh_category(Integer.parseInt(multi.getParameter("ch_category")));
    	dto.setContent(multi.getParameter("content"));
    	dto.setName(multi.getParameter("name"));
    	dto.setPrice(Integer.parseInt(multi.getParameter("price")));
    	dto.setStock(Integer.parseInt(multi.getParameter("stock")));
    	dto.setId(multi.getParameter("id"));
    	//이미지를 제외한 나머지 값들 저장
    	
    	Enumeration e = multi.getFileNames();
    	
    	File file=null;	//자꾸파일이 자동삭제되니빡친다. 잠깐저장될때
    	// 내이클립스 경로로 파일을 업로드시키자 
    	FileOutputStream output=null;
    	if(e.hasMoreElements()){
    		String name = (String)e.nextElement();
    		image = multi.getFilesystemName(name);
    		file = new File(path+"\\"+multi.getFilesystemName(name));
    	//학원경로	
    	output = new FileOutputStream("C:\\jsp\\Project12\\WebContent\\product\\imgs\\"+multi.getFilesystemName(name));
    	//내 노트북 경로
    	// output = new FileOutputStream("D:\\workspace_jsp6\\Project12\\WebContent\\product\\imgs\\"+multi.getFilesystemName(name));	
    	//이클립스경로에 파일생성
    	}
    	
    	//받은 파일을 출력하자
    	FileInputStream input = new FileInputStream(file);
    	int data = 0;
    	try{
    		while((data=input.read())!=-1){
    			output.write(data);
    		}
    	}catch(Exception x){
    		System.out.println("파일출력중 오류"+e);
    	}finally{
    		output.close();
    		input.close();
    	}
    	
    	dto.setImage(image);
    	
    	ProductDao dao = new ProductDao();
    	
    	dao.insertProduct(dto);
    %>
    
    <script>
    	alert('상품등록하였습니다.');
    	location.href="shop.jsp";
    </script>