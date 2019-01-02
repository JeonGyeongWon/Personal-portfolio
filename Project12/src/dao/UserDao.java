package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.BasketDto;
import dto.UserDto;
public class UserDao {
	
	ConnectionPool pool = new ConnectionPool();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	
	//회원탈퇴관련
	
	//DB설계가 이상..? 해서 상위테이블인 users의 id값을 지울려면 하위테이블의 foreign key를 모두지워야한다.
	//cascade가 안먹힌다........ 
	public void deleteUser(int no){
		UserDao dao = new UserDao();
		UserDto dto = dao.BringUserInfo(no);
		String sql = "";
		
		String id = dto.getId();
		try{
			con=pool.getConnection();
		sql = "delete from product where id ="+id;
		pstmt=con.prepareStatement(sql);
		pstmt.executeUpdate();
		sql = "delete from board where id ="+id;
		pstmt=con.prepareStatement(sql);
		pstmt.executeUpdate();
		sql = "delete from comment where id="+id;
		pstmt=con.prepareStatement(sql);
		pstmt.executeUpdate();
		sql = "delete from buyer where id="+id;
		pstmt=con.prepareStatement(sql);
		pstmt.executeUpdate();
		sql = "delete from users where no = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("deleteUser에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
	}
	
	//회원가입시 아이디 중복 체크를 확인해줌
	
	public int ckoverLabId(String id) {
		int result = 1;
		String sql = "select * from users where id = ?";
		
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result = 0;
			}
		}catch(Exception e){
			System.out.println("ckoverLabId에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		return result;
	}
	
	//한 개인의 구매목록을 반환하는 메서드
	public ArrayList<BasketDto> bringUserProductInfo(String id){
		ArrayList<BasketDto> list = new ArrayList<BasketDto>();
		String sql = "select u.id, b.price, b.qty, b.name"
				+ " from users u join buyer b on u.id=b.id where u.id = ?";
		
		try{
			con = pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				BasketDto dto = new BasketDto();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setQty(rs.getInt("qty"));
				dto.setPrice(rs.getInt("price"));
				list.add(dto);
			}
			
		}catch(Exception e){
			System.out.println("bringUserProductInfo에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		return list;
	}
	
	
	//회원정보 수정 메서드
	public int UpdateInfo(UserDto dto){
		
		String sql = "update users set id=?, pass=?, name=?, email=?, phoneNumber =? where no = ?";
		int result = 0;
		try{
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhoneNumber());
			pstmt.setInt(6, dto.getNo());
			
			result =pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("UpdateInfo에서" +e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		return result;
	}
	
	//한명의 User정보를 가져옴
	
	public UserDto BringUserInfo(int no){
		
		UserDto dto = new UserDto();
		String sql = "select * from users where no = ?";
		try{
			con=pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setaSSN(rs.getInt("aSSN"));
				dto.setEmail(rs.getString("email"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setNo(rs.getInt("no"));
				dto.setPass(rs.getString("pass"));
				dto.setPhoneNumber(rs.getString("phoneNumber"));
				dto.setpSSN(rs.getInt("pSSN"));
				dto.setLevel(rs.getInt("level"));
				
			}
			
		}catch(Exception e){
			System.out.println("UserDto에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		return dto;
	}
	
	//아이디값을 통해 가져옴 (오버로딩)
	
	public UserDto BringUserInfo(String id){
		
		UserDto dto = new UserDto();
		String sql = "select * from users where id = ?";
		try{
			con=pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setaSSN(rs.getInt("aSSN"));
				dto.setEmail(rs.getString("email"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setNo(rs.getInt("no"));
				dto.setPass(rs.getString("pass"));
				dto.setPhoneNumber(rs.getString("phoneNumber"));
				dto.setpSSN(rs.getInt("pSSN"));
				dto.setLevel(rs.getInt("level"));
				
			}
			
		}catch(Exception e){
			System.out.println("UserDto에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		return dto;
	}
	
	
	//회원가입
	public int InsertRegister(UserDto dto){
		int result = 0;
		String sql = "insert into users(id,pass,name,email,phoneNumber,pSSN,aSSN,level,addr)"
				+ " values(?,?,?,?,?,?,?,?,?)";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhoneNumber());
			pstmt.setInt(6, dto.getpSSN());
			pstmt.setInt(7, dto.getaSSN());
			pstmt.setInt(8, dto.getLevel());
			pstmt.setString(9, dto.getAddr());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("InsertRegister에서 "+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		
		return result;
		
	}
	
	
	//로그인할때 해당정보가 있는지 확인
	//및 세션정보를 확인하여 마이페이지와 장바구니에 보내기위해 회번번호no값도 들고옴
	public UserDto CheckLogin(String id){
		
		UserDto dto = new UserDto();
		String sql="select * from users where id = ?";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));	//pass값비교를위해 저장
				dto.setNo(rs.getInt("no"));
			}
			
		}catch (Exception e){
			System.out.println("CheckLogin에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		return dto;
	}
	
	
	
}
