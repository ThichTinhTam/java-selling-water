package dao;

import java.sql.PreparedStatement;

import bean.dangkyadminbean;


public class dangkyadmindao {
	dangkyadminbean dk= new dangkyadminbean();
	public int Them(String TenDangNhap, String MatKhau) throws Exception{
		KetNoi kn=new KetNoi();
		kn.KetNoi();
		//b1: tao cau lenh sql
		String sql="insert into DangNhap(TenDangNhap,MatKhau,Quyen) values (?,?,1)";
		
		 //B2: Tao ra cau lenh: Preparestatement de thuc thi cau lenh sql
	   	  PreparedStatement cmd= kn.cn.prepareStatement(sql);
		  cmd.setString(1, TenDangNhap);
		  cmd.setString(2, MatKhau);
	   	  return cmd.executeUpdate();
	}
}
