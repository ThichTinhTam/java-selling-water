package dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.nuocbean;
import bean.xacnhanbean;

public class xacnhandao {
	public ArrayList<xacnhanbean> getdanhsach() {
		ArrayList<xacnhanbean> ds= new ArrayList<xacnhanbean>();
		try {
			KetNoi kn= new KetNoi();
			kn.KetNoi();
			String sql="select * from ViewXN ";
			PreparedStatement cmd= kn.cn.prepareStatement(sql);
			ResultSet rs= cmd.executeQuery();
			xacnhanbean xn= null;
			while(rs.next()) {
				long MaChiTietHD= rs.getLong("MaChiTietHD");
				String hoten=rs.getString("hoten");
				String tennuoc=rs.getString("tennuoc");
				Date NgayMua=rs.getDate("NgayMua");
				int SoLuongMua=rs.getInt("SoLuongMua");
				long gia=rs.getLong("gia");
				long ThanhTien=rs.getLong("ThanhTien");
				boolean damua=rs.getBoolean("damua");
				ds.add(new xacnhanbean(MaChiTietHD, hoten, tennuoc, NgayMua, SoLuongMua, gia, ThanhTien, damua));
			}
			rs.close();
			kn.cn.close();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	 public void UpdateDamua(long ChiTietHoaDon) {
	      try {
	    	  KetNoi kn= new KetNoi();
	  		kn.KetNoi();
	  		String sql="update ChiTietHoaDon set damua = 1 where MaChiTietHD = ?";
	  		PreparedStatement cmd= kn.cn.prepareStatement(sql);
	  		cmd.setLong(1, ChiTietHoaDon);
	  		cmd.executeUpdate();
	  		kn.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	    }
//	 public ArrayList<xacnhanbean> getdanhsachdamua(){
//			ArrayList<xacnhanbean> ds = new ArrayList<xacnhanbean>();
//			try {
//				KetNoi kn = new KetNoi();
//				kn.KetNoi();
//				//Lay du lieu ve
//				String sql = "select * from ViewXN";
//				PreparedStatement cmd = kn.cn.prepareStatement(sql);
//				ResultSet rs = cmd.executeQuery();
//				while(rs.next()) {
//					int mct = Integer.parseInt(rs.getString("machitiethd"));
//					Date NgayMua=rs.getDate("NgayMua");
//					String hoten = rs.getString("hoten"); 
//					int soluongmua = Integer.parseInt(rs.getString("soluongmua"));
//					int gia = Integer.parseInt(rs.getString("gia"));
//					int thanhtien = Integer.parseInt(rs.getString("thanhtien"));
//					boolean damua = rs.getBoolean("damua");
//					String tennuoc = rs.getString("tennuoc");
//					ds.add(new xacnhanbean(mct, hoten, tennuoc, NgayMua, soluongmua, gia, thanhtien, t));
//				}
//				
//				
//				rs.close();
//				kn.cn.close();
//				
//		}catch(Exception e){
//			e.printStackTrace();
//			return null;
//		}
//			return ds;
//		}

	public static void main(String[] args) {
	xacnhandao xndao = new xacnhandao();
	System.out.println(xndao.getdanhsach());
	}

}
