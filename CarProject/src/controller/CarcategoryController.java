package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CarDAO;
import db.CarListBean;


//CarReservation.jsp화면에서 ...사용자가 소형,중형,대형중에서 선택하고 검색 버튼 요청을 하면 호출되는 서블릿 클래스
@WebServlet("/CarcategoryController.do")
public class CarcategoryController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.요청값 전달 받기
		//CarReservation.jsp에서 사용자가 선택한 소형,중형,대형 중 하나의 값을 먼저 request 영역에서 꺼내오기
		String carcategory =request.getParameter("carcategory");
		
		//System.out.println(carcategory);
		
		//2. 요청값을 전달 받아 요청에 의한 응답값을 생성하기위해 DB작업
		//DB작업을 위한 CarDao객체 생성
		CarDAO cdao =new CarDAO();
		
		//카테고리별 차검색 메소드를 호출하여 검색한 레코드를 저장하고있는 백터객체를 리턴 받기
		Vector<CarListBean> v= cdao.getCartegoryCarList(carcategory);
		
		//3.응답값(벡터)를 view페이지로 전달하여 응답하기 위해 ...request영역에 담기
		request.setAttribute("vector", v);
		
		//4.CarList.jsp페이지로 이동하면서 request영역을 전달
		RequestDispatcher dis=
				request.getRequestDispatcher("CarMain.jsp?center=CarList.jsp");
		
		//실제로 이동시 request영역과 response영역 전달
		dis.forward(request, response);
		
	}

	
	
}
