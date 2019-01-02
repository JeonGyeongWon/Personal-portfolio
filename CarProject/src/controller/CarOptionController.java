package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CarOrderBean;

/**
 * Servlet implementation class CarOptionController
 */
@WebServlet("/CarOptionController.do")
public class CarOptionController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	//get방식 또는 post방식의 요청이 들어오면 호출되는 메소드
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//carOption.jsp페이지에서 전달한 금액 연산을 위해 request영역에서 요청값 얻기
		int carqty= Integer.parseInt(request.getParameter("carqty")); //대여수량
		int carprice=Integer.parseInt(request.getParameter("carprice")); //대여금액
		int carreserveday=Integer.parseInt(request.getParameter("carreserveday")); //대여날짜
		
		//보험적용 여부 받기= 보험적용 1일이면 값1받기
		//보험적용 여부받기 =보험 미적용이면 값0받기
		int carins=Integer.parseInt(request.getParameter("carins"));
		
		//무선wifi 적용여부 받기 =적용1일이면 값 1받기
		//무선wifi 적용여부받기 =미적용이면 값 0받기
		int carwifi =Integer.parseInt(request.getParameter("carwifi"));
		
		//네비 적용 여부받기 =적용(무료)이면 값 1받기
		//네비 적용 여부받기 =미적용이면 값0 받기
		int carnave=Integer.parseInt(request.getParameter("carnave"));
		
		//베이비시트 적용 여부 받기 =적용 1일이면 값1받기
		//베이비시트 적용 여부 받기 =미적용이면 값 0받기
		int carbabyseat =Integer.parseInt(request.getParameter("carbabyseat"));
		
		//차량 가액 =수량 * 대여기간 * 차량가격
		int totalreserve=carqty*carreserveday*carprice;
		
		//옵션 금액 =각종 옵션에 대여기간과 수량을 곱해서 리턴한값
		int totaloption=((carins*carreserveday)+(carwifi*carreserveday)+(carbabyseat*carreserveday))*10000*carqty;
		
		//CarOrder.jsp쪽으로 선택했던 데이터를 모두 넘겨주어야 함
		//그러기에 앞서.. 위의 caroption.jsp에서 전달한 데이터를 담을 자바빈 클래스 (CarOrderBean.java)를 만들자
		//db패키지에 CarOrderBean.java만들기
		
		CarOrderBean cbean=new CarOrderBean();
		cbean.setCarno(Integer.parseInt(request.getParameter("carno")));
		cbean.setCarqty(carqty);
		cbean.setCarreserveday(carreserveday);
		cbean.setCarins(carins);
		cbean.setCarnave(carnave);
		cbean.setCarbabyseat(carbabyseat);
		cbean.setCarbegindate(request.getParameter("carbegindate"));
		
		//CarOrder.jsp로 데이터를 보내주기위해..request영역에 저장하기
		request.setAttribute("cbean", cbean);
		request.setAttribute("totalreserve", totalreserve);
		request.setAttribute("totaloption", totaloption);
		
		RequestDispatcher dis=
		request.getRequestDispatcher("CarMain.jsp?center=CarOrder.jsp");
		
		dis.forward(request, response);
	}
}
