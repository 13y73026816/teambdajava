package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.PageMaker;
import domain.SearchCriteria;
import service.BmypageDao;
import service.MypageDao;
import service.MypageVo;
import service.OrderDto;
import service.RoomVo;

@WebServlet("/PathController")
public class PathController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public PathController() {
        super();
       
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	
		
		String uri = request.getRequestURI();          
		int len = request.getContextPath().length();   
		String str = uri.substring(len);   
		
		if (str.equals("/path/outside.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/outside.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/map.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/map.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/room1.do")) {
			
			String roomnum="A 101";
			MypageDao md = new MypageDao(); 
			ArrayList<OrderDto> alist = md.orderSelectAll(roomnum);       
			request.setAttribute("alist",alist); 
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/room1.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/room2.do")) {
			
			String roomnum="A 102";
			MypageDao md = new MypageDao(); 
			ArrayList<OrderDto> alist = md.orderSelectAll(roomnum);       
			request.setAttribute("alist",alist); 			
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/room2.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/room3.do")) {
			
			String roomnum="A 201";
			MypageDao md = new MypageDao(); 
			ArrayList<OrderDto> alist = md.orderSelectAll(roomnum);       
			request.setAttribute("alist",alist); 			
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/room3.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/room4.do")) {
			
			String roomnum="A 202";
			MypageDao md = new MypageDao(); 
			ArrayList<OrderDto> alist = md.orderSelectAll(roomnum);       
			request.setAttribute("alist",alist); 			
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/room4.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/room5.do")) {
			
			String roomnum="C 101";
			MypageDao md = new MypageDao(); 
			ArrayList<OrderDto> alist = md.orderSelectAll(roomnum);       
			request.setAttribute("alist",alist); 			
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/room5.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/room6.do")) {
			
			String roomnum="C 102";
			MypageDao md = new MypageDao(); 
			ArrayList<OrderDto> alist = md.orderSelectAll(roomnum);       
			request.setAttribute("alist",alist); 			
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/room6.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/room7.do")) {
			
			String roomnum="C 201";
			MypageDao md = new MypageDao(); 
			ArrayList<OrderDto> alist = md.orderSelectAll(roomnum);       
			request.setAttribute("alist",alist); 			
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/room7.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/room8.do")) {
			
			String roomnum="C 202";
			MypageDao md = new MypageDao(); 
			ArrayList<OrderDto> alist = md.orderSelectAll(roomnum);       
			request.setAttribute("alist",alist); 			
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/room8.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/room9.do")) {
			
			String roomnum="본관101";
			MypageDao md = new MypageDao(); 
			ArrayList<OrderDto> alist = md.orderSelectAll(roomnum);       
			request.setAttribute("alist",alist); 			
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/room9.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/room10.do")) {
			
			String roomnum="황토방1";
			MypageDao md = new MypageDao(); 
			ArrayList<OrderDto> alist = md.orderSelectAll(roomnum);       
			request.setAttribute("alist",alist); 			
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/room10.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/room11.do")) {
			
			String roomnum="황토방2";
			MypageDao md = new MypageDao(); 
			ArrayList<OrderDto> alist = md.orderSelectAll(roomnum);       
			request.setAttribute("alist",alist); 			
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/room11.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/special1.do")) {
			
			request.setAttribute("focus", "sp01");
			RequestDispatcher rd = request.getRequestDispatcher("/main/special.jsp");
			rd.forward(request, response);
			
		}else if (str.equals("/path/special2.do")) {
			
			request.setAttribute("focus", "sp02");
			RequestDispatcher rd = request.getRequestDispatcher("/main/special.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/special3.do")) {
			
			request.setAttribute("focus", "sp03");
			RequestDispatcher rd = request.getRequestDispatcher("/main/special.jsp3");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/special4.do")) {
			
			request.setAttribute("focus", "sp04");
			RequestDispatcher rd = request.getRequestDispatcher("/main/special.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/special5.do")) {
			
			request.setAttribute("focus", "sp05");
			RequestDispatcher rd = request.getRequestDispatcher("/main/special.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/special6.do")) {
			
			request.setAttribute("focus", "sp06");
			RequestDispatcher rd = request.getRequestDispatcher("/main/special.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/travel.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/travel.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/info_res.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/community/info_res.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/mycar.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/mycar.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/pub_trans.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/pub_trans.jsp");
			rd.forward(request, response);
		 
		}else if (str.equals("/path/index.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		 
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
