package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.jrockit.jfr.RequestDelegate;

import db.CarDAO;
import db.CarListBean;

//전체 차량 보기 검색 버튼을 클릭 했을떄.. 클라이언트의 요청을 받는 서블릿 클래스 이다 
@WebServlet("/CarListController.do")
public class CarListController extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//전체 차량 보기 검색 
		//-데이터베이스에 접근하기 위한 Model객체 생성(CarDAO)
		CarDAO cdao = new CarDAO();
		
		//실제 데이터베이스에 접근하여 모든 차량 정보를 검색해서 리턴 
		Vector<CarListBean> v = cdao.getAllCarList();//응답결과데이터 백터
		
		//CarList.jsp화면에 보여질 뷰페이지로 이동시킬때.. 응답데이터를 전달하기 위해..request영역에 응답데이터 담기
		request.setAttribute("vector", v);
		
		
		RequestDispatcher dis = 
					request.getRequestDispatcher("CarMain.jsp?center=CarList.jsp");
		dis.forward(request, response);
		
				
	}	
	

}








