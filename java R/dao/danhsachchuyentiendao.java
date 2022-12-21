package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.danhsachchuyentienbean;
import bean.lichsumuahangbean;
import bean.nuocbean;

public class danhsachchuyentiendao {
	
	public ArrayList<danhsachchuyentienbean> HienThiDS() {
		ArrayList<danhsachchuyentienbean> ds= new ArrayList<danhsachchuyentienbean>();
	try {
		//B1: ket noi vao csdl QlSach
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		
		//B2: lay du lieu ve
		String sql = "select * from VTKKK where damua = 1";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//cmd.setLong(1, makh);
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
			ds.add(new danhsachchuyentienbean(makhang, tennuoc, SoLuongMua, gia, thanhtien, damua));
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
	
	public static void main(String[] args) {
		danhsachchuyentiendao ls = new danhsachchuyentiendao();
			System.out.println(ls.HienThiDS());
	}
}