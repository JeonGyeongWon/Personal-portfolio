package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//DB작업을 하는 자바빈 클래스 
public class CarDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//커넥션풀에서 커넥션객체를 얻는 메소드
	public void getCon(){		
		try {
			//WAS서버와 연결된 프로젝트의 모든 정보를 가지고 있는 컨텍스트 객체 얻기
			Context init = new InitialContext();
			//연결된 WAS서버에서 DataSource(커넥션풀 관리 객체) 검색해서 가져오기
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
			//DataSource(커넥션풀)에서 DB와 미리 연결 정보를 가지고 있는 접속 객체 얻기 
			con = ds.getConnection(); //DB접속
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}//getCon()
	
	/*전체 차량 정보를 DB에서 검색하는 메소드 */
	public Vector<CarListBean> getAllCarList(){ //CarListController.java 서블릿 에서 호출하는 메소드 
		
		Vector<CarListBean> v = new Vector<CarListBean>();
		
		//DB로부터 하나의 자동차 정보를 검색해서 가져와서 저장할 CarListBean객체를 저장할 참조변수 선언
		CarListBean bean = null;
		
		try {
			//DB연결
			getCon();
			
			//쿼리 준비 : 전체 차량 검색
			String sql = "select * from carlist";
			
			//쿼리를 실행할 객체 얻기
			pstmt = con.prepareStatement(sql);
			
			//쿼리 실행후 결과를 리턴
			rs = pstmt.executeQuery();
			
			//반복하면서 검색한 자동차 레코드들을  ResultSet객체에서 꺼내서 CarListBean객체에 각각 저장
			while (rs.next()) {
				bean = new CarListBean();
				bean.setCarno(rs.getInt(1));//차번호 
				bean.setCarname(rs.getString(2));//차이름 담기
				bean.setCarcompany(rs.getString(3));//차제조사 이름 담기 
				bean.setCarprice(rs.getInt(4));//차가격 담기 
				bean.setCarusepeople(rs.getInt(5));//차 인승 정보 담기 
				bean.setCarinfo(rs.getString(6));//차정보 담기
				bean.setCarimg(rs.getString(7)); //차량 이미지 명 담기
				bean.setCarcategory(rs.getString(8)); //차종류(대형,소형,중형)중 하나 담기 
				
				v.add(bean); //백터에 CarListBean객체 추가 
			}//while반복 끝
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(con != null){con.close();}
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}//finally
		
		return v; //백터 리턴
		
	}//메소드 끝

	
	/*소형,중형,대형 중 하나를 통해 차량을 검색하기 위한 메소드*/
	public Vector<CarListBean> getCartegoryCarList(String carcategory) {
		
			Vector<CarListBean> v=new Vector<>();
			
			
			try {
				getCon(); //커넥션객체얻기
				String sql="select * from carlist where carcategory=?"; //select 구문만들기
				pstmt=con.prepareStatement(sql); //?를 제외한 나머지 구문을 담고있는 select를실행할 객체 얻기
				pstmt.setString(1, carcategory); //?값 설정하기
				rs=pstmt.executeQuery(); //select 구문 실행하기
				
				while(rs.next()){
					CarListBean dto=new CarListBean();
					
					dto.setCarno(rs.getInt(1));
					dto.setCarname(rs.getString(2));
					dto.setCarcompany(rs.getString(3));
					dto.setCarprice(rs.getInt(4));
					dto.setCarusepeople(rs.getInt(5));
					dto.setCarinfo(rs.getString(6));
					dto.setCarimg(rs.getString(7));
					dto.setCarcategory(rs.getString(8));
					
					v.add(dto);
				}
				//DB접속객체 커넥션풀에 반납
				con.close();
				
			} catch (Exception e) {
				System.out.println("getCartegoryCarList()에서 오류"+e);
			}
			
		return v;
	}

	public CarListBean getOneCar(int carno) {
		
		String sql="select * from carlist where carno=?";
		CarListBean bean=null;
		try {
			getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, carno);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean =new CarListBean();

				bean.setCarno(rs.getInt(1));
				bean.setCarname(rs.getString(2));
				bean.setCarcompany(rs.getString(3));
				bean.setCarprice(rs.getInt(4));
				bean.setCarusepeople(rs.getInt(5));
				bean.setCarinfo(rs.getString(6));
				bean.setCarimg(rs.getString(7));
				bean.setCarcategory(rs.getString(8));
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			try {
				if(con != null){con.close();}
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
				
				
		return bean;
	}

	public void insertCarOrder(CarOrderBean cbBean) {

		try{
			
			//커넥션객체 얻기
			getCon();
			//insert구문 준비
			String sql = "insert into carorder(carno,carqty,carreserveday,"
					+ "carbegindate,carins,carwifi,carnave,carbabyseat,memberphone,memberpass)"
					+ " values(?,?,?,?,?,?,?,?,?,?)";
					
			//?????제외한 insert구문을담은 Preparedstatement(insert실행 객체)
			pstmt = con.prepareStatement(sql);
			
			// ?값 세팅
			pstmt.setInt(1, cbBean.getCarno());
			pstmt.setInt(2, cbBean.getCarqty());
			pstmt.setInt(3, cbBean.getCarreserveday());
			pstmt.setString(4, cbBean.getCarbegindate());
			pstmt.setInt(5, cbBean.getCarins());
			pstmt.setInt(6, cbBean.getCarwifi());
			pstmt.setInt(7, cbBean.getCarnave());
			pstmt.setInt(8, cbBean.getCarbabyseat());
			pstmt.setString(9, cbBean.getMemberphone());
			pstmt.setString(10, cbBean.getMemberpass());
			
			//insert실행
			pstmt.executeUpdate();
			// 커넥션객체를 풀에 반납 
		}catch(Exception e){
			System.out.println("insertCarOrder에서"+e);
		}finally{
			try {
				if(con != null){con.close();}
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	//예약확인페이지 (CarReserveConfirm.jsp)에서 렌트카 예약시 작성한 폰번호와 패스워드에 해당하는 예약주문정보를 검색하기 위한 메서드
	public Vector<CarConfirmBean> getAllCarOrder(String memberphone, String memberpass) {
		// TODO Auto-generated method stub
		Vector<CarConfirmBean> v= new Vector<CarConfirmBean>();
		
		//DB에서 검색한 렌트정보를 저장할 객체를 담을 변수 선언
		CarConfirmBean bean = null;
			
		
		try{
			//DB연결
			getCon();
			
			//SELECT구문 만들기
			//조건 :  에약한 날짜가 현재 날짜보다 크고,
			//		예약시 입력했던 비회원 전화번호와 패스워드에 해당하는 렌트정보를 검색하는데 
			//		carorder테이블과 carlist테이블을 natural조인하여 검색. !!!!!!
			
			String sql = "select * from carorder  natural join carlist  "
					+ "where memberphone = ? and memberpass = ? and str_to_date(carbegindate, '%Y-%m-%d') > now()" ;
			
			// SELECT 문에 *와 같이 별도의 컬럼 순서를 지정하지 않으면...
			// natural join의 기준이 되는컬럼들이 다른 컬럼보다 먼저 출력이 된다.
			// 이때 natural join은 join에 사용된 같은 같은 이름의 컬럼을 중복처리하지않고 하나로 처리 한다.
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberphone);
			pstmt.setString(2, memberpass);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bean = new CarConfirmBean();
				bean.setCarbabyseat(rs.getInt("carbabyseat"));
				bean.setCarbegindate(rs.getString("carbegindate"));
				bean.setCarimg(rs.getString("carimg"));
				bean.setCarins(rs.getInt("carins"));
				bean.setCarname(rs.getString("carname"));
				bean.setCarnave(rs.getInt("carnave"));
				bean.setCarprice(rs.getInt("carprice"));
				bean.setCarqty(rs.getInt("carqty"));
				bean.setCarreserveday(rs.getInt("carreserveday"));
				bean.setCarwifi(rs.getInt("carwifi"));
				bean.setOrderid(rs.getInt("orderid"));
				v.add(bean);
			}
			
		}catch(Exception e){
			System.out.println("getAllCarOrder에서"+e);
		}finally{
			try {
				if(con != null){con.close();}
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return v;
	}
	
}






