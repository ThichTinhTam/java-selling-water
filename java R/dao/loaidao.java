package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;
import bo.xacnhanbo;

public class loaidao {
	KetNoi kn= new KetNoi();
    public ArrayList<loaibean> getloai(){
    	ArrayList<loaibean> ds= new ArrayList<loaibean>();
    	try {
			KetNoi kn= new KetNoi();
			kn.KetNoi();
			String sql="select * from loai";
			PreparedStatement cmd=kn.cn.prepareStatement(sql);
			ResultSet rs=cmd.executeQuery();
			
			while(rs.next()) {
				String maloai=rs.getString("maloai");
				String tenloai=rs.getString("tenloai");
				ds.add(new loaibean(maloai, tenloai));
			}
			
			rs.close();
			kn.cn.close();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			// TODO: handle exception
		}

    	
    }
    public boolean KtTrungMa(String maloai) throws Exception{
		 //Kiem tra xem co maloai nay trong bang loai hay k
		 String sql="select * from loai where maloai=?";
		 PreparedStatement cmd= kn.cn.prepareStatement(sql);
		 cmd.setString(1,maloai);
		 ResultSet rs= cmd.executeQuery();
		 boolean kq=rs.next();
		 rs.close();
		 return kq;
		 
	 }
	 public int Them(String maloai,String tenloai) throws Exception{
		 //Neu trung ma thi khong them
		 kn.KetNoi();
		 if(KtTrungMa(maloai)) return 0;
		 kn.cn.close();
		 //Nguoc lai them vao csdl
		 kn.KetNoi();
		 String sql="INSERT INTO loai(maloai,tenloai) VALUES (?,?)";
		 PreparedStatement cmd= kn.cn.prepareStatement(sql);
		 cmd.setString(1, maloai);
	 	 cmd.setString(2, tenloai);
		 int rs= cmd.executeUpdate();
		 kn.cn.close();
		 return rs;
	  }
	 public boolean KtLoainuoc(String maloai)  throws Exception{
		 //Kiem tra xem maloai nay co nuoc hay k
		 String sql="select * from nuoc where maloai=?";
		 PreparedStatement cmd= kn.cn.prepareStatement(sql);
		 cmd.setString(1,maloai);
		 ResultSet rs= cmd.executeQuery();
		 boolean kq=rs.next();
		 rs.close();
		 return kq;
		 
	 }
	 public int Xoa(String maloai)  throws Exception{
		 //xoa loai k co nuoc
		 kn.KetNoi();
		 if(KtLoainuoc(maloai)) return 0;
		 kn.cn.close();
		 kn.KetNoi();
		 String sql="DELETE from loai where maloai=?";
		 PreparedStatement cmd= kn.cn.prepareStatement(sql);
		 cmd.setString(1, maloai);
		 int rs= cmd.executeUpdate();
		 kn.cn.close();
		 return rs;
		 
	 }
	 public int Sua(String maloai,String tenloaimoi)  throws Exception{
		 //Sua ten loai
		 kn.KetNoi();
		 String sql="UPDATE loai set tenloai=? where maloai=?";
		 PreparedStatement cmd= kn.cn.prepareStatement(sql);
		 cmd.setString(1, tenloaimoi);
		 cmd.setString(2, maloai);
		 int rs= cmd.executeUpdate();
		 kn.cn.close();
		 return rs;
		 
	 }
    public static void main(String[] args) {
 		loaidao lsbo = new loaidao();
 		System.out.println(lsbo.getloai());
 	}
}
