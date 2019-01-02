<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.io.*"%>

<% 
	//�ٿ�ε��� ���� �ѱ۱��� ����
	System.out.print(request.getParameter("path"));
    String path = new String((request.getParameter("path")).getBytes("8859_1"), "UTF-8");
	
    System.out.print(path);
	//���� �ѹ��� �ٰ����� ������+���ϸ�
   
    InputStream in = null;
	//���������� �о���� input��Ʈ��
    OutputStream os = null;
	//������ �ٿ�ε峻���� output��Ʈ�� 
    File file = null;
	//������ �ø� ������ ������ ���ϰ�ü
    File viewFile = null;
    boolean skip = false;
    String client = "";

    try {
        String fname1 = "";
        String fname2 = "";
        String fname = "";
        fname = path;	//fname�� ������ �о���� ��θ� ����
        fname1 = new String(fname.getBytes("8859_1"), "utf-8");
        //�ѱ������� ��츦 ��� UTF-8�κ���

        try {
            file = new File(fname);	//���� path��ο��ִ� ������ ���ϰ�ü�� ����
            viewFile = new File(fname1);	//����������?
            in = new FileInputStream(file);	//file��ü�� ������ �о�鸲
        } catch (FileNotFoundException fe) {
            skip = true;
        } //catch

        fname2 = new String(fname1.getBytes("utf-8"), "8859_1");
		//fname2�� utf-8���ڵ������ iso-8859-1�� �ٲ��� (ASCII�ڵ嶧��) 	//http://server-talk.tistory.com/183 ���ڵ�,���ڵ������� ��������
        response.reset();
		////���ۿ� �����ϴ� ��� �����Ϳ� ���� �ڵ带 ����
       
		
        client = request.getHeader("User-Agent");
      	//Ŭ���̾�Ʈ�� �ٿ�ε� ��û�� ����� �������� ���� ���
      	
        
       	//MIME�� ��� ���̳ʸ������� ������ �ִ� application�� �ٲ��� -> dll�̳�,xml�� ���������� ��ü������ �д°� ���� 
        response.setContentType("application/x-msdownload;");
        response.setHeader("Content-Description", "JSP Generated Data");

        if (!skip) {
        	//���� ���������� ����κк��� �� �������
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
            //���ۿ� ������ ����� out���尴ü�� body�±� ������ �о 
            // -> �����Ͻ� ������ �ڵ����� ���尴ü�� ��µ� �ٸ� output��Ʈ���� ������� out��ü�� �ߺ��Ǿ� ����������⶧��
            
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


