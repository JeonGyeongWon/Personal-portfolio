package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CarDAO;
import db.CarListBean;

//CarList.jsp페이지에서 차량이미지 하나를 클릭했을때 요청을 받는 서블릿
@WebServlet("/CarInfoController.do")
public class CarInfoController extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//CarList.jsp에서 사용자가 선택한 차번호를 request영역에서 꺼내오기
		int carno=Integer.parseInt(request.getParameter("carno"));
		
		//2.요청값에 의해 DB로부터 응답값을 얻기 (carno에 해당하는 레코드 검색)
		//데이터베이스 작업을 위한 CarDAO객체 생성
		CarDAO cdao=new CarDAO();
		
		//3.carno에 해당하는 레코드를 검색하는 메소드 호출!
		//메소드호출시! 사용자의 요청값인 carno를전달하여 DB에서 검색한 결과를 CarListBean객체에 담아 리턴
		CarListBean bean=cdao.getOneCar(carno);
		
		//4.응답값(CarListBean)객체를 view로 출력하기위해  request영역에 저장
		request.setAttribute("bean", bean);
		
		RequestDispatcher dis=
		request.getRequestDispatcher("CarMain.jsp?center=CarInfo.jsp");
		
		dis.forward(request, response);
	}

}
