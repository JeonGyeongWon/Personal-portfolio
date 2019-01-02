package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CarDAO;
import db.CarOrderBean;


@WebServlet("/CarOrderController.do")
public class CarOrderController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	//get방식 또는 post방식의 요청이 들어오면 호출되는 메소드
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//CarOrder.jsp에서 전달한 예약정보를 DTO에 저장
		CarOrderBean cbean=new CarOrderBean();
		cbean.setCarno(Integer.parseInt(request.getParameter("carno")));
		cbean.setCarqty(Integer.parseInt(request.getParameter("carqty")));
		cbean.setCarreserveday(Integer.parseInt(request.getParameter("carreserveday")));
		cbean.setCarbegindate(request.getParameter("carbegindate"));
		cbean.setCarins(Integer.parseInt(request.getParameter("carins")));
		cbean.setCarwifi(Integer.parseInt(request.getParameter("carwifi")));
		cbean.setCarnave(Integer.parseInt(request.getParameter("carnave")));
		cbean.setCarbabyseat(Integer.parseInt(request.getParameter("carbabyseat")));
		cbean.setMemberpass(request.getParameter("memberpass"));
		cbean.setMemberphone(request.getParameter("memberphone"));
		
		//데이터베이스 작업 insert를위한 DAO객체 생성
		CarDAO cdao=new CarDAO();
		cdao.insertCarOrder(cbean);
		
		//예약 성공후 이동할 뷰페이지 지정
		RequestDispatcher dis=
		request.getRequestDispatcher("CarListController.do");
		
		dis.forward(request, response);
		
		
		
		
	}
}
