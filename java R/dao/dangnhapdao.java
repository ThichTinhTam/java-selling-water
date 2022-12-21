package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class dangnhapdao {
    public static boolean checklogin(String un, String pass) {
    	boolean isValid = false;
    try {
    	 
    	 String url = "jdbc:sqlserver://DESKTOP-FF1278R:1433;databaseName=QlNuoc; user=sa; password=18072002";
		  Connection cn = DriverManager.getConnection(url);
		  String sql = "select * from KhachHang where tendn = ? and pass = ?";
		  PreparedStatement stm = cn.prepareStatement(sql);
		  stm.setString(1, un);
		  stm.setString(2, pass);
		  ResultSet rs = stm.executeQuery();
    	 if(rs.next()) {
    		 isValid = true;
    	 }else {
    		 isValid = false;
    	 }
	} catch (Exception e) {
		e.printStackTrace();
	}
	return isValid;

    }
    public boolean signup(String fullName, String email, String userName, String password) {
		// Kn DB
    	KetNoi kn = new KetNoi();
		kn.KetNoi();
		
		int rs = 0;

		try {
			// Get data
			String sql = "insert into KhachHang(hoten,email,tendn,pass) values(?,?,?,?)";
			PreparedStatement preStatement = kn.cn.prepareStatement(sql);
			preStatement.setString(1, fullName);
			preStatement.setString(2, email);
			preStatement.setString(3, userName);
			preStatement.setString(4, password);
			rs = preStatement.executeUpdate();
			preStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs > 0;

	}
}
