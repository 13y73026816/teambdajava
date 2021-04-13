package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dbconn.Dbconn;


public class RoomDao {


	private Connection conn;
	private PreparedStatement pstmt;
	
	
public RoomDao(){
	Dbconn dbconn = new Dbconn();       
	this.conn = dbconn.getConnection();		
}	


public RoomVo SelectOne(int Ridx) {
	RoomVo rv = new RoomVo();
    ResultSet rs =null;
	String sql = "select * from Table_room where RIDX=?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Ridx);
		rs =pstmt.executeQuery();
		 
		 if(rs.next()) {
			 
			 rv= new RoomVo();
			 rv.setRoomnum(rs.getString("ROOMNUM"));
			 rv.setRbaseprice(rs.getString("RBASEPRICE"));
			 rv.setRbaseperson(rs.getString("RBASEPERSON"));
			 rv.setRaddperson(rs.getString("RADDPERSON"));
		 }
	}catch(SQLException e) {
		e.printStackTrace();
		
	}
	
	return rv;
}



public ArrayList<RoomVo> SelectRoomAll(){
	 
	ArrayList<RoomVo> room_alist = new ArrayList<RoomVo>();
	String sql ="select * from table_room where roomnum like '%A%'";
	
	
try {	
	pstmt = conn.prepareStatement(sql);
	pstmt.executeQuery();
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		RoomVo rv = new RoomVo();
		rv.setRidx(rs.getInt("RIDX"));
		rv.setRoomnum(rs.getString("ROOMNUM"));
		rv.setRbaseperson(rs.getString("RBASEPERSON"));
		rv.setRaddperson(rs.getString("RADDPERSON"));
		rv.setRbaseprice(rs.getString("RBASEPRICE"));
		rv.setRfullperson(rs.getString("RFULLPERSON"));
		rv.setRfile(rs.getString("RFILE"));
		room_alist.add(rv);
	}
	
}catch(SQLException e) {
	
	e.printStackTrace();
			
}

return  room_alist ;
}



public ArrayList<RoomVo> SelectRoomAll1(){
	 
	ArrayList<RoomVo> room_alist1 = new ArrayList<RoomVo>();
	String sql ="select * from table_room where roomnum like '%B%'";
	
	
try {	
	pstmt = conn.prepareStatement(sql);
	pstmt.executeQuery();
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		RoomVo rv = new RoomVo();
		rv.setRidx(rs.getInt("RIDX"));
		rv.setRoomnum(rs.getString("ROOMNUM"));
		rv.setRbaseperson(rs.getString("RBASEPERSON"));
		rv.setRaddperson(rs.getString("RADDPERSON"));
		rv.setRbaseprice(rs.getString("RBASEPRICE"));
		rv.setRfullperson(rs.getString("RFULLPERSON"));
		rv.setRfile(rs.getString("RFILE"));
		room_alist1.add(rv);
	}
	
}catch(SQLException e) {
	
	e.printStackTrace();
			
}

return  room_alist1 ;
}


public ArrayList<RoomVo> SelectRoomAll2(){
	 
	ArrayList<RoomVo> room_alist2 = new ArrayList<RoomVo>();
	String sql ="select * from table_room where roomnum like '%C%'";
	
	
try {	
	pstmt = conn.prepareStatement(sql);
	pstmt.executeQuery();
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		RoomVo rv = new RoomVo();
		rv.setRidx(rs.getInt("RIDX"));
		rv.setRoomnum(rs.getString("ROOMNUM"));
		rv.setRbaseperson(rs.getString("RBASEPERSON"));
		rv.setRaddperson(rs.getString("RADDPERSON"));
		rv.setRbaseprice(rs.getString("ROFFSEASON1"));
		rv.setRfullperson(rs.getString("RFULLPERSON"));
		rv.setRfile(rs.getString("RFILE"));
		room_alist2.add(rv);
	}
	
}catch(SQLException e) {
	
	e.printStackTrace();
			
}

return  room_alist2 ;
}


public ArrayList<RoomVo> SelectRoomAll3(){
	 
	ArrayList<RoomVo> room_alist3 = new ArrayList<RoomVo>();
	String sql ="select * from table_room where roomnum not like '%A%' and roomnum not like '%B%' and roomnum not like '%C%'";
	
	
try {	
	pstmt = conn.prepareStatement(sql);
	pstmt.executeQuery();
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		RoomVo rv = new RoomVo();
		rv.setRidx(rs.getInt("RIDX"));
		rv.setRoomnum(rs.getString("ROOMNUM"));
		rv.setRbaseperson(rs.getString("RBASEPERSON"));
		rv.setRaddperson(rs.getString("RADDPERSON"));
		rv.setRbaseprice(rs.getString("ROFFSEASON1"));
		rv.setRfullperson(rs.getString("RFULLPERSON"));
		rv.setRfile(rs.getString("RFILE"));
		room_alist3.add(rv);
	}
	
}catch(SQLException e) {
	
	e.printStackTrace();
			
}

return  room_alist3 ;
}

}

