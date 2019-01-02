package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.BasketDto;
import dto.ProductDto;

public class BuyerDao {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ConnectionPool pool = new ConnectionPool();
	
	//상품구매시 정보를 남길 메서드
	
	public void insertBuyerProduct(ArrayList<BasketDto> list){
		String sql = "insert into buyer(id,name,price,qty) values(?,?,?,?)";
		
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			for(int i=0; i<list.size(); i++){
				BasketDto dto = list.get(i);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setInt(4, dto.getQty());
			pstmt.executeUpdate();
			}
		}catch(Exception e){
			System.out.println("insertBuyerProduct에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
	}
	
		
}
