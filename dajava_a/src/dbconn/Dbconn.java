package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconn {
	
	Connection conn=null;
	
	String coninfo = "jdbc:mysql://jjezen.cafe24.com/ezen20211123_b"; //�������� : �ܿ��� �ϴ°�
	String idinfo = "user_B";
	String pwdinfo = "user1234!!";
	
	
	public Connection getConnection() {                                       //DB�� �����ϴ� Ŭ��
		try {
			                                       
			Class.forName("com.mysql.jdbc.Driver");                 //����̹����� OracleDriver�� ã�´�
			conn = DriverManager.getConnection(coninfo, idinfo, pwdinfo);     //DriverManagerŬ�������� ���������� ������ �����Ѵ� 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}

}
