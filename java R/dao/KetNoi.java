package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class KetNoi {
    public Connection cn;
    public void KetNoi() {
    	try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			System.out.print("Xong b1");
			String url="jdbc:sqlserver://DESKTOP-FF1278R:1433;databaseName=QlNuoc; user=sa; password=18072002";
			cn= DriverManager.getConnection(url);
			System.out.println("xong b2");
		} catch ( Exception e) {
			e.printStackTrace();
		}
    }
	public static void main(String[] args) {

    KetNoi kn=new KetNoi();
    kn.KetNoi();

	}

}
