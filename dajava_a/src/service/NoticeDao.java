package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dbconn.Dbconn;
import domain.SearchCriteria;

public class NoticeDao {
	private Connection conn;
	private PreparedStatement pstmt;
	
	
public NoticeDao(){
	Dbconn dbconn = new Dbconn();       
	this.conn= dbconn.getConnection();	
}


public ArrayList<NoticeVo> SelectAll(SearchCriteria scri){
	ArrayList<NoticeVo> alist = new ArrayList<NoticeVo>(); 
	String sql= "select * from table_member m join table_notice n on m.midx=n.midx and Ndelyn = 'Y' and Ntitle like ? order by Nidx desc limit ?,?";
	ResultSet rs =null;
	try {
		pstmt= conn.prepareStatement(sql);
		pstmt.setString(1, "%"+scri.getKeyword()+"%");
		pstmt.setInt(2, (scri.getPage()-1)*10);
		pstmt.setInt(3, scri.getPage()*10);
	System.out.println("테스트1"+scri.getPage()*10);
	System.out.println("테스트2"+(scri.getPage()-1)*10);
		 rs = pstmt.executeQuery();
		
	
		while(rs.next()) {
			
			NoticeVo nv = new NoticeVo(); 
			
			nv.setNIDX(rs.getInt("Nidx"));
			nv.setNTITLE(rs.getString("Ntitle"));
			nv.setMIDX(rs.getInt("Midx"));
			nv.setNDATE(rs.getString("NDate"));
			nv.setNAME(rs.getString("Name"));
			alist.add(nv);
			
		}
		
		
	}catch(SQLException e) {
		e.printStackTrace();
		
	}
	System.out.println("1"+alist);
	
	
	
	
	return alist; 
}




public int Insert(String midx,String Ntitle, String Ncontents, String Npassword,String Ndate) {
	int a = 0;
	String sql = "insert into Table_notice(midx,Ntitle,Ncontents,Npassword,Ndate)values(?,?,?,?,NOW())";
	try {
		pstmt = conn.prepareStatement(sql);
	
		pstmt.setString(1, midx);
		pstmt.setString(2, Ntitle);
		pstmt.setString(3, Ncontents);
		pstmt.setString(4, Npassword);
		pstmt.executeUpdate();
		System.out.println("1"+midx);
		System.out.println("2"+Ntitle);
		System.out.println("3"+Ncontents);
		System.out.println("4"+Npassword);
	}catch(SQLException e) {
		e.printStackTrace();
		
	}
	
	
	
	return a; 
}


public NoticeVo SelectOne(int Nidx) {
	NoticeVo nv =null; 
	String sql="select * from table_member join table_notice on table_member.midx = table_notice.midx and  Nidx=?";
	
	ResultSet rs = null;
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Nidx);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			nv = new NoticeVo(); 
			nv.setNIDX(rs.getInt("Nidx"));
			nv.setNTITLE(rs.getString("Ntitle"));
			nv.setNAME(rs.getString("Name"));
			nv.setMIDX(rs.getInt("Midx"));
			nv.setNCONTENTS(rs.getString("Ncontents"));
			nv.setNDATE(rs.getString("NDate"));
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
	
	
	
	
	
	return nv; 
}
	
public int Update(String Ntitle, String Ncontents, int Nidx) {
	int value= 0; 
	String sql="update Table_Notice set Ntitle=?,Ncontents=? where Nidx=?";
	
	try {
		pstmt =conn.prepareStatement(sql);
		pstmt.setString(1, Ntitle);
		pstmt.setString(2, Ncontents);
		pstmt.setInt(3, Nidx);
		pstmt.executeUpdate();
		System.out.println(Nidx);
		
	}catch(SQLException e) {
		
		e.printStackTrace();
	}
	
	
	return value;
}


public int deleteOne(int Nidx, String Npassword) {
	int a =0;
String sql = "update Table_Notice set Ndelyn='N' where Nidx=? and Npassword=?";	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Nidx);
		pstmt.setString(2, Npassword);
		pstmt.executeUpdate();
		
	}catch(SQLException e) {
		e.printStackTrace();
	}









	return a;
}
	
public int Total(String keyword) {
	int cnt = 0;
	ResultSet rs = null;
	String sql = "select count(*) as cnt from Table_Notice where Ndelyn='Y' and Ntitle like ?";
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






}







