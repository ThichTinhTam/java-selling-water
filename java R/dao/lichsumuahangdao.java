package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import bean.lichsumuahangbean;
import bean.nuocbean;

public class lichsumuahangdao {
	
	public ArrayList<lichsumuahangbean> HienThi(long makh) {
		ArrayList<lichsumuahangbean> ds= new ArrayList<lichsumuahangbean>();
	try {
		//B1: ket noi vao csdl Qlnuoc
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		
		//B2: lay du lieu ve
		String sql = "select * from VTKKK where makh=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makh);
		ResultSet rs = cmd.executeQuery();
		
		//B3: Duyet rs de luu vao
		while(rs.next()) {
			// lay ve maloai a tenloai
			Long makhang=rs.getLong("makh");
			String tennuoc=rs.getString("tennuoc");
			Integer SoLuongMua=rs.getInt("SoLuongMua");
			Long gia = rs.getLong("gia");
			Long thanhtien = rs.getLong("thanhtien");
			Boolean damua = rs.getBoolean("damua");
			ds.add(new lichsumuahangbean(makhang, tennuoc, SoLuongMua, gia, thanhtien, damua));
		}
		
		//B4: Dong cac doi tuong
		rs.close();
		kn.cn.close();
		return ds;
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	}
}
	public long SLnuocbanchaynhat() {
		try {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			
			String sql="select tennuoc,sum(SoLuongMua) \r\n"
					+ "from VTKKK \r\n"
					+ "where damua = 1\r\n"
					+ "group by tennuoc\r\n"
					+ "having sum(SoLuongMua) >= all (\r\n"
					+ " select sum(SoLuongMua) \r\n"
					+ "	from VTKKK \r\n"
					+ "	where damua = 1\r\n"
					+ "	group by tennuoc\r\n"
					+ ")\r\n"
					+ "\r\n"
					+ "";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
    		ResultSet rs = cmd.executeQuery();
    		while(rs.next()) {
    			return rs.getLong(2);
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public String nuocbanchaynhat() {
		try {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			
			String sql="select tennuoc,sum(SoLuongMua) \r\n"
					+ "from VTKKK \r\n"
					+ "where damua = 1\r\n"
					+ "group by tennuoc\r\n"
					+ "having sum(SoLuongMua) >= all (\r\n"
					+ "								select sum(SoLuongMua) \r\n"
					+ "								from VTKKK \r\n"
					+ "								where damua = 1\r\n"
					+ "								group by tennuoc\r\n"
					+ ")\r\n"
					+ "\r\n"
					+ "";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
    		ResultSet rs = cmd.executeQuery();
    		while(rs.next()) {
    			return rs.getString(1);
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String Anhnuocbanchaynhat() {
		try {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			
			String sql="select VTKKK.tennuoc, sum(SoLuongMua), nuoc.anh\r\n"
					+ "from VTKKK join nuoc\r\n"
					+ "on VTKKK.tennuoc = nuoc.tennuoc\r\n"
					+ "where damua = 1\r\n"
					+ "group by VTKKK.tennuoc, nuoc.anh\r\n"
					+ "having sum(SoLuongMua) >= all (\r\n"
					+ "									select sum(SoLuongMua)\r\n"
					+ "									from VTKKK join nuoc\r\n"
					+ "									on VTKKK.tennuoc = nuoc.tennuoc\r\n"
					+ "									where damua = 1\r\n"
					+ "									group by VTKKK.tennuoc, nuoc.anh\r\n"
					+ "\r\n"
					+ ")";
			
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
    		ResultSet rs = cmd.executeQuery();
    		while(rs.next()) {
    			return rs.getString(3);
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
		lichsumuahangdao ls = new lichsumuahangdao();
			System.out.println(ls.nuocbanchaynhat());
	}
}