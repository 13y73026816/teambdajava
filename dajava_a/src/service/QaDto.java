package service;

public class QaDto {
	
	private int qidx;
	private String qtitle;
	private String qdate;
	private int qoriginqidx;
	private int qdepth;
	private int qlevel;
	private int midx;
	private int ridx;
	private String qdelyn;
	private String roomnum;
	private String name;
	private String qcontents;
	private String qpassword;
	
	public int getQoriginqidx() {
		return qoriginqidx;
	}
	public void setQoriginqidx(int qoriginqidx) {
		this.qoriginqidx = qoriginqidx;
	}
	public String getQcontents() {
		return qcontents;
	}
	public void setQcontents(String qcontents) {
		this.qcontents = qcontents;
	}
	public String getQpassword() {
		return qpassword;
	}
	public void setQpassword(String qpassword) {
		this.qpassword = qpassword;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRoomnum() {
		return roomnum;
	}
	public void setRoomnum(String roomnum) {
		this.roomnum = roomnum;
	}
	public int getQidx() {
		return qidx;
	}
	public void setQidx(int qidx) {
		this.qidx = qidx;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	
	public int getQdepth() {
		return qdepth;
	}
	public void setQdepth(int qdepth) {
		this.qdepth = qdepth;
	}
	public int getQlevel() {
		return qlevel;
	}
	public void setQlevel(int qlevel) {
		this.qlevel = qlevel;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public String getQdelyn() {
		return qdelyn;
	}
	public void setQdelyn(String qdelyn) {
		this.qdelyn = qdelyn;
	}
		
}
