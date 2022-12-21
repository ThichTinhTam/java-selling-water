package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import bean.khachhangbean;
import bean.loaibean;
import bean.nuocbean;


public class nuocdao {
	public ArrayList<nuocbean> getnuoc() throws Exception{
		ArrayList<nuocbean> ds=new ArrayList<nuocbean>();
		KetNoi dc=new KetNoi();
		dc.KetNoi();
		String sql="select * from nuoc";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		ResultSet rs=cmd.executeQuery();
		while(rs.next()) {
			String manuoc=rs.getString("manuoc"); 
			String tennuoc=rs.getString("tennuoc");
			String ncc=rs.getString("ncc"); 
			Long soluong=rs.getLong("soluong");
			Long gia=rs.getLong("gia");
			String anh=rs.getString("anh");
			String maloai=rs.getString("maloai");
			Date ngaynhap=rs.getDate("NgayNhap");
			ds.add(new nuocbean(manuoc, tennuoc, ncc, soluong, gia, anh, maloai, ngaynhap));
		}
		//b6:Dong
		rs.close();
		dc.cn.close();
		return ds;
	}

	
	public int xoanuoc(String manuoc) throws Exception{
		KetNoi dc=new KetNoi();
		dc.KetNoi();
		String sql="delete from nuoc where manuoc=?";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, manuoc);
		int kq=cmd.executeUpdate();
		dc.cn.close();
		return kq;
	}
	public int suanuoc(String manuoc, String tennuoc, String ncc, long soluong, long gia, String maloai, String anh, Date ngaynhap) throws Exception{
		KetNoi dc=new KetNoi();
		dc.KetNoi();
		String sql="update nuoc set tennuoc=?, soluong=?, gia=?, maloai=?, anh=?, NgayNhap=?, ncc=? where manuoc=?";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setNString(1, tennuoc);
		cmd.setLong(2, soluong);
		cmd.setLong(3, gia);
		cmd.setNString(4, maloai);
		cmd.setNString(5, anh);
		cmd.setDate(6, (java.sql.Date) ngaynhap);
		cmd.setNString(7, ncc);
		cmd.setNString(8, manuoc);
		int kq=cmd.executeUpdate();
		dc.cn.close();
		return kq;
	}
	public int themnuoc(String manuoc, String tennuoc, String ncc, long soluong, long gia, String maloai, String anh, Date ngaynhap) throws Exception{
		KetNoi dc=new KetNoi();
		dc.KetNoi();
		String sql="insert into nuoc values (?,?,?,?,?,?,GETDATE(),?)";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setNString(1, manuoc);
		cmd.setNString(2, tennuoc);
		cmd.setLong(3, soluong);
		cmd.setLong(4, gia);
		cmd.setNString(5, maloai);
		cmd.setNString(6, anh);
		cmd.setNString(7, ncc);
		int kq=cmd.executeUpdate();
		dc.cn.close();
		return kq;
	}
	 public nuocbean getNew() {
			try {
				KetNoi kn = new KetNoi();
				kn.KetNoi();
				
				String sql = "select top 1 * from nuoc\r\n"
						+ "order by manuoc desc";
				PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    		ResultSet rs = cmd.executeQuery();
	    		while(rs.next()) {
	    			// lay ve maloai a tenloai
	    			String manuoc=rs.getString("manuoc");
					String tennuoc=rs.getString("tennuoc");
					long soluong=rs.getLong("soluong");
					long gia=rs.getLong("gia");
					String anh=rs.getString("anh");
					String maloai=rs.getString("maloai");
					String ncc=rs.getString("ncc");
					Date ngaynhap=rs.getDate("NgayNhap");
					return new nuocbean(manuoc, tennuoc, ncc, soluong, gia, anh, maloai, ngaynhap);
	    		}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	
	
	public ArrayList<nuocbean> getncc(){
    	ArrayList<nuocbean> dsncc= new ArrayList<nuocbean>();
    	try {
			KetNoi kn= new KetNoi();
			kn.KetNoi();
			String sql="select * from nuoc";
			PreparedStatement cmd=kn.cn.prepareStatement(sql);
			ResultSet rs=cmd.executeQuery();
			
			while(rs.next()) {
				String manuoc=rs.getString("manuoc");
				String ncc=rs.getString("ncc");
				dsncc.add(new nuocbean(manuoc, ncc));
			}
			
			rs.close();
			kn.cn.close();
			return dsncc;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			// TODO: handle exception
		}

    	
    }
	
}