package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.Dbconn;

public class MypageDao {       
	private Connection conn;  
	private PreparedStatement pstmt;  
	
	public MypageDao() {
		Dbconn dbconn = new Dbconn();       
		this.conn= dbconn.getConnection();
	}
	
	public int memberInsert(String id,String password, String email,String name,String phone,String addr, int birthday){
		int exec = 0;	
		try{
			
			String sql ="insert into table_member( id, password, email, name, phone, addr, birthday) values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				pstmt.setString(3, email);
				pstmt.setString(4, name);
				pstmt.setString(5, phone);
				pstmt.setString(6, addr);
				pstmt.setInt(7, birthday);
			exec = pstmt.executeUpdate();	
		}catch (Exception e){
			e.printStackTrace();
		} 
		return exec;
	} 
	
	public MypageVo memberSelectOneInfo(int midx) {
		MypageVo mv= null;
		ResultSet rs = null;
		
		String sql="select midx,id,password,email,phone,addr,name,grade from table_member where midx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,midx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {                              
				mv = new MypageVo();
				
				mv.setId(rs.getString("id"));
				mv.setPassword(rs.getString("password"));
				mv.setEmail(rs.getString("email"));
				mv.setName(rs.getString("name"));
				mv.setPhone(rs.getString("phone"));
				mv.setAddr(rs.getString("addr"));
				mv.setGrade(rs.getString("grade"));
				mv.setMidx(rs.getInt("midx"));
				
			}
			
		} catch (SQLException e) {
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
		return mv;
	}
	
	public ArrayList<OrderDto> reservePast(int midx) {
		
		ArrayList<OrderDto> alist = new ArrayList<OrderDto>();   
		ResultSet rs = null;
		
		String sql="select m.name,r.roomnum, o.ostart, o.oend, o.ostate, o.cstate from table_member m,table_room r, table_order o where  o.ostart < date_format(sysdate(),'%Y-%m-%d') and o.cstate is null and m.midx=o.midx and r.ridx=o.ridx and o.midx=?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,midx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {                              
				OrderDto od = new OrderDto();
				od.setName(rs.getString("name"));
				od.setRoomnum(rs.getString("roomnum"));
				od.setOstart(rs.getString("ostart"));
				od.setOend(rs.getString("oend"));
				od.setOstate(rs.getString("ostate"));
				od.setCstate(rs.getString("cstate"));
				alist.add(od);
			}
			
		} catch (SQLException e) {
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
		return alist;
	}
	
	public ArrayList<OrderDto> reservePres(int midx) {
		
		ArrayList<OrderDto> alist = new ArrayList<OrderDto>(); 
		ResultSet rs = null;
		
		String sql="select m.name,r.roomnum,o.oidx, o.ostart, o.oend, o.ostate, o.cstate from table_member m,table_room r, table_order o where o.ostart >= date_format(sysdate(),'%Y-%m-%d') and o.cstate is null and m.midx=o.midx and r.ridx=o.ridx and o.midx=?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,midx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {                              
				OrderDto od = new OrderDto();
				od.setName(rs.getString("name"));
				od.setRoomnum(rs.getString("roomnum"));
				od.setOidx(rs.getInt("oidx"));
				od.setOstart(rs.getString("ostart"));
				od.setOend(rs.getString("oend"));
				od.setOstate(rs.getString("ostate"));
				od.setCstate(rs.getString("cstate"));
				alist.add(od);
			}
			
		} catch (SQLException e) {
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
		
		return alist;
	}
	
public ArrayList<OrderDto> reserveCanc(int midx) {
		
		ArrayList<OrderDto> alist = new ArrayList<OrderDto>(); 
		ResultSet rs = null;
		
		String sql="select m.name,r.roomnum, o.ostart, o.oend, o.cstate from table_member m,table_room r, table_order o where not o.cstate is null and m.midx=o.midx and r.ridx=o.ridx and o.midx=?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,midx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {                              
				OrderDto od = new OrderDto();
				od.setName(rs.getString("name"));
				od.setRoomnum(rs.getString("roomnum"));
				od.setOstart(rs.getString("ostart"));
				od.setOend(rs.getString("oend"));
				od.setCstate(rs.getString("cstate"));
				alist.add(od);
			}
		} catch (SQLException e) {
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
		
		return alist;
	}
	
public ArrayList<PointVo> pointMine(int midx) {
		
		ArrayList<PointVo> alist = new ArrayList<PointVo>(); 
		ResultSet rs = null;
		
		String sql="select p.point ,p.pdate,p.ptname from table_pay p, table_order o where not p.point is null and o.oidx=p.oidx and o.midx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,midx);
			rs = pstmt.executeQuery();
			while(rs.next()) {                              
				PointVo pv = new PointVo();
				pv.setPoint(rs.getInt("point"));
				pv.setPdate(rs.getString("pdate"));
				pv.setPtname(rs.getString("ptname"));	
				alist.add(pv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return alist;
	}

	public ArrayList<ReviewDto> reviewMine(int midx, String reidx) {
		
		ArrayList<ReviewDto> alist = new ArrayList<ReviewDto>();
		ResultSet rs = null;
		
		String sql="select r.roomnum, o.ostart, o.oend, re.retitle,re.reidx from table_room r, table_order o, table_review re where r.ridx=o.ridx and o.oidx=re.oidx and o.midx=?";
		             	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,midx);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {                              
				ReviewDto rd = new ReviewDto();
				rd.setRoomnum(rs.getString("roomnum"));
				rd.setOstart(rs.getString("ostart"));
				rd.setOend(rs.getString("oend"));
				rd.setRetitle(rs.getString("retitle"));
				rd.setReidx(rs.getInt("reidx"));
				alist.add(rd);
				
				System.out.println("roomnum : "+rs.getString("roomnum"));
				System.out.println("ostart : "+rs.getString("ostart"));
				System.out.println("oend : "+rs.getString("oend"));
				System.out.println("retitle : "+rs.getString("retitle"));
				System.out.println("reidx : "+rs.getInt("reidx"));
			}
			
		} catch (SQLException e) {
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
		return alist;
	}
	
	public ArrayList<QaDto> qaMine(int midx) {
	
		ArrayList<QaDto> alist = new ArrayList<QaDto>();
		ResultSet rs = null;
		
		String sql="select q.qidx, r.roomnum, q.qdate, q.qoriginqidx, q.qdepth,q.qtitle, q.qlevel " + 
				"from table_room r, table_qa q " + 
				"where r.ridx=q.ridx and q.midx=? order by q.qoriginqidx desc, q.qdepth asc";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,midx);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {                              
				QaDto qd = new QaDto();
				qd.setQidx(rs.getInt("qidx"));
				qd.setRoomnum(rs.getString("roomnum"));
				qd.setQdate(rs.getString("qdate"));
				qd.setQoriginqidx(rs.getInt("qoriginqidx"));
				qd.setQdepth(rs.getInt("qdepth"));
				qd.setQtitle(rs.getString("qtitle"));
				qd.setQlevel(rs.getInt("qlevel"));
				alist.add(qd);
			}
	
		} catch (SQLException e) {
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
		return alist;
	}
	
	public ArrayList<OrderDto> orderSelectAll(String roomnum) {
		
		ArrayList<OrderDto> alist = new ArrayList<OrderDto>();
		ResultSet rs = null;
		
		String sql="select r.rfile,r.rfullperson, r.rbaseperson, r.raddperson, r.rbaseprice, r.rsupply,r.roffseason1, r.roffseason2, r.rbusyseason1,r.rbusyseason2,o.ostart,o.oend,o.ostate from table_room r, table_order o where r.ridx=o.ridx and r.roomnum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,roomnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {     
				
				OrderDto odv = new OrderDto();
				odv.setRfile(rs.getString("rfile"));
				odv.setRoffseason1(rs.getString("roffseason1"));
				odv.setRoffseason2(rs.getString("roffseason2"));
				odv.setRbusyseason1(rs.getString("rbusyseason1"));
				odv.setRbusyseason2(rs.getString("rbusyseason2"));
				odv.setOstart(rs.getString("ostart"));
				odv.setRfullperson(rs.getString("rfullperson"));
				odv.setRbaseperson(rs.getString("rbaseperson"));
				odv.setRaddperson(rs.getString("raddperson"));
				odv.setRbaseprice(rs.getString("rbaseprice"));
				odv.setRsupply(rs.getString("rsupply"));
				odv.setOend(rs.getString("oend"));
				odv.setOstate(rs.getString("ostate"));
				alist.add(odv);
				
			}
			
		} catch (SQLException e) {
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
		return alist;
	}
}