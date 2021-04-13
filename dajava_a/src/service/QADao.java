package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dbconn.Dbconn;
import domain.SearchCriteria;

public class QADao {

	private Connection conn;
	private PreparedStatement pstmt;
	
	
public QADao(){
	Dbconn dbconn = new Dbconn();       
	this.conn= dbconn.getConnection();
}	
	
	
public ArrayList<QAVo> SelectAll(SearchCriteria scri){
	ArrayList<QAVo> alist = new ArrayList<QAVo>(); 
    String sql= "select * from table_member a join table_QA b on a.midx = b.midx inner join table_room c on b.ridx = c.ridx and b.Qdelyn='Y' and b.Qtitle like ? order by b.QORIGINQIDX desc, b.Qdepth asc limit ?,?";
	ResultSet rs =null;
	try {
		pstmt= conn.prepareStatement(sql);
		
		pstmt.setString(1, "%"+scri.getKeyword()+"%");
		
		pstmt.setInt(2, (scri.getPage()-1)*10);
		pstmt.setInt(3, scri.getPage()*10);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			QAVo rv = new QAVo(); 
			rv.setQIDX(rs.getInt("QIDX"));
			rv.setMIDX(rs.getInt("MIDX"));
			rv.setQDATE(rs.getString("QDATE"));
			rv.setQTITLE(rs.getString("QTITLE"));
			rv.setNAME(rs.getString("NAME"));
			rv.setRIDX(rs.getInt("RIDX"));
			rv.setROOMNUM(rs.getString("ROOMNUM"));
			rv.setQLEVEL(rs.getInt("QLEVEL"));
			rv.setQDEPTH(rs.getInt("QDEPTH"));
			rv.setQORIGINQIDX(rs.getInt("QORIGINQIDX"));
			alist.add(rv);
			
		}
		
		
	}catch(SQLException e) {
		e.printStackTrace();
		
	}

	
	
	
	
	return alist; 
}
public int Total(String keyword) {
	int cnt = 0;
	ResultSet rs = null;
	String sql = "select count(*) as cnt from Table_QA where Qdelyn='Y' and Qtitle like ?";
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
	
public int Insert(String Qtitle, String Qcontents, String ridx, String midx,String QPassword,String Qdate) {
	int a = 0;
	String sql = 
			"insert into Table_QA(Qoriginqidx,Qdepth,Qlevel,Qtitle,Qcontents,Midx,Ridx,QPassword,Qdate)"
			+ "values((select IFNULL(max(qoriginqidx)+1, 1)FROM Table_qa q),0,0,?,?,?,?,?,NOW())";
	try {
		pstmt = conn.prepareStatement(sql);
	
		
		pstmt.setString(1, Qtitle);
		pstmt.setString(2, Qcontents);
		pstmt.setString(3, midx);
		pstmt.setString(4, ridx);
		pstmt.setString(5, QPassword);
		pstmt.executeUpdate();
		
		
	}catch(SQLException e) {
		e.printStackTrace();
		
	}
	

	
	return a; 
}
		
public QAVo SelectOne(int Qidx) {
	QAVo qv =null; 
	String sql="select * from table_member a join table_QA b on a.midx = b.midx inner join table_room c on b.ridx = c.ridx and  Qidx=?";

	ResultSet rs = null;
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Qidx);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			qv = new QAVo(); 
			qv.setQIDX(rs.getInt("Qidx"));
			qv.setQTITLE(rs.getString("Qtitle"));
			qv.setNAME(rs.getString("Name"));
			qv.setQCONTENTS(rs.getString("Qcontents"));
			qv.setQDATE(rs.getString("QDate"));
			qv.setMIDX(rs.getInt("Midx"));
			qv.setRIDX(rs.getInt("Ridx"));
			qv.setROOMNUM(rs.getString("Roomnum"));
		    qv.setQORIGINQIDX(rs.getInt("QORIGINQIDX"));
			qv.setQDEPTH(rs.getInt("Qdepth"));
			qv.setQLEVEL(rs.getInt("Qlevel"));
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
	
	
	
	
	
	return qv; 
}
		
public int Update(String Qtitle, String Qcontents,String Ridx, int Qidx) {
	int value= 0; 
	String sql="update Table_QA set Qtitle=?,Qcontents=?,Ridx=? where Qidx=?";
	
	try {
		pstmt =conn.prepareStatement(sql);
		pstmt.setString(1, Qtitle);
		pstmt.setString(2, Qcontents);
		pstmt.setString(3, Ridx);
		pstmt.setInt(4, Qidx);
		pstmt.executeUpdate();
		
		
	}catch(SQLException e) {
		
		e.printStackTrace();
	}
	
	
	return value;
}	
public int deleteOne(int Qidx, String QPassword) {
	int a =0;
String sql = "update Table_QA set Qdelyn='N' where Qidx=? and QPassword=?";	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Qidx);
		pstmt.setString(2, QPassword);
		pstmt.executeUpdate();
		
	}catch(SQLException e) {
		e.printStackTrace();
	}









	return a;
}
public int QaRE(int QoriginQidx, int Qlevel, int Qdepth, String Qtitle, String Qcontents, String Qpassword,String Midx,String Ridx,String Qdate) {
	int value=0;
	
	String sql1 = "update Table_QA set Qdepth =Qdepth+1 where QoriginQidx =? and Qdepth > ?";
	String sql2 = "insert into Table_QA(QORIGINQIDX,QLEVEL,QDEPTH,Qtitle,QCONTENTS,QPASSWORD,MIDX,Ridx,Qdate)VALUES(?,?,?,?,?,?,?,?,NOW())";
	try {
	conn.setAutoCommit(false);	
	pstmt=conn.prepareStatement(sql1);
	pstmt.setInt(1, QoriginQidx);
	pstmt.setInt(2, Qdepth);
	pstmt.executeUpdate();	
	
	pstmt=conn.prepareStatement(sql2);	
	pstmt.setInt(1, QoriginQidx);
	pstmt.setInt(2, Qlevel+1);	
	pstmt.setInt(3, Qdepth+1);
	pstmt.setString(4, Qtitle);
	pstmt.setString(5, Qcontents);
	pstmt.setString(6, Qpassword);
	pstmt.setString(7, Midx);
	pstmt.setString(8, Ridx);
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
