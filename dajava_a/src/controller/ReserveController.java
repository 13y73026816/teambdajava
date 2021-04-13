package controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import service.OrderDao;
import service.OrderVo;
import service.RoomDao;
import service.RoomVo;


@WebServlet("/ReserverController")
public class ReserveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
request.setCharacterEncoding("UTF-8");
String uri = request.getRequestURI();
int len = request.getContextPath().length();
String str= uri.substring(len);


 if (str.equals("/reserve/reserveState.do")) {

	 RoomDao rd = new RoomDao();
		
		
		ArrayList<RoomVo> room_alist = rd.SelectRoomAll();
		request.setAttribute("room_alist", room_alist); 	
		
		ArrayList<RoomVo> room_alist1 = rd.SelectRoomAll1();
		request.setAttribute("room_alist1", room_alist1); 	
		
		ArrayList<RoomVo> room_alist2 = rd.SelectRoomAll2();
		request.setAttribute("room_alist2", room_alist2); 	
		
		ArrayList<RoomVo> room_alist3 = rd.SelectRoomAll3();
		request.setAttribute("room_alist3", room_alist3); 	
		
		
		
		
		OrderDao od = new OrderDao();
		ArrayList<OrderVo> order_alist = od.SelectOrderAll();
		request.setAttribute("order_alist", order_alist);

		System.out.println(room_alist);
		System.out.println(order_alist);
		
		RequestDispatcher rs = request.getRequestDispatcher("../res_pay/reserve.jsp");
		rs.forward(request, response);	
		
}else if(str.equals("/reserve/reserveConfirm.do")) {
	HttpSession session = request.getSession();
	int midx = (int) session.getAttribute("midx");
	String ostart= request.getParameter("ostart");
	String oend = request.getParameter("oend");
	String[] ridx = request.getParameterValues("ridx");
	String[] person = request.getParameterValues("person");
	String[] totalprice = request.getParameterValues("totalprice");
	String allPrice = request.getParameter("allPrice");	
	
	System.out.println(ostart);	
	System.out.println(oend);
	System.out.println(ridx.length);	
	System.out.println(totalprice.length);	
	System.out.println(allPrice);	
	System.out.println("midx->"+midx);	
	
	int oidx[] = new int[ridx.length];
	for(int i=0; i<ridx.length; i++) {
		System.out.println("ridx->"+ridx[i]);
		System.out.println("person->"+person[i]);
		System.out.println("totalprice->"+totalprice[i]);
		
		OrderDao rd = new OrderDao();	
		int oidxV = rd.orderInsert(midx,ostart,oend,ridx[i],person[i],totalprice[i]); 
		//return 된 oidx가 결국엔 oidxV 
		
		System.out.println(oidxV);	
		//그리고 그 값을 oidx 배열의 i번째에 담아 준다.
		
		oidx[i] += oidxV;			
	}
	
	String oidxArray = Arrays.toString(oidx);
	String totalpriceArray = Arrays.toString(totalprice);
 

	session.setAttribute("allPrice", allPrice);
	session.setAttribute("oidxArray", oidxArray);
	session.setAttribute("totalpriceArray", totalpriceArray);
	
	
	//모든 처리가 끝난후 이동시킨다. 
	RequestDispatcher rs = request.getRequestDispatcher("../res_pay/pay.jsp");
	rs.forward(request, response);	
	
	

}else if(str.equals("/reserve/reservePay.do")) {
	
	
	HttpSession session = request.getSession();
	String oidxArray = (String)session.getAttribute("oidxArray");
	String rep_oidxArray = oidxArray.replace("[", "");
	String rep_oidxArray2 = rep_oidxArray.replace("]", "");
	String rep_oidxArray3 = rep_oidxArray2.replaceAll(" ", "");

	String totalpriceArray = (String)session.getAttribute("totalpriceArray");	
	String rep_totalpriceArray = totalpriceArray.replace("[", "");
	String rep_totalpriceArray2 = rep_totalpriceArray.replace("]", "");
	String rep_totalpriceArray3 = rep_totalpriceArray2.replaceAll(" ", "");
	
	//[number,...] 형태로 되어있는 것을 배열로 바꿈
	String[] oidxArray2 = rep_oidxArray3.split(",");
	String[] totalpriceArray2 = rep_totalpriceArray3.split(",");
	
	String pname = request.getParameter("pname");
	
	for(int i=0; i<oidxArray2.length; i++) {
		System.out.println("oidxArray2->"+oidxArray2[i]);	
		System.out.println("totalpriceArray2->"+totalpriceArray2[i]);	
		double dou_point = Integer.parseInt(totalpriceArray2[i])*0.1;
		int point = Integer.parseInt(String.valueOf(Math.round(dou_point)));

		System.out.println("point->"+point);	

		
		OrderDao rd = new OrderDao();	
		rd.payInsert(oidxArray2[i],pname,point);
		rd.orderUpdate(oidxArray2[i]);
		
	}
	
	//모든 처리가 끝난후 이동시킨다. 
	RequestDispatcher rs = request.getRequestDispatcher("../res_pay/order.jsp");
	rs.forward(request, response);	
	
	}	

}
	
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
