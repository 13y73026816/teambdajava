package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import domain.PageMaker;
import domain.SearchCriteria;
import service.BmypageDao;
import service.MypageDao;
import service.MypageVo;
import service.OrderDao;
import service.OrderDto;
import service.RoomVo;

@WebServlet("/BmypageController")
public class BmypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//업로드 파일 경로
	String uploadPath="C:\\tomcat\\webapps\\dajava_a\\";
	//저장 폴더
	String savedPath="filefolder";
	//저장된 총 경로
	String saveFullPath = uploadPath + savedPath;
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	
		
		String uri = request.getRequestURI();          
		int len = request.getContextPath().length();   
		String str = uri.substring(len);  
		
		if(str.equals("/bmypage/bmyinfo.do")) {
			
			HttpSession session = request.getSession();  
			int midx = (int) session.getAttribute("midx");
			
			MypageDao md = new MypageDao();                    
			MypageVo mv = md.memberSelectOneInfo(midx);
			
			request.setAttribute("mv",mv);                   
			
			RequestDispatcher rd =request.getRequestDispatcher("/BmyPage/bmyinfo.jsp");     
			rd.forward(request, response);
			
		}else if (str.equals("/bmypage/binfoModify.do")) {
			
			String midx = request.getParameter("midx");
			int midx2 = Integer.parseInt(midx);
			
			MypageDao md = new MypageDao();                    
			MypageVo mv = md.memberSelectOneInfo(midx2);
		
			request.setAttribute("mv",mv);   
			
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/binfoModify.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/bmypage/binfoModifyAction.do")){
			String midx = request.getParameter("midx");
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");
			System.out.println("bmidx : "+midx);
			
			BmypageDao bmd = new BmypageDao();
										
			bmd.infoModify(id, email, password, phone, addr, midx);
			
			response.sendRedirect(request.getContextPath()+"/bmypage/bmyinfo.do");
		}else if(str.equals("/bmypage/memberlist.do")) {
			
			String page= request.getParameter("page");
			if(page==null) page = "1";
			int pagex= Integer.parseInt(page);
			
			String keyword=request.getParameter("keyword");
			if(keyword==null) keyword ="";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			
			BmypageDao bmd = new BmypageDao();
			int cnt = bmd.memberTotal(keyword);      
			
			pm.setTotalCount(cnt);			
			
			ArrayList<MypageVo> alist = bmd.memberSelectAll(scri);       
			request.setAttribute("alist",alist);                  
			request.setAttribute("pm", pm);
			request.setAttribute("type", "down");
			
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/memberlist.jsp");  
			rd.forward(request, response);
			
		}else if (str.equals("/bmypage/myroomdp1.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/myroomdp1.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/bmypage/myroomdp.do")){
			
			String roomnum = request.getParameter("roomnum");
			BmypageDao bmd = new BmypageDao();                    
			RoomVo rv = bmd.roomSelectOne(roomnum);
			
			request.setAttribute("rv",rv);  		
			RequestDispatcher rd =request.getRequestDispatcher("/BmyPage/myroomdp.jsp");    
			rd.forward(request, response);
		}else if (str.equals("/bmypage/roomModify.do")) {
			String roomnum=request.getParameter("roomnum");
			request.setAttribute("roomnum", roomnum);
			
			BmypageDao bmd = new BmypageDao();                    
			RoomVo rv = bmd.roomSelectOne(roomnum);
			
			request.setAttribute("rv",rv);  		
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/myroomip.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/bmypage/roomModifyAction.do")){
			int sizeLimit = 1024*1024*15;
			String fileName = null;
			String originFileName = null;
			
			//MultipartRequest 객체생성...filefolder에저장
			MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
			
			//열거자에  파일Name속성의 이름을 담는다
			Enumeration files = multi.getFileNames();
			//담긴 파일 객체의 Name값을 담는다.
			String file = (String)files.nextElement();
			//저장되는 파일이름
			fileName = multi.getFilesystemName(file); 
			//원래파일 이름
			originFileName = multi.getOriginalFileName(file);
			
			String ThumbnailFileName = null;
					
			try {
				if(fileName != null)
				ThumbnailFileName = makeThumbnail(uploadPath,savedPath, fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
			String rbaseperson = multi.getParameter("rbaseperson");
			String rfullperson = multi.getParameter("rfullperson");
			String rbaseprice = multi.getParameter("rbaseprice");
			String raddperson = multi.getParameter("raddperson");
			String rsupply = multi.getParameter("rsupply");
			String roffseason1 = multi.getParameter("roffseason1");
			String roffseason2 = multi.getParameter("roffseason2");
			String rbusyseason1 = multi.getParameter("rbusyseason1");
			String rbusyseason2 = multi.getParameter("rbusyseason2");
			String roomnum = multi.getParameter("roomnum");
			
			BmypageDao bmd = new BmypageDao();
										
			bmd.roomModify(rbaseperson, rfullperson, rbaseprice, raddperson, rsupply,roffseason1,roffseason2,rbusyseason1,rbusyseason2,fileName, roomnum);
				
			response.sendRedirect(request.getContextPath()+"/bmypage/myroomdp.do?roomnum="+roomnum);
		}else if(str.equals("/bmypage/breserve_canc.do")) {
						
			String page= request.getParameter("page");
			if(page==null) page = "1";
			int pagex= Integer.parseInt(page);
			
			String keyword=request.getParameter("keyword");
			if(keyword==null) keyword ="";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			
			BmypageDao bmd = new BmypageDao();
			int cnt = bmd.orderTotal_canc(keyword);    
			
			pm.setTotalCount(cnt);			
			
			ArrayList<OrderDto> alist = bmd.breserveCanc(scri);       
			request.setAttribute("alist",alist);                  
			request.setAttribute("pm", pm);
			request.setAttribute("type", "down");  
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/breserve_canc.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/bmypage/cancSort_123.do")) {
			
			String page= request.getParameter("page");
			if(page==null) page = "1";
			int pagex= Integer.parseInt(page);
			
			String keyword=request.getParameter("keyword");
			if(keyword==null) keyword ="";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			
			BmypageDao bmd = new BmypageDao();
			int cnt = bmd.orderTotal_canc(keyword);    
			
			pm.setTotalCount(cnt);			
			
			ArrayList<OrderDto> alist = bmd.cancSort_123(scri);       
			request.setAttribute("alist",alist);                  
			request.setAttribute("pm", pm);
			request.setAttribute("type", "up");
			
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/breserve_canc.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/bmypage/cancSort_321.do")) {
				
			String page= request.getParameter("page");
			if(page==null) page = "1";
			int pagex= Integer.parseInt(page);
			
			String keyword=request.getParameter("keyword");
			if(keyword==null) keyword ="";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			
			BmypageDao bmd = new BmypageDao();
			int cnt = bmd.orderTotal_canc(keyword);    
			
			pm.setTotalCount(cnt);			
			
			ArrayList<OrderDto> alist = bmd.cancSort_321(scri);       
			request.setAttribute("alist",alist);                  
			request.setAttribute("pm", pm);
			request.setAttribute("type", "down");
			
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/breserve_canc.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/bmypage/breserve_pres.do")) {
			
			String page= request.getParameter("page");
			if(page==null) page = "1";
			int pagex= Integer.parseInt(page);
			
			String keyword=request.getParameter("keyword");
			if(keyword==null) keyword ="";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			
			BmypageDao bmd = new BmypageDao();
			int cnt = bmd.orderTotal_pres(keyword);      
			
			pm.setTotalCount(cnt);			
			
			ArrayList<OrderDto> alist = bmd.breservePres(scri);       
			request.setAttribute("alist",alist);                  
			request.setAttribute("pm", pm);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/breserve_pres.jsp");
			rd.forward(request, response);
		
		}else if(str.equals("/bmypage/cancelState.do")) {
			
			String oidx = request.getParameter("oidx");
			int oidx2 = Integer.parseInt(oidx);
			
			BmypageDao bmd = new BmypageDao();					
			bmd.cstateModify(oidx2);
			
			response.sendRedirect(request.getContextPath()+"/bmypage/breserve_pres.do");
		}else if(str.equals("/bmypage/breserve_past.do")) {
			
			String page= request.getParameter("page");
			if(page==null) page = "1";
			int pagex= Integer.parseInt(page);
			
			String keyword=request.getParameter("keyword");
			if(keyword==null) keyword ="";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			
			BmypageDao bmd = new BmypageDao();
			int cnt = bmd.orderTotal_past(keyword);      
			
			pm.setTotalCount(cnt);			
			
			ArrayList<OrderDto> alist = bmd.breservePast(scri);       
			request.setAttribute("alist",alist);                  
			request.setAttribute("pm", pm);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/breserve_past.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/bmypage/sort_321.do")) {
			
			String page= request.getParameter("page");
			if(page==null) page = "1";
			int pagex= Integer.parseInt(page);
			
			String keyword=request.getParameter("keyword");
			if(keyword==null) keyword ="";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			
			BmypageDao bmd = new BmypageDao();
			int cnt = bmd.orderTotal_past(keyword);      
			
			pm.setTotalCount(cnt);			
			
			ArrayList<OrderDto> alist = bmd.sort_321(scri);       
			request.setAttribute("alist",alist);                  
			request.setAttribute("pm", pm);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/breserve_past.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/bmypage/sort_123.do")) {
			
			String page= request.getParameter("page");
			if(page==null) page = "1";
			int pagex= Integer.parseInt(page);
			
			String keyword=request.getParameter("keyword");
			if(keyword==null) keyword ="";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			
			BmypageDao bmd = new BmypageDao();
			int cnt = bmd.orderTotal_past(keyword);      
			
			pm.setTotalCount(cnt);			
			
			ArrayList<OrderDto> alist = bmd.sort_123(scri);       
			request.setAttribute("alist",alist);                  
			request.setAttribute("pm", pm);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/breserve_past.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/bmypage/sort_za.do")) {
			String page= request.getParameter("page");
			if(page==null) page = "1";
			int pagex= Integer.parseInt(page);
			
			String keyword=request.getParameter("keyword");
			if(keyword==null) keyword ="";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			
			BmypageDao bmd = new BmypageDao();
			int cnt = bmd.memberTotal(keyword);      
			
			pm.setTotalCount(cnt);			
			
			ArrayList<MypageVo> alist = bmd.sort_za(scri);       
			request.setAttribute("alist",alist);                  
			request.setAttribute("pm", pm);
			request.setAttribute("type", "up");
			
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/memberlist.jsp");  
			rd.forward(request, response);
			
		}else if(str.equals("/bmypage/sort_az.do")) {
			
			String page= request.getParameter("page");
			if(page==null) page = "1";
			int pagex= Integer.parseInt(page);
			
			String keyword=request.getParameter("keyword");
			if(keyword==null) keyword ="";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			
			BmypageDao bmd = new BmypageDao();
			int cnt = bmd.memberTotal(keyword);      
			
			pm.setTotalCount(cnt);			
			
			ArrayList<MypageVo> alist = bmd.sort_az(scri);       
			request.setAttribute("alist",alist);                  
			request.setAttribute("pm", pm);
			request.setAttribute("type", "down");
			
			RequestDispatcher rd = request.getRequestDispatcher("/BmyPage/memberlist.jsp");  
			rd.forward(request, response);
		}else if(str.equals("/bmypage/memberDelete.do")){
				
				String id = request.getParameter("id"); 
				System.out.println("회원id : "+id);
				
				BmypageDao bd = new BmypageDao(); 
				bd.memberDel(id);
		
				JSONObject jObj = new JSONObject();
								
				response.getWriter().print(jObj);
				
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}
	
	private static String makeThumbnail(String uploadPath,String path,String fileName) throws Exception{    //이미지를작게할려고
		
		//올린 소스파일을 읽어드린다
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path+File.separator+fileName));
		//이미지를 리사이징한다(높이 100에 맞춰서 원본이미지 비율을 유지한다)
		BufferedImage destImg = Scalr.resize(sourceImg,Scalr.Method.AUTOMATIC,Scalr.Mode.FIT_TO_HEIGHT,100);
		//썸네일 풀경로
		String thumbnailPath = uploadPath + path + File.separator + "s-"+fileName;
		//파일 객체생성
		File newFile = new File(thumbnailPath);
		//확장자 추출
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		//썸네일 이미지 만들기(리사이징한 이미지를 해당 이미지형식으로 해당 위치에 파일 객체생성한다)
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		//썸네일 파일 이름 추출
		return thumbnailPath.substring((uploadPath+path).length()).replace(File.separatorChar, ' ');
	}


}
