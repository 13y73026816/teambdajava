package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.Dbconn;
import domain.SearchCriteria;


public class CommentDao {
	private Connection conn;
	private PreparedStatement pstmt;
	
	
	
	public CommentDao(){
		Dbconn dbconn = new Dbconn();       
		this.conn= dbconn.getConnection();		
	}



	public int Insert( String Ccontents, String reidx, String midx) {
		int a = 0; 
	    String sql = "insert into table_comment(CoriginCidx,Cdepth,Clevel,Ccontents,reidx,midx,Cdate)"
	    		+ "values((select IFNULL(max(Cidx)+1, 1)FROM Table_comment c),0,0,?,?,?,NOW())";
	    try {
	    	pstmt =conn.prepareStatement(sql);
	    	pstmt.setString(1, Ccontents);
	    	pstmt.setString(2, reidx);
	    	pstmt.setString(3, midx);
	    	pstmt.executeUpdate();
	    	
	    	
	    	
	    }catch(SQLException e) {
	    	e.printStackTrace();
	    	
	    }
		
		
		
		
		
		
		return a;
	}
	
	public ArrayList<CommentVo> SelectAll(int reidx3,SearchCriteria scri){
		ArrayList<CommentVo> alist = new ArrayList<CommentVo>(); 
String sql= "select * from table_member a inner join table_Comment b on a.midx = b.midx inner join table_review c on b.reidx = c.reidx where Cdelyn='Y' and b.reidx = ? order by CORIGINCIDX desc, Cdepth asc limit ?,?";
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, reidx3);
			pstmt.setInt(2, (scri.getPage()-1)*10);
			pstmt.setInt(3, scri.getPage()*10);
		
			
			pstmt.executeQuery();
			ResultSet rs = pstmt.executeQuery();

			
			while(rs.next()) {
				
				CommentVo cv = new CommentVo(); 
				cv.setCIDX(rs.getInt("Cidx"));
				cv.setCCONTENTS(rs.getString("Ccontents"));
				cv.setMIDX(rs.getInt("Midx"));
				cv.setREIDX(rs.getInt("Reidx"));
				cv.setCDATE(rs.getString("Cdate"));
				cv.setNAME(rs.getString("Name"));
				cv.setCORIGINCIDX(rs.getInt("CoriginCidx"));
				cv.setCDEPTH(rs.getInt("Cdepth"));
				cv.setCLEVEL(rs.getInt("Clevel"));
				alist.add(cv);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}

		
		
		
		
		return alist; 
	}
	
	public int Total(int Reidx3) {
		int cnt = 0;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from Table_Comment where Cdelyn='Y' and Reidx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Reidx3);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				cnt = rs.getInt("cnt");
				
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		
		return cnt;
	}
			


	public int deleteOne(int Cidx, int Reidx) {
		int a =0;
	String sql = "update Table_Comment set Cdelyn='N' where Cidx=? and Reidx=? ";	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Cidx);
			pstmt.setInt(2, Reidx);
			System.out.println(Cidx+"Cidx");
			System.out.println(Reidx+"Reidx");
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}









		return a;
	}
	public CommentVo SelectOne(int Cidx) {
		CommentVo cv =null; 
		String sql="select * from table_Comment where Cidx=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Cidx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cv = new CommentVo(); 
				cv.setCIDX(rs.getInt("Cidx"));
				cv.setCCONTENTS(rs.getString("Ccontents"));
				
			}
			
			
		}catch(SQLException e ) {
			
			e.printStackTrace();
			
			
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
				
				
			}catch(final SQLException e) {
				e.printStackTrace();
				
			}
			
			
		}
		
		
		
		
		
		return cv; 
	}
	public int Update(String Ccontents, int Cidx, int Reidx) {
		int value= 0; 
		String sql="update Table_Comment set Ccontents=? where Cidx=? and Reidx=?";
		
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, Ccontents);
			pstmt.setInt(2, Cidx);
			pstmt.setInt(3, Reidx);
			pstmt.executeUpdate();
			System.out.println("5"+""+Cidx);
			System.out.println("6"+""+Reidx);
			
		}catch(SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return value;
	}
	

public int CommentRe(int CoriginCidx, int Clevel, int Cdepth, String Ccontents, String Midx,String Reidx) {
		int value=0;
		
		String sql1 = "update Table_comment set Cdepth =Cdepth+1 where CoriginCidx =? and Cdepth > ?";
		String sql2 = "insert into Table_comment(CORIGINCIDX,CLEVEL,CDEPTH,CCONTENTS,MIDX,Reidx,Cdate)VALUES(?,?,?,?,?,?,NOW())";
		try {
		conn.setAutoCommit(false);	
		pstmt=conn.prepareStatement(sql1);
		pstmt.setInt(1, CoriginCidx);
		pstmt.setInt(2, Cdepth);
		pstmt.executeUpdate();	
		
		pstmt=conn.prepareStatement(sql2);	
		pstmt.setInt(1, CoriginCidx);
		pstmt.setInt(2, Clevel+1);	
		pstmt.setInt(3, Cdepth+1);
		pstmt.setString(4, Ccontents);
		pstmt.setString(5, Midx);
		pstmt.setString(6, Reidx);
		pstmt.executeUpdate();
		
		conn.commit();
		
		}catch(SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
			
			
		}	
		return value; 
	}	




	
}

