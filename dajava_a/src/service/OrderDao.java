package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.Dbconn;

public class OrderDao {

	private Connection conn;
	private PreparedStatement pstmt;
	
	
public OrderDao(){
	Dbconn dbconn = new Dbconn();       
	this.conn = dbconn.getConnection();		
}	


	
public ArrayList<OrderVo> SelectOrderAll(){
	ResultSet rs = null;
	ArrayList<OrderVo> order_alist = new ArrayList<OrderVo>();
	String sql ="select OIDX, RIDX, TO_CHAR(OSTART,'yyyymmdd') as OSTART, TO_CHAR(OEND,'yyyymmdd') as OEND, OSTATE from table_order";
	
	
try {	
	pstmt = conn.prepareStatement(sql);
//	pstmt.executeQuery();
	rs = pstmt.executeQuery();
	
	while(rs.next()) {
		OrderVo ov = new OrderVo();
		ov.setOidx(rs.getInt("OIDX"));		
		ov.setRidx(rs.getInt("RIDX"));
		ov.setOstart(rs.getString("OSTART"));
		ov.setOend(rs.getString("OEND"));
		ov.setOstate(rs.getString("OSTATE"));
		order_alist.add(ov);
	}
	
}catch(SQLException e) {
	
	e.printStackTrace();
	
	
	
} finally {
	try {
		rs.close();
		pstmt.close();
		conn.close();
	} catch (SQLException e) {			
		e.printStackTrace();
	}
				
}


return  order_alist ;
}



public int orderInsert(int midx, String ostart,String oend,String ridx, String person, String totalprice){
	int exec = 0;	
	int oidx = 0;
	ResultSet rs2 = null;
	try{
		
		String sql ="insert into table_order(oidx,midx,ostart,oend,ostate,ridx,person,totalprice) values(oidx_seq.nextval,?,to_date(?,'YYYY-MM-DD'),to_date(?,'YYYY-MM-DD'),'N',?,?,?)";
		pstmt = conn.prepareStatement(sql);


			pstmt.setInt(1, midx);
			pstmt.setString(2, ostart);
			pstmt.setString(3, oend);
			pstmt.setString(4, ridx);
			pstmt.setString(5, person);
			pstmt.setString(6, totalprice);
			//pstmt.setInt(3, person);
			//pstmt.setInt(4, price);
			
			
			exec = pstmt.executeUpdate();	
			if(exec>-1) {
				String sql2 ="select max(oidx) as oidx from table_order";
				pstmt = conn.prepareStatement(sql2);
				rs2 = pstmt.executeQuery();
				rs2.next();
				oidx = rs2.getInt("oidx");
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			try {
				rs2.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return oidx;
	} 

public int payInsert(String oidxArray2, String pname, int point){
	int exec = 0;	
	System.out.println("oidxArray2"+oidxArray2);
	try{
		
		String sql ="insert into table_pay(oidx,pidx,pname,point) values(?,pidx_seq.nextval,?,?)";
		pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, oidxArray2);
			pstmt.setString(2, pname);
			pstmt.setInt(3, point);                                                                                                   			
		
			exec = pstmt.executeUpdate();	
								
	}catch (Exception e){
		e.printStackTrace();
	}
	return exec;
	}


public int orderUpdate(String oidxArray2) {
	int exec = 0;	
	
	try{
					
		String sql = "update table_order set ostate='Y' where oidx=?";	
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, oidxArray2);                                                                                                      			
		
			exec = pstmt.executeUpdate();	
									
	}catch (Exception e){
		e.printStackTrace();
	}
	return exec;
	}

}
