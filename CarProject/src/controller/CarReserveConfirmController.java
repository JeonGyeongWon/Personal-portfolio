package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CarConfirmBean;
import db.CarDAO;


/*
 * 
 * CarReserveConfirm.jsp 페이지에서 .. <예약확인>을 하기 위해 입력한 폰번호와 비밀번호를 전달받아
 * DB에 해당하는 레코드가 있는지 검사하는 서블릿 클래스
 * 
 */
@WebServlet("/CarReserveConfirmController.do")
public class CarReserveConfirmController extends HttpServlet{


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberphone = request.getParameter("memberphone");
		String memberpass= request.getParameter("memberpass");
		
		//예약확인(감섹)을 위해 요청값(입력했던 폰번호, 비밀번호)을 이용하여... 검색!
		
		//1. DB작업을 위한 CarDAO 객체 생성
		CarDAO cdao = new CarDAO();
		
		//검색조건 1. 전화번호와 비밀번호를 기준으로 하여 검색
		//검색조건 2. 현재 날짜보다 이전 날짜에 예약한 현황은 보여주지 말아라! 
		
		//2. 예약확인(검색)을 위한 메서드 호출시 ~ 입력했던 폰번호를, 비밀번호를 전달~
		Vector<CarConfirmBean> v = cdao.getAllCarOrder(memberphone,memberpass);
		
		//CarReserveResult.jsp(예약현황을 확인 하는 페이지 View)로...
		//응답데이터를 전달 하기 위해.. request영역에 값 저장
		request.setAttribute("v", v);
		
		RequestDispatcher dis = request.getRequestDispatcher("CarMain.jsp?center=CarReserveResult.jsp");
		dis.forward(request, response);
		
		
	}
	
	
}
