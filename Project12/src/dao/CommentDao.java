package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.CommentDto;

public class CommentDao {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	ConnectionPool pool = new ConnectionPool();
	
	
	// 해당댓글을 수정하는 작업
	
	public void updateComment(CommentDto dto){
		String sql = "update comment set content = ?, regdate=null where comment_no = ?";
		
		try{
			con = pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,dto.getContent());
			pstmt.setInt(2, dto.getComment_no());
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("updateComment"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
	}
	
	// 해당댓글의 정보를 가져옴
	
	public CommentDto bringCommentInfo(int comment_no){
		CommentDto dto = new CommentDto();
		String sql = "select * from comment where comment_no = ?";
		
		try{
			con = pool.getConnection();
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, comment_no);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setComment_no(rs.getInt("comment_no"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getTimestamp("regdate"));
			}
		}catch(Exception e){
			System.out.println("bringCommentInfo에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		
		return dto;
	}
	
	// 해당댓글을 삭제하는 기능
	
	public void DeleteComment(int comment_no){
		
		String sql = "delete from comment where comment_no=?";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment_no);
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("DeleteComment에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
	}
	
	// 해당글에 대한 댓글을 추가 하는 기능
	
	public void InsertComment(CommentDto dto){
		String sql = "insert into comment(board_no,id,content,regdate) values(?,?,?,?)";
		try{
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoard_no());
			pstmt.setString(2,dto.getId() );
			pstmt.setString(3, dto.getContent());
			pstmt.setTimestamp(4, dto.getRegdate());
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("InsertComment에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		
		
	}
	
	
	// 해당글에 대한 모든 댓글들을 가져옴 (출력에 필요)
	public ArrayList<CommentDto> allSelectComment(int no){
		ArrayList<CommentDto> list = new ArrayList<CommentDto>();
		
		try {
			String sql = "select * from comment where board_no=?";
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()){
				CommentDto dto = new CommentDto();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setComment_no(rs.getInt("comment_no"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				list.add(dto);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			pool.close(con, pstmt, rs);
		}
		
		return list;
	}
}
