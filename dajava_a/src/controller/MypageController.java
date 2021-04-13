package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import service.BmypageDao;
import service.MypageDao;
import service.MypageVo;
import service.OrderDto;
import service.PointVo;
import service.QaDto;
import service.ReviewDto;

@WebServlet("/MypageController")
public class MypageController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	
		
		String uri = request.getRequestURI();          
		int len = request.getContextPath().length();   
		String str = uri.substring(len);   
	
		if (str.equals("/mypage/memberjoin.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/join_login/join.jsp");
			rd.forward(request, response); //데이터값 갖고
		 
		}else if (str.equals("/mypage/memberjoinAction.do")) {
			
			request.setCharacterEncoding("UTF-8");
						
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");
			String birthday = request.getParameter("birthday");
			int birthday2 = Integer.parseInt(birthday);
		
			MypageDao md = new MypageDao();	
			md.memberInsert(id, password, email, name, phone, addr, birthday2);
			//모든 처리가 끝난후 이동시킨다.
			response.sendRedirect(request.getContextPath()+"/"); //데이터값없이
			
		}else if(str.equals("/mypage/memberlogin.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/join_login/mlogin.jsp");
			rd.forward(request, response);
		}else if(str.equals("/mypage/memberloginAction.do")) {
			
			
			String id = request.getParameter("id");
			String password = request.getParameter("password");
						
			BmypageDao bpd = new BmypageDao();
			int value = bpd.loginCheck(id, password);
			MypageVo mv =bpd.loginCheck1(id, password);
			HttpSession session = request.getSession();    
			
			if(value>0) {
				session.setAttribute("id", id);
				session.setAttribute("name", mv.getName());
				session.setAttribute("midx", mv.getMidx());
				session.setAttribute("grade", mv.getGrade());
			
				response.sendRedirect(request.getContextPath()+"/");
			}else {
				response.sendRedirect(request.getContextPath()+"/mypage/memberlogin.do");
			}
		}else if(str.equals("/mypage/mypage.do")) {
			
			HttpSession session = request.getSession();  
			String grade= (String) session.getAttribute("grade");
		
			if(grade.equals("G")) {
				response.sendRedirect(request.getContextPath()+"/bmypage/bmyinfo.do");
			}else{
				response.sendRedirect(request.getContextPath()+"/mypage/myinfo.do");
			}
		
		}else if(str.equals("/mypage/memberlogout.do")) {
			HttpSession session = request.getSession(); 
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/");
		}else if(str.equals("/mypage/myinfo.do")) {
			
			HttpSession session = request.getSession();  
			int midx = (int) session.getAttribute("midx");
			
			MypageDao md = new MypageDao();                    
			MypageVo mv = md.memberSelectOneInfo(midx);
		
			request.setAttribute("mv",mv);                   
			
			RequestDispatcher rd =request.getRequestDispatcher("/GmyPage/myinfo.jsp");     
			rd.forward(request, response);
			
		}else if (str.equals("/mypage/infoModify.do")) {

			HttpSession session = request.getSession();  
			int midx = (int) session.getAttribute("midx");
			
			MypageDao md = new MypageDao();                    
			MypageVo mv = md.memberSelectOneInfo(midx);
			
			request.setAttribute("mv",mv); 
			
			RequestDispatcher rd = request.getRequestDispatcher("/GmyPage/infoModify.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/mypage/infoModifyAction.do")){
			String midx = request.getParameter("midx");
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");
			
			BmypageDao bmd = new BmypageDao();
										
			bmd.infoModify(id,email,password,phone,addr,midx);
			
			response.sendRedirect(request.getContextPath()+"/mypage/myinfo.do");
		}else if(str.equals("/mypage/reserve_past.do")) {
			
			HttpSession session = request.getSession();  
			int midx = (int) session.getAttribute("midx");
			
			MypageDao md = new MypageDao();
			ArrayList<OrderDto> alist = md.reservePast(midx);
			
			request.setAttribute("alist",alist); 
			
			RequestDispatcher rd =request.getRequestDispatcher("/GmyPage/reserve_past.jsp");     
			rd.forward(request, response);
			
		}else if(str.equals("/mypage/reserve_pres.do")) {
			
			HttpSession session = request.getSession();  
			int midx = (int) session.getAttribute("midx");
			
			MypageDao md = new MypageDao();
			ArrayList<OrderDto> alist = md.reservePres(midx);
			
			request.setAttribute("alist",alist); 
			
			RequestDispatcher rd =request.getRequestDispatcher("/GmyPage/reserve_pres.jsp");     
			rd.forward(request, response);
			
		}else if(str.equals("/mypage/orderState.do")) {
			
			String oidx = request.getParameter("oidx");
			int oidx2 = Integer.parseInt(oidx);
			
			BmypageDao bmd = new BmypageDao();					
			bmd.ostateModify(oidx2);
			
			response.sendRedirect(request.getContextPath()+"/mypage/reserve_pres.do");
		}else if(str.equals("/mypage/reserve_canc.do")) {
			
			HttpSession session = request.getSession();  
			int midx = (int) session.getAttribute("midx");
			
			MypageDao md = new MypageDao();
			ArrayList<OrderDto> alist = md.reserveCanc(midx);
			
			request.setAttribute("alist",alist); 
			
			RequestDispatcher rd =request.getRequestDispatcher("/GmyPage/reserve_canc.jsp");     
			rd.forward(request, response);  //값을넘길때는 forward
			
		}else if(str.equals("/mypage/point.do")) {
			
			HttpSession session = request.getSession();  
			int midx = (int) session.getAttribute("midx");
			
			MypageDao md = new MypageDao();                    
			ArrayList<PointVo> alist = md.pointMine(midx);
		
			request.setAttribute("alist",alist);
					
			RequestDispatcher rd =request.getRequestDispatcher("/GmyPage/point.jsp");     
			rd.forward(request, response);
			
		}else if(str.equals("/mypage/myreview.do")) {
			
			HttpSession session = request.getSession(); 
			int midx = (int) session.getAttribute("midx");
			String reidx = request.getParameter("reidx");
			  
			MypageDao md = new MypageDao();  
			ArrayList<ReviewDto> alist = md.reviewMine(midx,reidx);
			
			request.setAttribute("alist",alist);              
			
			RequestDispatcher rd =request.getRequestDispatcher("/GmyPage/myreview.jsp");     
			rd.forward(request, response);
			
		}else if(str.equals("/mypage/myqa.do")) {
			
			HttpSession session = request.getSession();  
			int midx = (int) session.getAttribute("midx");
			  
			MypageDao md = new MypageDao();  
			ArrayList<QaDto> alist = md.qaMine(midx);
			
			request.setAttribute("alist",alist);  
			RequestDispatcher rd =request.getRequestDispatcher("/GmyPage/myqa.jsp");     
			rd.forward(request, response);
			
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
