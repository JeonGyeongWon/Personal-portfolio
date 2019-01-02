package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.ProductDto;

public class ProductDao {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ConnectionPool pool = new ConnectionPool();
	
	
	// 상품목록 
	
	
	// 카테고리의 대한정보를 들고옴 (작은 카테고리까지)
	
	public ArrayList<ProductDto> allSelectedCategoryProduct(String pa_category, int ch_category){
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		String sql = "select * from product where pa_category = ? and ch_category = ?";
		
		try{
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, pa_category);
			pstmt.setInt(2, ch_category);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ProductDto dto = new ProductDto();
				dto.setBestCount(rs.getInt("bestCount"));
				dto.setCh_category(rs.getInt("ch_category"));
				dto.setImage(rs.getString("image"));	//이미지 경로
				dto.setName(rs.getString("name"));
				dto.setNo(rs.getInt("no"));
				dto.setPa_category(rs.getString("pa_category"));
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setSale(rs.getBoolean("sale"));
				
				list.add(dto);
			}
		}catch(Exception e){
			System.out.println("allBringProduct에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		
		return list;
		
	}
	
	
	// 카테고리의 대한정보를 들고옴 (큰 카테고리)
	
	public ArrayList<ProductDto> allSelectedCategoryProduct(String pa_category){
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		String sql = "select * from product where pa_category = ?";
		
		try{
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, pa_category);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ProductDto dto = new ProductDto();
				dto.setBestCount(rs.getInt("bestCount"));
				dto.setCh_category(rs.getInt("ch_category"));
				dto.setImage(rs.getString("image"));	//이미지 경로
				dto.setName(rs.getString("name"));
				dto.setNo(rs.getInt("no"));
				dto.setPa_category(rs.getString("pa_category"));
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setSale(rs.getBoolean("sale"));
				
				list.add(dto);
			}
		}catch(Exception e){
			System.out.println("allBringProduct에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		
		return list;
		
	}
	
	// 한 상품의 대한 정보를 들고옴 
	
	public ProductDto bringProductInfo(int no){
		
		ProductDto dto = new ProductDto();
		String sql = "select * from product where no = ?";
		
		try{
			con = pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto.setBestCount(rs.getInt("bestCount"));
				dto.setCh_category(rs.getInt("ch_category"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setImage(rs.getString("image"));
				dto.setName(rs.getString("name"));
				dto.setNo(rs.getInt("no"));
				dto.setPa_category(rs.getString("pa_category"));
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setSale(rs.getBoolean("sale"));
			}
		}catch(Exception e){
			System.out.println("bringProductInfo에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		
		return dto;
	}
	
	// 상품등록을 하는 메서드
	
	public void insertProduct(ProductDto dto){
		
		String sql = "insert into product(id,name,price,stock,image,bestcount,"
				+ "sale,pa_category,ch_category,content) values(?,?,?,?,?,0,?,?,?,?)";
		
		try{
			con = pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setInt(4, dto.getStock());
			pstmt.setString(5, dto.getImage());
			pstmt.setBoolean(6, dto.isSale());         
			pstmt.setString(7, dto.getPa_category());
			pstmt.setInt(8, dto.getCh_category());
			pstmt.setString(9, dto.getContent());
			
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("insertProduct에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
	}
	
	
	// 상품을 뿌려주는 메서드
	
	public ArrayList<ProductDto> allBringProduct(){
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		String sql = "select * from product order by bestCount asc";
		
		try{
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ProductDto dto = new ProductDto();
				dto.setBestCount(rs.getInt("bestCount"));
				dto.setCh_category(rs.getInt("ch_category"));
				dto.setImage(rs.getString("image"));	//이미지 경로
				dto.setName(rs.getString("name"));
				dto.setNo(rs.getInt("no"));
				dto.setPa_category(rs.getString("pa_category"));
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				dto.setSale(rs.getBoolean("sale"));
				list.add(dto);
			}
		}catch(Exception e){
			System.out.println("allBringProduct에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		
		return list;
		
	}
	
}
