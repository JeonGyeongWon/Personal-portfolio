package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


//모든 dao에서 사용할 커넥션풀을 설정
public class ConnectionPool {
	
	//커넥션풀에서 커넥션 객체를 주는 메서드
	public Connection getConnection(){
		
		Connection con = null;
		try {
			Context initCtx = new InitialContext();	//톰캣(WAS)에 경로를 가져옴
			DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jspbeginner"); 
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("getConnection에서"+e);
		}
		return con;
	}
	
	public void close(Connection con, PreparedStatement pstmt ,ResultSet rs){
	try{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(con!=null)con.close();
	}catch(Exception e){
		System.out.println("close에서 "+e);
	}
	}
	
}
