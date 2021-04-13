package controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();       
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//가상경로와 같은지 확인한다
		String uri = request.getRequestURI();
		String dajava = request.getContextPath();
		int jarinum = dajava.length();
		String str = uri.substring(jarinum);
		
	//  /board/boardList.do
		
		String[] po = str.split("/");
		String hc = po[1];
		if (hc.equals("mypage")) {			
			MypageController mpc = new MypageController();
			mpc.doGet(request, response);			
		}else if (hc.equals("bmypage")) {			
			BmypageController bpc = new BmypageController();
			bpc.doGet(request, response);			
		}else if (hc.equals("path")) {			
			PathController pc = new PathController();
			pc.doGet(request, response);			
		}else if (hc.equals("reserve")) {			
			ReserveController rc = new ReserveController();
			rc.doGet(request, response);			
		}else if (hc.equals("community")) {			
			Controller cc = new Controller();
			cc.doGet(request, response);			
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
