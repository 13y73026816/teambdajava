package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.Dbconn;
import domain.SearchCriteria;

public class BmypageDao {
	private Connection conn;
	private PreparedStatement pstmt;

	public BmypageDao() {
		Dbconn dbconn = new Dbconn();
		this.conn = dbconn.getConnection();
	}

	public int memberTotal(String keyword) {
		int cnt = 0;
		ResultSet rs = null;

		String sql = "select count(*) as cnt from table_member where delyn='Y' and name like ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				// conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return cnt;
	}

	public int orderTotal_canc(String keyword) {
		int cnt = 0;
		ResultSet rs = null;

		String sql = "select count(*) as cnt from table_order o, table_member m where not o.cstate is null and m.midx=o.midx and m.name like ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		/*
		 * finally { try { rs.close(); pstmt.close(); // conn.close(); } catch
		 * (SQLException e) { e.printStackTrace(); } }
		 */
		return cnt;
	}

	public int orderTotal_pres(String keyword) {
		int cnt = 0;
		ResultSet rs = null;

		String sql = "select count(*) as cnt from table_order o, table_member m where m.midx=o.midx and o.ostart >= date_format(sysdate(),'%Y-%m-%d') and o.cstate is null and m.name like ?";
		try {         
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		/*
		 * finally { try {  rs.close();  pstmt.close(); } catch (SQLException e) {
		 * e.printStackTrace(); } }
		 */

		return cnt;
	}

	public int orderTotal_past(String keyword) {
		int cnt = 0;
		ResultSet rs = null;

		String sql = "select count(*) as cnt from table_order o, table_member m where m.midx=o.midx and o.ostart < date_format(sysdate(),'%Y-%m-%d') and o.cstate is null and m.name like ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		/*
		 * finally { try { rs.close(); pstmt.close(); } catch (SQLException e) {
		 * e.printStackTrace(); } }
		 */

		return cnt;
	}

	public ArrayList<MypageVo> memberSelectAll(SearchCriteria scri) {

		ArrayList<MypageVo> alist = new ArrayList<MypageVo>();
		ResultSet rs = null;

		String sql = "select id,name,phone,email,birthday,enter from table_member where delyn='Y' and name like ? order by id limit ?,?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + scri.getKeyword() + "%");
			pstmt.setInt(2, (scri.getPage() - 1) * 10);
			pstmt.setInt(3, scri.getPage() * 10);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MypageVo mpv = new MypageVo();
				mpv.setId(rs.getString("id"));
				mpv.setName(rs.getString("name"));
				mpv.setPhone(rs.getString("phone"));
				mpv.setEmail(rs.getString("email"));
				mpv.setBirthday(rs.getInt("birthday"));
				mpv.setEnter(rs.getString("enter"));
				alist.add(mpv);
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

	
	  public ArrayList<MypageVo> sort_za(SearchCriteria scri) {
	  
		  ArrayList<MypageVo> alist = new ArrayList<MypageVo>(); 
		  ResultSet rs = null;
		  
		  String sql = "select id,name,phone,email,birthday,enter from table_member where delyn='Y' and name like ? order by enter desc limit ?,?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + scri.getKeyword() + "%");
				pstmt.setInt(2, (scri.getPage() - 1) * 10);
				pstmt.setInt(3, scri.getPage() * 10);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					MypageVo mpv = new MypageVo();
					mpv.setId(rs.getString("id"));
					mpv.setName(rs.getString("name"));
					mpv.setPhone(rs.getString("phone"));
					mpv.setEmail(rs.getString("email"));
					mpv.setBirthday(rs.getInt("birthday"));
					mpv.setEnter(rs.getString("enter"));
					alist.add(mpv);
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
	  
	  public ArrayList<MypageVo> sort_az(SearchCriteria scri) {
	  
		  ArrayList<MypageVo> alist = new ArrayList<MypageVo>(); 
		  ResultSet rs = null;
		  
		  String sql = "select id,name,phone,email,birthday,enter from table_member where delyn='Y' and name like ? order by enter asc limit ?,?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + scri.getKeyword() + "%");
				pstmt.setInt(2, (scri.getPage() - 1) * 10);
				pstmt.setInt(3, scri.getPage() * 10);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					MypageVo mpv = new MypageVo();
					mpv.setId(rs.getString("id"));
					mpv.setName(rs.getString("name"));
					mpv.setPhone(rs.getString("phone"));
					mpv.setEmail(rs.getString("email"));
					mpv.setBirthday(rs.getInt("birthday"));
					mpv.setEnter(rs.getString("enter"));
					alist.add(mpv);
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
	  
	 
	public int roomModify(String rbaseperson, String rfullperson, String rbaseprice, String raddperson, String rsupply,
			String roffseason1, String roffseason2, String rbusyseason1, String rbusyseason2,String fileName, String roomnum) {
		int exec = 0;
		
		String sql = "update table_room set rbaseperson=?, rfullperson=?, rbaseprice=?, raddperson=?, rsupply=?,roffseason1=?,roffseason2=?,rbusyseason1=?,rbusyseason2=? , rfile=? where roomnum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rbaseperson);
			pstmt.setString(2, rfullperson);
			pstmt.setString(3, rbaseprice);
			pstmt.setString(4, raddperson);
			pstmt.setString(5, rsupply);
			pstmt.setString(6, roffseason1);
			pstmt.setString(7, roffseason2);
			pstmt.setString(8, rbusyseason1);
			pstmt.setString(9, rbusyseason2);
			pstmt.setString(10, fileName);
			pstmt.setString(11, roomnum);
			exec = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return exec;
	}

	public RoomVo roomSelectOne(String roomnum) {
		RoomVo rv = null;
		ResultSet rs = null;
		String sql = "select ridx,rbaseperson,rfullperson,rbaseprice,raddperson,roffseason1,roffseason2,rbusyseason1,rbusyseason2,rsupply,rfile,roomnum from table_room where roomnum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, roomnum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				rv = new RoomVo();
				rv.setRidx(rs.getInt("ridx"));
				rv.setRbaseperson(rs.getString("rbaseperson"));
				rv.setRfullperson(rs.getString("rfullperson"));
				rv.setRbaseprice(rs.getString("rbaseprice"));
				rv.setRaddperson(rs.getString("raddperson"));
				rv.setRoffseason1(rs.getString("roffseason1"));
				rv.setRoffseason2(rs.getString("roffseason2"));
				rv.setRbusyseason1(rs.getString("rbusyseason1"));
				rv.setRbusyseason2(rs.getString("rbusyseason2"));
				rv.setRsupply(rs.getString("rsupply"));
				rv.setRfile(rs.getString("rfile"));
				rv.setRoomnum(rs.getString("roomnum"));
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

		return rv;
	}

	public int infoModify(String id, String email, String password, String phone, String addr, String midx) {

		int exec = 0;

		String sql = "update table_member set id=?, email=?, password=?, phone=?, addr=? where midx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, password);
			pstmt.setString(4, phone);
			pstmt.setString(5, addr);
			pstmt.setString(6, midx);

			exec = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return exec;
	}

	public int ostateModify(int oidx) {

		int exec = 0;
		String sql = "update table_order set ostate='C' where oidx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oidx);

			exec = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return exec;
	}

	public int cstateModify(int oidx) {

		int exec = 0;
		String sql = "update table_order set ostate='F', cstate='C' where oidx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oidx);

			exec = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return exec;
	}

	public ArrayList<OrderDto> breservePres(SearchCriteria scri) {

		ArrayList<OrderDto> alist = new ArrayList<OrderDto>();
		ResultSet rs = null;

		String sql = "select m.name, m.phone,r.roomnum, o.oidx, o.ostart, o.oend, o.ostate, o.cstate from table_member m, table_room r, table_order o where o.ostart >= date_format(sysdate(),'%Y-%m-%d') and o.cstate is null and r.ridx=o.ridx and m.midx=o.midx and m.delyn='Y' and m.name like ? limit ?,?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + scri.getKeyword() + "%");
			pstmt.setInt(2, (scri.getPage() - 1) * 10);
			pstmt.setInt(3, scri.getPage() * 10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDto od = new OrderDto();
				od.setName(rs.getString("name"));
				od.setPhone(rs.getString("phone"));
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

	public ArrayList<OrderDto> breservePast(SearchCriteria scri) {

		ArrayList<OrderDto> alist = new ArrayList<OrderDto>();
		ResultSet rs = null;

		String sql = "select m.name, m.phone,r.roomnum, o.ostart, o.oend, o.ostate from table_member m, table_room r, table_order o where o.ostart < date_format(sysdate(),'%Y-%m-%d') and o.cstate is null and r.ridx=o.ridx and m.midx=o.midx and m.delyn='Y' and m.name like ? limit ?,?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + scri.getKeyword() + "%");
			pstmt.setInt(2, (scri.getPage() - 1) * 10);
			pstmt.setInt(3, scri.getPage() * 10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDto od = new OrderDto();
				od.setName(rs.getString("name"));
				od.setPhone(rs.getString("phone"));
				od.setRoomnum(rs.getString("roomnum"));
				od.setOstart(rs.getString("ostart"));
				od.setOend(rs.getString("oend"));
				od.setOstate(rs.getString("ostate"));
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

	public ArrayList<OrderDto> sort_321(SearchCriteria scri) {

		ArrayList<OrderDto> alist = new ArrayList<OrderDto>();
		ResultSet rs = null;

		String sql = "select m.name, m.phone,r.roomnum, o.ostart, o.oend, o.ostate from table_member m, table_room r, table_order o where o.ostart < date_format(sysdate(),'%Y-%m-%d') and o.cstate is null and r.ridx=o.ridx and m.midx=o.midx and m.delyn='Y' and m.name like ? order by o.ostart desc limit ?,?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + scri.getKeyword() + "%");
			pstmt.setInt(2, (scri.getPage() - 1) * 10);
			pstmt.setInt(3, scri.getPage() * 10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDto od = new OrderDto();
				od.setName(rs.getString("name"));
				od.setPhone(rs.getString("phone"));
				od.setRoomnum(rs.getString("roomnum"));
				od.setOstart(rs.getString("ostart"));
				od.setOend(rs.getString("oend"));
				od.setOstate(rs.getString("ostate"));
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

	public ArrayList<OrderDto> sort_123(SearchCriteria scri) {

		ArrayList<OrderDto> alist = new ArrayList<OrderDto>();
		ResultSet rs = null;

		String sql = "select m.name, m.phone,r.roomnum, o.ostart, o.oend, o.ostate from table_member m, table_room r, table_order o where o.ostart < date_format(sysdate(),'%Y-%m-%d') and o.cstate is null and r.ridx=o.ridx and m.midx=o.midx and m.delyn='Y' and m.name like ? order by o.ostart asc limit ?,?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + scri.getKeyword() + "%");
			pstmt.setInt(2, (scri.getPage() - 1) * 10);
			pstmt.setInt(3, scri.getPage() * 10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDto od = new OrderDto();
				od.setName(rs.getString("name"));
				od.setPhone(rs.getString("phone"));
				od.setRoomnum(rs.getString("roomnum"));
				od.setOstart(rs.getString("ostart"));
				od.setOend(rs.getString("oend"));
				od.setOstate(rs.getString("ostate"));
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

	
	
	public ArrayList<OrderDto> breserveCanc(SearchCriteria scri) {

		ArrayList<OrderDto> alist = new ArrayList<OrderDto>();
		ResultSet rs = null;

		String sql = "select m.name, m.phone,r.roomnum, o.ostart, o.oend, o.ostate, o.cstate from table_member m, table_room r, table_order o where not o.cstate is null and r.ridx=o.ridx and m.midx=o.midx and m.delyn='Y' and m.name like ? limit ?,?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + scri.getKeyword() + "%");
			pstmt.setInt(2, (scri.getPage() - 1) * 10);
			pstmt.setInt(3, scri.getPage() * 10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDto od = new OrderDto();
				od.setName(rs.getString("name"));
				od.setPhone(rs.getString("phone"));
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
	
	public ArrayList<OrderDto> cancSort_123(SearchCriteria scri) {

		ArrayList<OrderDto> alist = new ArrayList<OrderDto>();
		ResultSet rs = null;

		String sql = "select m.name, m.phone,r.roomnum, o.ostart, o.oend, o.ostate, o.cstate from table_member m, table_room r, table_order o where not o.cstate is null and r.ridx=o.ridx and m.midx=o.midx and m.delyn='Y' and m.name like ? order by o.ostart desc limit ?,?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + scri.getKeyword() + "%");
			pstmt.setInt(2, (scri.getPage() - 1) * 10);
			pstmt.setInt(3, scri.getPage() * 10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDto od = new OrderDto();
				od.setName(rs.getString("name"));
				od.setPhone(rs.getString("phone"));
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
	
	public ArrayList<OrderDto> cancSort_321(SearchCriteria scri) {

		ArrayList<OrderDto> alist = new ArrayList<OrderDto>();
		ResultSet rs = null;

		String sql = "select m.name, m.phone,r.roomnum, o.ostart, o.oend, o.ostate, o.cstate from table_member m, table_room r, table_order o where not o.cstate is null and r.ridx=o.ridx and m.midx=o.midx and m.delyn='Y' and m.name like ? order by o.ostart asc limit ?,?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + scri.getKeyword() + "%");
			pstmt.setInt(2, (scri.getPage() - 1) * 10);
			pstmt.setInt(3, scri.getPage() * 10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDto od = new OrderDto();
				od.setName(rs.getString("name"));
				od.setPhone(rs.getString("phone"));
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
	
	public int loginCheck(String id, String password) {
		String sql = "select count(*) as cnt from table_member where id=? and password=?";
		int value = 0;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				value = rs.getInt("cnt");
			}
		} catch (Exception e) {
			System.out.println("행당하는 사람이 존재하지 않습니다.");
		} finally {
			try {
				pstmt.close();
				// conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return value;
	}

	public MypageVo loginCheck1(String id, String password) {
		MypageVo mv = null;
		ResultSet rs = null;

		String sql = "select name, midx, grade from table_member where id=? and password=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				mv = new MypageVo();
				mv.setMidx(rs.getInt("midx"));
				mv.setName(rs.getString("name"));
				mv.setGrade(rs.getString("grade"));
			}
		} catch (Exception e) {
			System.out.println("행당하는 사람이 존재 않습니다.");
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
	
	public int memberDel(String id){
		int exec = 0;
		
		try{
						
			String sql ="update table_member set delyn='N' where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
				
			exec = pstmt.executeUpdate();	
			
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return exec;
	} 
	
}