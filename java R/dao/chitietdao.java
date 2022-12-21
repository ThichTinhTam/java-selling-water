package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class chitietdao {
	public int Them(String manuoc, long soluongmua, long mahd) {
		try {
			KetNoi kn= new KetNoi();
			kn.KetNoi();
			String sql="insert into ChiTietHoaDon(MaNuoc,SoLuongMua, MaHoadon,damua) values(?,?,?,?)";
			PreparedStatement cmd= kn.cn.prepareStatement(sql);
			cmd.setString(1, manuoc);
			cmd.setLong(2, soluongmua);
			cmd.setLong(3, mahd);
			cmd.setBoolean(4, false);
			int kq=cmd.executeUpdate();
			kn.cn.close();
			return kq;
		} catch (Exception e) {
			e.printStackTrace();return 0;
		}
}
	public long getthongke() {
		try {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			
			String sql="select count(*) from ChiTietHoaDon";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
    		ResultSet rs = cmd.executeQuery();
    		while(rs.next()) {
    			return rs.getLong(1);
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	public long gettongtienthuvao() {
		try {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			
			String sql="select sum(thanhtien) from VTKKK";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
    		ResultSet rs = cmd.executeQuery();
    		while(rs.next()) {
    			return rs.getLong(1);
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
}
