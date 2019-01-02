<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.io.*"%>

<% 
	//다운로드할 파일 한글깨짐 방지
	System.out.print(request.getParameter("path"));
    String path = new String((request.getParameter("path")).getBytes("8859_1"), "UTF-8");
	
    System.out.print(path);
	//나는 한번에 다가져옴 절대경로+파일명
   
    InputStream in = null;
	//서버파일을 읽어들일 input스트림
    OutputStream os = null;
	//파일을 다운로드내보낼 output스트림 
    File file = null;
	//서버에 올린 파일을 저장할 파일객체
    File viewFile = null;
    boolean skip = false;
    String client = "";

    try {
        String fname1 = "";
        String fname2 = "";
        String fname = "";
        fname = path;	//fname에 파일을 읽어들일 경로를 저장
        fname1 = new String(fname.getBytes("8859_1"), "utf-8");
        //한글파일일 경우를 대비에 UTF-8로변경

        try {
            file = new File(fname);	//맨위 path경로에있는 파일을 파일객체에 저장
            viewFile = new File(fname1);	//보여줄파일?
            in = new FileInputStream(file);	//file객체에 파일을 읽어들림
        } catch (FileNotFoundException fe) {
            skip = true;
        } //catch

        fname2 = new String(fname1.getBytes("utf-8"), "8859_1");
		//fname2에 utf-8인코딩방식을 iso-8859-1로 바꿔줌 (ASCII코드때문) 	//http://server-talk.tistory.com/183 인코딩,디코딩에관한 간략설명
        response.reset();
		////버퍼에 존재하는 모든 데이터와 상태 코드를 지움
       
		
        client = request.getHeader("User-Agent");
      	//클라이언트가 다운로드 요청시 사용한 웹브라우저 정보 얻기
      	
        
       	//MIME을 모든 바이너리파일을 읽을수 있는 application로 바꿔줌 -> dll이나,xml등 웹브라우저가 자체적으로 읽는걸 방지 
        response.setContentType("application/x-msdownload;");
        response.setHeader("Content-Description", "JSP Generated Data");

        if (!skip) {
        	//익플 버전에따른 헤더부분변경 및 헤더설정
            if (client.indexOf("MSIE 5.5") != -1) {
                response.setHeader("Content-Type", "doesn/matter; charset=euc-kr");
                response.setHeader("Content-Disposition",
                        "filename=" + new String(fname.getBytes("utf-8"), "8859_1"));
            } else {
                response.setHeader("Content-Type", "application/octet-stream; charset=euc-kr");
                response.setHeader("Content-Disposition",
                        "attachment; filename=" + new String(fname.getBytes("utf-8"), "8859_1"));
            } //else
            response.setHeader("Content-Transfer-Encoding", "binary;");
            response.setHeader("Content-Length", "" + file.length());
            response.setHeader("Pragma", "no-cache;");
            response.setHeader("Expires", "-1;");
			
            
            out.clear();
            out = pageContext.pushBody();
            //버퍼에 내용을 지우고 out내장객체를 body태그 밖으로 밀어냄 
            // -> 컴파일시 서블릿은 자동으로 내장객체를 얻는데 다른 output스트림을 얻을경우 out객체가 중복되어 오류가생기기때문
            
            os = response.getOutputStream();
            byte b[] = new byte[4096];
            int leng = 0;
            while ((leng = in.read(b)) > 0) {
                os.write(b, 0, leng);
            } //while
        } else {
            out.println("<script language='javascript'>");
            out.println("alert('File Downloading Fail !!');");
            out.println("</script>");
            return;
        } //else
    } catch (Exception e) {
        System.out.println(e);
    } finally {
        if (in != null)
            in.close();
        if (os != null)
            os.close();
    } //finally
%>


