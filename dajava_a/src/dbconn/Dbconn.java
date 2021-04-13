package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconn {
	
	Connection conn=null;
	
	String coninfo = "jdbc:mysql://jjezen.cafe24.com/ezen20211123_b"; //접속정보 : 외워야 하는것
	String idinfo = "user_B";
	String pwdinfo = "user1234!!";
	
	
	public Connection getConnection() {                                       //DB와 연결하는 클라스
		try {
			                                       
			Class.forName("com.mysql.jdbc.Driver");                 //드라이버에서 OracleDriver를 찾는다
			conn = DriverManager.getConnection(coninfo, idinfo, pwdinfo);     //DriverManager클래스통해 접속정보를 가지고 연결한다 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}

}
