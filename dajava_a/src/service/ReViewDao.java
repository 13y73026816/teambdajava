package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dbconn.Dbconn;
import domain.SearchCriteria;

public class ReViewDao {

	
	private Connection conn;
	private PreparedStatement pstmt;
	
	
public ReViewDao(){
	Dbconn dbconn = new Dbconn();       
	this.conn= dbconn.getConnection();	
}

public ArrayList<ReViewVo> SelectAll(SearchCriteria scri){
	ArrayList<ReViewVo> alist = new ArrayList<ReViewVo>(); 
    String sql= "select DISTINCT * from table_member a join table_review b on a.midx = b.midx inner join table_room c on b.ridx = c.ridx and Redelyn='Y' and Retitle like ? order by Reidx desc limit ?,?";
    ResultSet rs =null;
	try {
		pstmt= conn.prepareStatement(sql);
		
		pstmt.setString(1, "%"+scri.getKeyword()+"%");
		pstmt.setInt(2, (scri.getPage()-1)*10);
		pstmt.setInt(3, 10);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			ReViewVo rv = new ReViewVo(); 
			rv.setREIDX(rs.getInt("Reidx"));
			rv.setMIDX(rs.getInt("Midx"));
			rv.setREDATE(rs.getString("ReDate"));
			rv.setRETITLE(rs.getString("ReTitle"));
			rv.setNAME(rs.getString("Name"));
			rv.setRIDX(rs.getInt("Ridx"));
			rv.setRCOUNT(rs.getInt("Rcount"));
			rv.setROOMNUM(rs.getString("Roomnum"));
			alist.add(rv);
			
		}
		
		
	}catch(SQLException e) {
		e.printStackTrace();
		
	}

	
	
	System.out.println("นÝบน////"+alist);
	
	return alist; 
}
public int Insert(String Retitle, String Recontents, String ridx, String midx,String RePassword,String Redate) {
	int a = 0;
	String sql = "insert into Table_ReView(Retitle,Recontents,Midx,Ridx,RePassword,Redate)values(?,?,?,?,?,NOW())";
	try {
		pstmt = conn.prepareStatement(sql);
	
		
		pstmt.setString(1, Retitle);
		pstmt.setString(2, Recontents);
		pstmt.setString(3, midx);
		pstmt.setString(4, ridx);
		pstmt.setString(5, RePassword);
		
		pstmt.executeUpdate();
		
		
	}catch(SQLException e) {
		e.printStackTrace();
		
	}
	

	
	return a; 
}
	
public ReViewVo SelectOne(int Reidx) {
	ReViewVo rv =null; 
	String sql="select DISTINCT * from table_member m join table_review r on m.midx = r.midx and Reidx=?";
	ResultSet rs = null;
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Reidx);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			rv = new ReViewVo(); 
			rv.setREIDX(rs.getInt("REidx"));
			rv.setRETITLE(rs.getString("REtitle"));
			rv.setNAME(rs.getString("Name"));
			rv.setRECONTENTS(rs.getString("REcontents"));
			rv.setREDATE(rs.getString("REDate"));
			rv.setMIDX(rs.getInt("Midx"));
			rv.setRCOUNT(rs.getInt("RCount"));
			rv.setRECOMMENDATION(rs.getInt("Recommendation"));
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
	
	return rv; 
}
	
public int Update(String Retitle, String Recontents, int Ridx, int Reidx) {
	int value= 0; 
	
	System.out.println("reidx : "+Reidx);
	String sql="update Table_ReView set Retitle=?,Recontents=?,Ridx=? where Reidx=?";
	
	try {
		pstmt =conn.prepareStatement(sql);
		pstmt.setString(1, Retitle);
		pstmt.setString(2, Recontents);
		pstmt.setInt(3, Ridx);
		pstmt.setInt(4, Reidx);
		pstmt.executeUpdate();
		
		
	}catch(SQLException e) {
		
		e.printStackTrace();
	}
	
	
	return value;
}

public int deleteOne(int Reidx, String RePassword) {
	int a =0;
String sql = "update Table_ReView set Redelyn='N' where Reidx=? and RePassword=?";	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Reidx);
		pstmt.setString(2, RePassword);
		pstmt.executeUpdate();
		
	}catch(SQLException e) {
		e.printStackTrace();
	}




	return a;
}


public int Total(String keyword) {
	int cnt = 0;
	ResultSet rs = null;
	String sql = "select count(*) as cnt from Table_ReView where Redelyn='Y' and Retitle like ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+keyword+"%");
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			
			cnt = rs.getInt("cnt");
			
		}
		
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	
	
	
	return cnt;
}

public int Rview(int Reidx) {
	int a = 0; 
	String sql = "Update Table_Review set Rcount=Rcount+1 where Reidx=?";
	
    
	try {
		pstmt = conn.prepareStatement(sql);		
		pstmt.setInt(1, Reidx);
		pstmt.executeUpdate();
		System.out.println(Reidx);
		
	}catch(SQLException e){
			
		e.printStackTrace();
		}
	
		return a;
	}
	
public int Recommend(int Reidx) {
	int b = 0;
	String sql ="update Table_review set recommendation = recommendation+1 where Reidx =?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Reidx);
		pstmt.executeUpdate();
		
	}catch(SQLException e) {
		
		e.printStackTrace();
		
	}
	
	
	return b; 
}	
	


public ArrayList<ReViewVo> SelectTop(){
	ArrayList<ReViewVo> alist = new ArrayList<ReViewVo>(); 
    String sql= "SELECT * FROM Table_review where Redelyn ='Y' ORDER BY Rcount DESC limit 0,10";
    ResultSet rs = null;
	try {
		pstmt= conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			ReViewVo rv = new ReViewVo(); 
			rv.setREIDX(rs.getInt("Reidx"));
			rv.setMIDX(rs.getInt("Midx"));
			rv.setREDATE(rs.getString("ReDate"));
			rv.setRETITLE(rs.getString("ReTitle"));
			rv.setRCOUNT(rs.getInt("RCOUNT"));
			alist.add(rv);
			
		}
		
		
	}catch(SQLException e) {
		e.printStackTrace();
		
	}

	
	
	
	
	return alist; 
}  
		

}
