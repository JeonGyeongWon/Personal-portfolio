package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.BoardDto;

public class BoardDao {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	ConnectionPool pool = new ConnectionPool();


	
	// 한 게시판을 삭제 했을때 그 게시판에 연결된 댓글들을 모두 지움 
	
	public void deleteBoardComment(int no){
		String sql = "delete from comment where board_no = ?";
		
		try{
			con = pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
			
		}catch(Exception e){
			System.out.println("deleteBoardComment에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
	}
	
	
	// 한 게시판에 적힌 댓글 수를 반환해주는 메서드
	
	public int commentCount(int board_no){
		
		int result = 0;
		String sql = "select count(board_no) from comment where board_no = ?";
		
		try {
			
			con = pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
		
		} catch (Exception e) {
			System.out.println("commentCount에서"+e);
		} finally{
			pool.close(con, pstmt, rs);
		}
		
		return result;
	}
	
	// 추천수를 증가시키는 메서드
	
	public void UpbestCount(int no){
		
		String sql = "update board set bestCount=bestCount+1 where no = ?";
		
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("UpbestCount에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		
	}
	
	
	//  조회수를 증가시키는 메서드
	
	public void Upcount(int no){
		
		String sql = "update board set count=count+1 where no = ?";
		
		try{
			con = pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("Upcount에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
	}
	
	//  한 개시판에 대한 정보를 가져오는 메서드
	
	public BoardDto bringBoardInfo(int no){
		BoardDto dto = new BoardDto();
		String sql = "select * from board where no = ?";
		
		try{
			con = pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto.setBestCount(rs.getInt("bestCount"));
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setDepth(rs.getInt("depth"));
				dto.setId(rs.getString("id"));
				dto.setIp(rs.getString("ip"));
				dto.setNo(rs.getInt("no"));
				dto.setRe_group(rs.getInt("re_group"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setSubject(rs.getString("subject"));
				dto.setFile(rs.getString("file"));
				dto.setFilename(rs.getString("filename"));
			}
		}catch(Exception e){
			System.out.println("bringBoardInfo에서" +e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		
		return dto;
		
	}
	
	//  한 개인이 쓴 모든 게시판정보를 뿌려주는 메서드
	
	public ArrayList<BoardDto> AllbringBoardInfo(String id){
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		
		
		String sql = "select u.id,subject,content,regdate,count from board b join users u on b.id = u.id where u.id = ?";
		
		try{
			con=pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				BoardDto dto = new BoardDto();
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setCount(rs.getInt("count"));
				list.add(dto);
			}
		}catch(Exception e){
			System.out.println("AllbringboardInfo에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		
		
		return list;
	}
	
	// 검색기능이 들어오면 게시판을 뿌려줌 (오버로딩)
	// 자고일나면 이것부터..
	
	public ArrayList<BoardDto> allSelectBoard(String key, String word){
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		
		String sql = "select * from board where "+key+" like '%"+word+"%'" ;
		try{
			con = pool.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				BoardDto dto = new BoardDto();
				dto.setBestCount(rs.getInt("bestCount"));
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setDepth(rs.getInt("depth"));
				dto.setId(rs.getString("id"));
				dto.setIp(rs.getString("ip"));
				dto.setNo(rs.getInt("no"));
				dto.setRe_group(rs.getInt("re_group"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setSubject(rs.getString("subject"));
				list.add(dto);
			}
			
		}catch(Exception e){
			System.out.println("allSelectBoard에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		return list;
	}
	
	//  게시판 글을 뿌려주는 기능 추후 정렬기준을 답변달기이후바꿈
	// 2018-12-15 오키!
	
	public ArrayList<BoardDto> allSelectBoard(){
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		
		String sql = "select * from board order by re_group desc, re_seq asc";
		try{
			con = pool.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				BoardDto dto = new BoardDto();
				dto.setBestCount(rs.getInt("bestCount"));
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setDepth(rs.getInt("depth"));
				dto.setId(rs.getString("id"));
				dto.setIp(rs.getString("ip"));
				dto.setNo(rs.getInt("no"));
				dto.setRe_group(rs.getInt("re_group"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setSubject(rs.getString("subject"));
				dto.setFile(rs.getString("file"));
				dto.setFilename(rs.getString("filename"));
				list.add(dto);
			}
			
		}catch(Exception e){
			System.out.println("allSelectBoard에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		return list;
	}
	
	
	
	//  게시판 글쓰기 기능을 함 
	
	public void InsertBoard(BoardDto dto){
		String sql = "select * from board order by no desc";
		int num=0;
		int re_group=0;
		try{
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
			 re_group = rs.getInt("re_group");
			 num = rs.getInt("no");
			}
			 sql = "insert into board(no,id,subject,content,count,ip,regdate,re_group,re_seq,depth,bestcount,file,filename)"+
						" values(?,?,?,?,0,?,now(),"+(re_group+1)+",0,0,0,?,?)" ;
			 
			 pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, (num+1));
			 pstmt.setString(2, dto.getId());
			 pstmt.setString(3, dto.getSubject());
			 pstmt.setString(4, dto.getContent());
			 pstmt.setString(5, dto.getIp());
			 pstmt.setString(6, dto.getFile());
			 pstmt.setString(7, dto.getFilename());
			 pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("InsertBoard에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
		
	}
	
	//게시판 수정기능을 수행
	// 추후 파일 경로까지 변경
	public void UpdateBoardInfo(BoardDto dto){
		
		String sql = "update board set subject=?,content=?,file=?,filename=? where no = ?";
		
		try{
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3,dto.getFile());
			pstmt.setString(4, dto.getFilename());
			pstmt.setInt(5, dto.getNo());
			pstmt.executeUpdate();
			
			
		}catch(Exception e){
			System.out.println("UpdateBoardInfo에서"+e);
		}finally{
			pool.close(con, pstmt, rs);
		}
				
	}
	//게시판 삭제를 수행하는 메서드
	public void deleteBoard(int no){
		String sql = "delete from board where no = ?";
		try{
			
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		}catch(Exception e){
		System.out.println("deleteBoard"+e);	
		}finally{
			pool.close(con, pstmt, rs);
		}
		
	}
	
	// 같은 그룹내 부모글보다 큰 seq값들에 값을 1증가시킴
		// 부모 dto를 인자값으로 받음
		public void UpRe_seq(BoardDto dto){
			System.out.println(dto.getRe_seq()+1);
			String sql = "update board set re_seq = re_seq+1 where re_group = ? and re_seq > ?";
			try{
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getRe_group());
				pstmt.setInt(2, dto.getRe_seq());
				
				pstmt.executeUpdate();
			}catch(Exception e){
				System.out.print("UpRe_seq에서"+e);
			}finally{
				pool.close(con, pstmt, rs);
			}
		}
		
		// 답변달기 기능 수행
		
		public void ReplyBoard(BoardDto dto){
			String sql = "select * from board order by no desc";
			int num=0;
			try{
				con=pool.getConnection();
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()){
				 num = rs.getInt("no");
				}
				 sql = "insert into board(no,id,subject,content,count,ip,regdate,re_group,re_seq,depth,bestcount,file,filename)"+
							" values(?,?,?,?,0,?,now(),?,?,?,0,?,?)" ;
				 
				 pstmt=con.prepareStatement(sql);
				 pstmt.setInt(1, (num+1));
				 pstmt.setString(2, dto.getId());
				 pstmt.setString(3, dto.getSubject());
				 pstmt.setString(4, dto.getContent());
				 pstmt.setString(5, dto.getIp());
				 pstmt.setInt(6, dto.getRe_group());
				 pstmt.setInt(7, dto.getRe_seq()+1);
				 pstmt.setInt(8, dto.getDepth()+1);
				 pstmt.setString(9, dto.getFile());
				 pstmt.setString(10, dto.getFilename());
				 pstmt.executeUpdate();
			}catch(Exception e){
				System.out.println("InsertBoard에서"+e);
			}finally{
				pool.close(con, pstmt, rs);
			}
			
			
			
		}
		//들여쓰기값만큼 띄워쓰기함.
		public String useDepth(int depth){
			String result="";
			
			//반복문을 이용하여정도 들여쓰기값 지정
			for(int i=0; i<depth*4; i++)
				result += "&nbsp;";
		
				
				return result;
		}
	
}
