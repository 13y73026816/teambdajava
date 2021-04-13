package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import domain.PageMaker;
import domain.SearchCriteria;
import service.CommentDao;
import service.CommentVo;
import service.NoticeDao;
import service.NoticeVo;
import service.QADao;
import service.QAVo;
import service.ReViewDao;
import service.ReViewVo;


@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String uploadPath ="D:\\eclipse-workspace\\dajava_a\\WebContent\\";
	String savedPath="filefolder";
	String saveFullPath=uploadPath+savedPath;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		request.setCharacterEncoding("UTF-8");
		//한글 깨짐 방지
		String uri = request.getRequestURI();
		//전체 가상경로 
		int len = request.getContextPath().length();
		//프로젝트 이름의 길이
		String str = uri.substring(len);
		//프로젝트 이름을 뺀 실제 가상경로 
		
		if(str.equals("/community/50.do")) {
			
			
			
			String page = request.getParameter("page");
			System.out.println(page);
			
			if (page == null) page="1";
			int pagex  = Integer.parseInt(page);
			String keyword = request.getParameter("keyword");
			if(keyword==null) keyword="";
			
			
			
			System.out.println(pagex);
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			
			NoticeDao nd = new NoticeDao();
			System.out.println(nd);
			int cnt = nd.Total(keyword);
			System.out.println(cnt);
			pm.setTotalCount(cnt);
			
			
			
			//1. DB에 저장된 데이터를 가져온다. 
			//NewBoardDao bv = new NewBoardDao();
			ArrayList<NoticeVo> alist = nd.SelectAll(scri);
			//2.REQUEST 객체에 ALIST 이름으로 값을 담는다. 
			
			request.setAttribute("alist", alist);                            
			request.setAttribute("pm", pm);
			
			
			
			
			//NoticeDao td = new NoticeDao(); 
			//ArrayList<NoticeVo> alist = td.SelectAll();
			
			//request.setAttribute("alist", alist);
			
			
			
			
			RequestDispatcher rs = request.getRequestDispatcher("/community/50.jsp");
			rs.forward(request, response);
		}
		
		else if(str.equals("/community/51.do")) {
			
			
			
			
			
			RequestDispatcher rs = request.getRequestDispatcher("/community/51.jsp");
			rs.forward(request, response);
			
		}
		else if(str.equals("/community/writeAction.do")) {
			
		
			
			
		//	String Nidx = request.getParameter("Nidx");
			String Ntitle = request.getParameter("Ntitle");
			String Ncontents = request.getParameter("Ncontents");
		//	String Nwriter = request.getParameter("Nwriter");
		//	String Npassword = request.getParameter("Npassword");
		//	String Ndate = request.getParameter("Ndate");
		//	String Ndelyn= request.getParameter("Nndelyn");
		//	int Nidx2 = Integer.parseInt(Nidx);
			String Npassword = request.getParameter("Npassword");
		  	String midx = request.getParameter("midx");
			String Ndate = request.getParameter("Ndate");
			NoticeDao Nd = new NoticeDao();
			
			Nd.Insert( midx,Ntitle, Ncontents,Npassword,Ndate);
			
			
			
		
			
			
			
			response.sendRedirect(request.getContextPath()+"/community/50.do");
		}
		else if (str.equals("/community/51-1.do")) {
			
			String Nidx = request.getParameter("Nidx");
			int Nidx2 = Integer.parseInt(Nidx);
			
			NoticeDao nd = new NoticeDao();
			NoticeVo nv = nd.SelectOne(Nidx2);
			
			request.setAttribute("nv", nv);
			
			
			RequestDispatcher rs = request.getRequestDispatcher("/community/51-1.jsp");
			rs.forward(request, response);	
			
		}
	
		else if(str.equals("/community/51-2.do")) {
			
			
			
			String Nidx = request.getParameter("Nidx");
			int Nidx2 = Integer.parseInt(Nidx);
			NoticeDao nd = new NoticeDao();
			NoticeVo nv = nd.SelectOne(Nidx2);
			
			request.setAttribute("nv", nv);
			


			RequestDispatcher rs = request.getRequestDispatcher("/community/51-2.jsp");
			rs.forward(request, response);	
		}
		else if(str.equals("/community/changeAction.do")) {
			
			
			String Ntitle = request.getParameter("Ntitle");
			String Ncontents = request.getParameter("Ncontents");
			String Nidx = request.getParameter("Nidx");
			int Nidx2 = Integer.parseInt(Nidx);
		
			
			NoticeDao nd = new NoticeDao(); 
			nd.Update(Ntitle,Ncontents,Nidx2);
			
			
			response.sendRedirect(request.getContextPath()+"/community/50.do");
			
		}
		
		else if(str.equals("/community/51-3.do")) {
			
			String Nidx = request.getParameter("Nidx");
			int Nidx2 = Integer.parseInt(Nidx);
			request.setAttribute("Nidx2", Nidx2);
			
			
			
			RequestDispatcher rs =request.getRequestDispatcher("/community/51-3.jsp");
			rs.forward(request,response);
		}else if(str.equals("/community/deleteAction.do")) {
			String Nidx =request.getParameter("Nidx");
			String Npassword= request.getParameter("Npassword");
			int Nidx2 = Integer.parseInt(Nidx);
			NoticeDao td = new NoticeDao();
			td.deleteOne(Nidx2, Npassword);
			
			
			PrintWriter out = response.getWriter();
			
			   String sto="";
			   sto = "<script language='javascript'>";
			   sto += "opener.window.location.reload();";  //오프너 새로고침
			   sto += "self.close();";   // 창닫기
			   sto += "opener.location.href='/dajava_a/community/50.do'";
			   sto += "</script>";
			   out.print(sto);
		
		}
		
		// 여기서부터 qa 
		
		else if(str.equals("/community/54.do")) {
			
			
			String page = request.getParameter("page");
			
			
			if (page == null) page="1";
			int pagex  = Integer.parseInt(page);
			String keyword = request.getParameter("keyword");
			if(keyword==null) keyword="";
			
			
			
			
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			
			QADao qd = new QADao();
			
			int cnt = qd.Total(keyword);
		
			pm.setTotalCount(cnt);
			
			
			
			//1. DB에 저장된 데이터를 가져온다. 
			//NewBoardDao bv = new NewBoardDao();
			ArrayList<QAVo> alist = qd.SelectAll(scri);
			//2.REQUEST 객체에 ALIST 이름으로 값을 담는다. 
			
			request.setAttribute("alist", alist);                            
			request.setAttribute("pm", pm);
			
			
			
			
			//NoticeDao td = new NoticeDao(); 
			//ArrayList<NoticeVo> alist = td.SelectAll();
			
			//request.setAttribute("alist", alist);
			
			
			
			
			RequestDispatcher rs = request.getRequestDispatcher("/community/54.jsp");
			rs.forward(request, response);
			
			
		}
			else if(str.equals("/community/55.do")) {
				
				
				
				
				
				RequestDispatcher rs = request.getRequestDispatcher("/community/55.jsp");
				rs.forward(request, response);
				
			}
			
				else if(str.equals("/community/writeAction1.do")) {
					
					
					
					
			
						String Qtitle = request.getParameter("Qtitle");
						String Qcontents = request.getParameter("Qcontents");
						String Ridx =request.getParameter("Ridx");
						String Midx =request.getParameter("Midx");
						String QPassword =request.getParameter("QPassword");
						String Qdate =request.getParameter("Qdate");
						QADao Qd = new QADao();
						Qd.Insert( Qtitle, Qcontents,Ridx,Midx,QPassword,Qdate);
						
						
					
					
						
						
						
						response.sendRedirect(request.getContextPath()+"/community/54.do");
					}
				else if (str.equals("/community/54-1.do")) {
					
					String Qidx = (String)request.getParameter("Qidx");
					int Qidx2 = Integer.parseInt(Qidx);
					
					QADao qd = new QADao();
					QAVo qv = qd.SelectOne(Qidx2);
					
					request.setAttribute("qv", qv);
					request.getAttribute("QoriginQidx:"+qv.getQORIGINQIDX());
					
					RequestDispatcher rs = request.getRequestDispatcher("/community/54-1.jsp");
					rs.forward(request, response);	
					
					
					
				}
				else if (str.equals("/community/54-2.do")) {
					
					String Qidx = request.getParameter("Qidx");
					
					int Qidx2 = Integer.parseInt(Qidx);
					
					QADao qd = new QADao();
					QAVo qv = qd.SelectOne(Qidx2);
					
					request.setAttribute("qv", qv);
					
					
					RequestDispatcher rs = request.getRequestDispatcher("/community/54-2.jsp");
					rs.forward(request, response);	
					
				}
				else if(str.equals("/community/changeAction1.do")) {
					
					
					String Qtitle = request.getParameter("Qtitle");
					String Qcontents = request.getParameter("Qcontents");
					String Qidx = request.getParameter("Qidx");
					String Ridx = request.getParameter("Ridx");
					int Qidx2 = Integer.parseInt(Qidx);
				
					
					QADao qd = new QADao(); 
					int value = qd.Update(Qtitle,Qcontents,Ridx,Qidx2);
					
					
					response.sendRedirect(request.getContextPath()+"/community/54.do");
					
				}
				else if(str.equals("/community/54-3.do")) {
					
					String Qidx = request.getParameter("Qidx");
					int Qidx2 = Integer.parseInt(Qidx);
					request.setAttribute("Qidx2", Qidx2);
					
					
					
					RequestDispatcher rs =request.getRequestDispatcher("/community/54-3.jsp");
					rs.forward(request,response);
				}else if(str.equals("/community/deleteAction1.do")) {
					String Qidx =request.getParameter("Qidx");
					String QPassword =request.getParameter("QPassword");
					
					int Qidx2 = Integer.parseInt(Qidx);
					QADao qd = new QADao();
					qd.deleteOne(Qidx2,QPassword);
					
					
					response.sendRedirect(request.getContextPath()+"/community/54.do");
				
				}
				else if(str.equals("/community/Confirm.do")) 
				
				{
					
					String Qidx = (String)request.getParameter("Qidx");
					int Qidx2 = Integer.parseInt(Qidx);
					
					QADao qd = new QADao();
					QAVo qv = qd.SelectOne(Qidx2);
					
					request.setAttribute("qv", qv);

					RequestDispatcher rs = request.getRequestDispatcher("/community/Confirm.jsp");
					rs.forward(request, response);
					
					
				}
			
				else if(str.equals("/community/54-4.do")) {
					
					
					
					String Qidx =request.getParameter("Qidx");
					String QoriginQidx = request.getParameter("QoriginQidx");
					String Qdepth = request.getParameter("Qdepth");
					String Qlevel = request.getParameter("Qlevel");
					
					String Ridx  = request.getParameter("Ridx");
					request.setAttribute("Qidx", Qidx);
					request.setAttribute("QoriginQidx", QoriginQidx);
					request.setAttribute("Qdepth", Qdepth);
					request.setAttribute("Qlevel", Qlevel);
					
					request.setAttribute("Ridx", Ridx);
					System.out.println(Qidx);
					System.out.println(QoriginQidx);
					System.out.println(Qdepth);
					System.out.println(Qlevel);
					
					System.out.println(Ridx);
					System.out.println("00000");
					
					RequestDispatcher rs =request.getRequestDispatcher("/community/54-4.jsp");
					rs.forward(request,response);
					
					
					
				}
				else if(str.equals("/community/reAction1.do")) {
					
					String Qidx =request.getParameter("Qidx");
					
					String QoriginQidx = request.getParameter("QoriginQidx");
					int QoriginQidx2 = Integer.parseInt(QoriginQidx);
					String Qdepth = request.getParameter("Qdepth");
					int Qdepth2 = Integer.parseInt(Qdepth);
					String Qlevel = request.getParameter("Qlevel");
					int Qlevel2 = Integer.parseInt(Qlevel);
					String Qtitle = request.getParameter("Qtitle");
					String Qcontents= request.getParameter("Qcontents");
					
					String Qpassword = request.getParameter("Qpassword");	
					String Midx =request.getParameter("Midx");
					
					String Ridx =request.getParameter("Ridx");
					String Qdate = request.getParameter("Qdate");
					System.out.println(Qidx);
					System.out.println(QoriginQidx);
					System.out.println(Qdepth);
					System.out.println(Qlevel);
					System.out.println(Midx);
					System.out.println(Ridx);
					System.out.println(Qtitle);
					System.out.println(Qcontents);
					System.out.println(Qpassword);
				
					QADao qd = new QADao();
					qd.QaRE(QoriginQidx2,Qlevel2, Qdepth2, Qtitle, Qcontents, Qpassword,Midx, Ridx, Qdate);
				
					response.sendRedirect(request.getContextPath()+"/community/54.do");
				
				}
				
		
				//여기서부터 리뷰 
		
				else if(str.equals("/community/52.do")) {
					
					
					String page = request.getParameter("page");
					System.out.println(page);
					
					if (page == null) page="1";
					int pagex  = Integer.parseInt(page);
					String keyword = request.getParameter("keyword");
					if(keyword==null) keyword="";
					
					
					
					System.out.println(pagex);
					
					SearchCriteria scri = new SearchCriteria();
					scri.setPage(pagex);
					scri.setKeyword(keyword);
					
					PageMaker pm = new PageMaker();
					pm.setScri(scri);
					
					ReViewDao nd = new ReViewDao();
					System.out.println(nd);
					int cnt = nd.Total(keyword);
					System.out.println(cnt);
					pm.setTotalCount(cnt);
					
					
					
					//1. DB에 저장된 데이터를 가져온다. 
					//NewBoardDao bv = new NewBoardDao();
					ArrayList<ReViewVo> alist2 = nd.SelectAll(scri);
					//2.REQUEST 객체에 ALIST 이름으로 값을 담는다. 
					
					request.setAttribute("alist2", alist2);                            
					request.setAttribute("pm", pm);
					
					
					
					
					//NoticeDao td = new NoticeDao(); 
					//ArrayList<NoticeVo> alist = td.SelectAll();
					
					//request.setAttribute("alist", alist);
					
					
					
					
					RequestDispatcher rs = request.getRequestDispatcher("/community/52.jsp");
					rs.forward(request, response);
					
					
				}
					else if(str.equals("/community/53.do")) {
					
					
					RequestDispatcher rs = request.getRequestDispatcher("/community/53.jsp");
					rs.forward(request, response);
					
				}
				
					else if(str.equals("/community/writeAction2.do")) {
						
			/*
			 * int sizeLimit = 1024*1024*15; String ReFile = null; String originFileName =
			 * null;
			 * 
			 * //MultipartRequest 객체생성 MultipartRequest multi = new
			 * MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new
			 * DefaultFileRenamePolicy());
			 * 
			 * //열거자에 파일Name속성의 이름을 담는다 Enumeration files = multi.getFileNames(); //담긴 파일
			 * 객체의 Name값을 담는다. String file = (String)files.nextElement(); //저장되는 파일이름 ReFile
			 * = multi.getFilesystemName(file); //원래파일 이름 originFileName =
			 * multi.getOriginalFileName(file);
			 * 
			 * String ThumbnailFileName = null;
			 * 
			 * try { if(ReFile != null) ThumbnailFileName = makeThumbnail(uploadPath,
			 * savedPath, ReFile); } catch (Exception e) { e.printStackTrace(); }
			 */
							
							
							//2. Dao객체를 생성시켜서 넘어온  값을 입력한다
						
							String Retitle = request.getParameter("Retitle");
							String Recontents = request.getParameter("Recontents");
							String Ridx =request.getParameter("Ridx");
							String Midx =request.getParameter("Midx");
							String RePassword =request.getParameter("RePassword");
							String Redate = request.getParameter("Redate");
							
							System.out.println("test:::::::::"+Ridx);
							ReViewDao rd = new ReViewDao();
							rd.Insert( Retitle, Recontents,Ridx,Midx,RePassword,Redate);
							
							
						
						
							
							
							
							response.sendRedirect(request.getContextPath()+"/community/52.do");
						}
					else if (str.equals("/community/52-1.do")) {
						
						String page = request.getParameter("page");
						System.out.println(page);
						
						if (page == null) page="1";
						int pagex  = Integer.parseInt(page);
						String keyword = request.getParameter("keyword");
						if(keyword==null) keyword="";
						
						

						
						System.out.println(pagex);
						
						SearchCriteria scri = new SearchCriteria();
						scri.setPage(pagex);
						scri.setKeyword(keyword);
						
						PageMaker pm = new PageMaker();
						pm.setScri(scri);
						
						ReViewDao nd = new ReViewDao();
						System.out.println(nd);
						int cnt = nd.Total(keyword);
						System.out.println(cnt);
						pm.setTotalCount(cnt);
						
						
						
						//1. DB에 저장된 데이터를 가져온다. 
						//NewBoardDao bv = new NewBoardDao();
						ArrayList<ReViewVo> alist2 = nd.SelectAll(scri);
						//2.REQUEST 객체에 ALIST 이름으로 값을 담는다. 
						
						request.setAttribute("alist2", alist2);                            
						request.setAttribute("pm", pm);
						
						
						
						
						ReViewDao no = new ReViewDao();
						ArrayList<ReViewVo> al = no.SelectTop();
												
						request.setAttribute("al", al);       

						
						
						
						
						
						String Reidx = (String)request.getParameter("Reidx");
						int Reidx3 = Integer.parseInt(Reidx);
						

						
					
						
					
						
						
						PageMaker pm2 = new PageMaker();
						pm2.setScri(scri);
						CommentDao cd = new CommentDao();
						System.out.println(cd);
						int cnt2 = cd.Total(Reidx3);
						System.out.println(cnt2+"갯수");
						pm2.setTotalCount(cnt2);
						//1. DB에 저장된 데이터를 가져온다. 
						
						
						ArrayList<CommentVo> alist = cd.SelectAll(Reidx3,scri);
						//2.REQUEST 객체에 ALIST 이름으로 값을 담는다. 
			
						request.setAttribute("alist", alist);                            
						request.setAttribute("pm2", pm2);
						
						int Reidx2 = Integer.parseInt(Reidx);
						ReViewDao rd = new ReViewDao();
						
						
						HttpSession session =request.getSession();
						String id = (String)session.getAttribute("id");

						
						int countCheck = 0;
						Cookie[] cookies = request.getCookies(); // 쿠키값을 배열로 받고 없으면 null값 반환 
						if(cookies !=null) { // 만약 쿠키 배열의 값이 null이 아니라면 
							for(int i= 0; i<cookies.length; i++) { // i의 값을 쿠키 배열의 길이 만큼 증가 시키고 
								if(cookies[i].getName().equals("count"+Reidx) && cookies[i].getValue().equals(id+Reidx)){// 만약 쿠키 배열의 i번째 이름이 count+Reidx의 값이라면 
									 countCheck = 0;     			// countcheck 값을 0으로 초기화 하고 
								     break;                        // 그리고 빠져 나온다 빠져 나온다.  
								
								
							}else{
							     Cookie cookie = new Cookie("count"+Reidx,id+Reidx); // cookie 값이 null이라면 쿠키 생성을 한다. 
							     //이름이 count +Reidx 
							     //밸류 값이 reidx 이라면 ? 하나만 생성되도 다 같은 값이 되기에 조회수는 1만 올라기니 이상함 
							     cookie.setMaxAge(60*60*24); //쿠키의 지속 시간 
							     cookie.setPath("/"); // 쿠키의 경로의 / 제외 
							     response.addCookie(cookie); // 헤더에 쿠키값을 더한다. 
							     countCheck += 1; /// 그리고서 카운트 체크값에 1을 더한다. 
							     
							    }
							   }
							
							
						}
						if(countCheck > 0) { // 그리고 카운트 체크 값이 0보다 크다면 아래의 메소드를 진행 시키고  0과 같거나 작으면 실행시키지 않고 아래로 간다. 
							
							int a = rd.Rview(Reidx2);
							
						}
						
						
						ReViewVo rv = rd.SelectOne(Reidx2);
						
						request.setAttribute("rv", rv);
						
						
						RequestDispatcher rs = request.getRequestDispatcher("/community/52-1.jsp");
						rs.forward(request, response);	
						
					}
					else if (str.equals("/community/52-2.do")) {
						
						String Reidx = request.getParameter("Reidx");
						
						int Reidx2 = Integer.parseInt(Reidx);
						
						ReViewDao rd = new ReViewDao();
						ReViewVo rv = rd.SelectOne(Reidx2);
						
						request.setAttribute("rv", rv);
						
						
						RequestDispatcher rs = request.getRequestDispatcher("/community/52-2.jsp");
						rs.forward(request, response);	
						
					}
					else if(str.equals("/community/changeAction2.do")) {
						
						
						String Retitle = request.getParameter("Retitle");
						String Recontents = request.getParameter("Recontents");
						String Reidx = request.getParameter("Reidx");
						String Ridx = request.getParameter("Ridx");
						int Reidx2 = Integer.parseInt(Reidx);
						int Ridx2 = Integer.parseInt(Ridx);
						System.out.println("reidx : "+Reidx);
						
						ReViewDao rd = new ReViewDao(); 
						rd.Update(Retitle,Recontents,Ridx2,Reidx2);
						
						
						response.sendRedirect(request.getContextPath()+"/community/52.do");
						
					}
					else if(str.equals("/community/52-3.do")) {
						
						String Reidx = request.getParameter("Reidx");
						int Reidx2 = Integer.parseInt(Reidx);
						request.setAttribute("Reidx2", Reidx2);
						
						
						
						RequestDispatcher rs =request.getRequestDispatcher("/community/52-3.jsp");
						rs.forward(request,response);
					}else if(str.equals("/community/deleteAction2.do")) {
						String Reidx =request.getParameter("Reidx");
						String RePassword =request.getParameter("RePassword");
						
						int Reidx2 = Integer.parseInt(Reidx);
						ReViewDao rd = new ReViewDao();
						rd.deleteOne(Reidx2,RePassword);
						
						
						response.sendRedirect(request.getContextPath()+"/community/52.do");
					
					}
			
					else if(str.equals("/community/CommentAction.do")) {
										
					
					
					String Ccontents = request.getParameter("Ccontents");
					String Reidx =request.getParameter("Reidx");
					String Midx =request.getParameter("Midx");
				
					System.out.println(Ccontents+"Ccontents");
					System.out.println(Reidx+"Reidx");
					System.out.println(Midx+"Midx");
					
					CommentDao cd = new CommentDao();
					cd.Insert(Ccontents,Reidx,Midx);
					
					
					
					
					
					
					
					
					response.sendRedirect(request.getContextPath()+"/community/52-1.do?Reidx="+Reidx);
					
				}else if(str.equals("/community/CommentdeleteAction.do")) {
					String Cidx =request.getParameter("Cidx");
					String Reidx =request.getParameter("Reidx");
					
					int Cidx2 = Integer.parseInt(Cidx);
					int Reidx2 = Integer.parseInt(Reidx);
					System.out.println(Cidx+"Cidx");
					System.out.println(Reidx+"Reidx");
					
					
					CommentDao cd = new CommentDao();
					cd.deleteOne(Cidx2,Reidx2);
					
					
					response.sendRedirect(request.getContextPath()+"/community/52-1.do?Reidx="+Reidx);
						
				}
				
				else if(str.equals("/community/52-4.do")) {
					
					String Cidx = request.getParameter("Cidx");
					String Reidx = request.getParameter("Reidx");
					int Cidx2 = Integer.parseInt(Cidx);
					int Reidx2 = Integer.parseInt(Reidx);
					CommentDao cd = new CommentDao();
					CommentVo cv = cd.SelectOne(Cidx2);
					ReViewDao rd = new ReViewDao();
					ReViewVo rv = rd.SelectOne(Reidx2);
					System.out.println("1"+""+Cidx);
					System.out.println("2"+""+Reidx);
					
					request.setAttribute("cv", cv);
					request.setAttribute("rv", rv);
					
					
					RequestDispatcher rs =request.getRequestDispatcher("/community/52-4.jsp");
					rs.forward(request,response);
					
				}
				else if(str.equals("/community/CommentChange.do")) {
					
					
				
					String Ccontents = request.getParameter("Ccontents");
					String Cidx =request.getParameter("Cidx");
					int Cidx2 = Integer.parseInt(Cidx);
					String Reidx = request.getParameter("Reidx");
					int Reidx2 = Integer.parseInt(Reidx);
					System.out.println("3"+""+Cidx);
					System.out.println("4"+""+Reidx);
					
					CommentDao cd = new CommentDao(); 
					int value = cd.Update(Ccontents,Cidx2,Reidx2);
					
					
					PrintWriter out = response.getWriter();
					
					   String sto="";
					   sto = "<script language='javascript'>";
					   sto += "opener.window.location.reload();";  //오프너 새로고침
					   sto += "self.close();";   // 창닫기
					   sto += "</script>";
					   out.print(sto);

					
				}else if(str.equals("/community/52-5.do")) {
					
					
					
					String Cidx =request.getParameter("Cidx");
					String CoriginCidx = request.getParameter("CoriginCidx");
					String Cdepth = request.getParameter("Cdepth");
					String Clevel = request.getParameter("Clevel");
					
					String Reidx  = request.getParameter("Reidx");
					request.setAttribute("Cidx", Cidx);
					request.setAttribute("CoriginCidx", CoriginCidx);
					request.setAttribute("Cdepth", Cdepth);
					request.setAttribute("Clevel", Clevel);
					request.setAttribute("Reidx", Reidx);
					System.out.println(Cidx);
					System.out.println(CoriginCidx);
					System.out.println(Cdepth);
					System.out.println(Clevel);
					
					System.out.println(Reidx);
					System.out.println("00000");
					
					RequestDispatcher rs =request.getRequestDispatcher("/community/52-5.jsp");
					rs.forward(request,response);
					
					
					
				}

		        else if(str.equals("/community/ReAction.do")) {
					
					String Cidx =request.getParameter("Cidx");
					String CoriginCidx = request.getParameter("CoriginCidx");
					int CoriginCidx2 = Integer.parseInt(CoriginCidx);
					String Cdepth = request.getParameter("Cdepth");
					int Cdepth2 = Integer.parseInt(Cdepth);
					String Clevel = request.getParameter("Clevel");
					int Clevel2 = Integer.parseInt(Clevel);
					String Ccontents= request.getParameter("Ccontents");
					String Midx =request.getParameter("Midx");
					String Reidx  =request.getParameter("Reidx");
					
					System.out.println(Cidx);
					System.out.println(CoriginCidx);
					System.out.println(Cdepth);
					System.out.println(Clevel);
					System.out.println(Midx);
					System.out.println(Reidx);
					System.out.println(Ccontents);
				
					CommentDao cd = new CommentDao();
					cd.CommentRe(CoriginCidx2,Clevel2, Cdepth2,Ccontents,Midx, Reidx);
				
				
				
					PrintWriter out = response.getWriter();
					
					   String sto="";
					   sto = "<script language='javascript'>";
					   sto += "opener.window.location.reload();";  //오프너 새로고침
					   sto += "self.close();";   // 창닫기
					   sto += "</script>";
					   out.print(sto);
					   

					 
					
					
					
					
				
					
					
				}else if (str.equals("/newboard/fileDownload.do")) {
					
					//넘어오는 파일이름
					String fileName = request.getParameter("fileName");			
					//파일의 위치한 전체경로	
			 		String filePath = saveFullPath + File.separator + fileName;
			 			 	
			 		byte[] b = new byte[4096]; 
					//해당위치에 존재하는 파일을 바이트 스트림으로 읽어드린다
					FileInputStream fileInputStream = new FileInputStream(filePath); 
				
					//마임(파일)타입을 체크하여 null이면 스트림타입으로 지정한다
				//	String mimeType = getServletContext().getMimeType(filePath); 
					// 절대 경로를 정의한다  
					 Path source = Paths.get(filePath);
					 //그 경로에 있는 파일의 마임타입을 확인하지 못하면 null을 반환
					  String mimeType = Files.probeContentType(source);			
					//서버에서 다루는 확장자명
					if(mimeType == null) { 
							// 8비트로 된 데이타로 .ini확장자의 파일을 읽는다
							mimeType = "application/octet-stream"; 
						} 
					response.setContentType(mimeType); 
					 			
					
			         // 파일명 UTF-8로 인코딩 
			         String sEncoding = new String(fileName.getBytes("UTF-8"),"ISO-8859-1"); 
			         response.setHeader("Content-Disposition", "attachment; fileName= " + sEncoding); 
			          
			         //  브라우저에 출력을 할때 ServletOutputStream 추상클래스
			         ServletOutputStream servletOutStream = response.getOutputStream(); 
			          
			         int read= 0; 
			         //읽어드린 파일을 4 바이트 타입으로 파일에 쓴다
			         while((read = fileInputStream.read(b,0,b.length))!= -1){ 
			             servletOutStream.write(b,0,read);             
			         } 
			          
			         servletOutStream.flush(); 
			         servletOutStream.close(); 
			         fileInputStream.close(); 			 	 
						
				} else if(str.equals("/community/Recommendation.do")) {
			    	  
			    	  String Reidx = request.getParameter("Reidx");
			    	  int Reidx2 = Integer.parseInt(Reidx);
			    	  HttpSession session = request.getSession();
			    	  String id = (String)session.getAttribute("id");
					  System.out.println("id"+id);
					  ReViewDao rd = new ReViewDao();
					  
					  
					  
					  int countCheck = 0;
						Cookie[] cookies = request.getCookies(); // 쿠키값을 배열로 받고 없으면 null값 반환 
						if(cookies !=null) { // 만약 쿠키 배열의 값이 null이 아니라면 
							for(int i= 0; i<cookies.length; i++) { // i의 값을 쿠키 배열의 길이 만큼 증가 시키고 
								if(cookies[i].getName().equals("Recommed"+Reidx) && cookies[i].getValue().equals(id+Reidx)){// 만약 쿠키 배열의 i번째 이름이 count+Reidx의 값이라면 
									 countCheck = 0;     			// countcheck 값을 0으로 초기화 하고 
								     break;                        // 그리고 빠져 나온다 빠져 나온다.  
								
								
							}else{
							     Cookie cookie = new Cookie("Recommed"+Reidx,id+Reidx); // cookie 값이 null이라면 쿠키 생성을 한다. 
							     //이름이 count +Reidx 
							     //밸류 값이 reidx 이라면 ? 하나만 생성되도 다 같은 값이 되기에 조회수는 1만 올라기니 이상함 
							     cookie.setMaxAge(60*60*24); //쿠키의 지속 시간 60초 *60 =1시간 *24 =24시간 즉 하루 동안 쿠키를 가지고 있음  
							     cookie.setPath("/"); // 쿠키의 경로의 / 제외 
							     response.addCookie(cookie); // 헤더에 쿠키값을 더한다. 
							     countCheck += 1; /// 그리고서 카운트 체크값에 1을 더한다. 
							     
							    }
							   }
							
							
						}
						if(countCheck > 0) { // 그리고 카운트 체크 값이 0보다 크다면 아래의 메소드를 진행 시키고  0과 같거나 작으면 실행시키지 않고 아래로 간다. 
							
							 rd.Recommend(Reidx2);
							
						}
	                  
					  
			    	  response.sendRedirect(request.getContextPath()+"/community/52-1.do?Reidx="+Reidx);
			    	  
			    	  
			      }
				
			
				
			}

			
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				doGet(request, response);
			}
			
			
				private static String makeThumbnail(String uploadPath,String path,String fileName) throws Exception{
				
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


