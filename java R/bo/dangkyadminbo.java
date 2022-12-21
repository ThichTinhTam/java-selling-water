package bo;

import dao.dangkyadmindao;

public class dangkyadminbo {
	dangkyadmindao dk=new dangkyadmindao();
	 public int Them(String TenDangNhap, String MatKhau) throws Exception{
	    return dk.Them(TenDangNhap, MatKhau);
	   }

}
