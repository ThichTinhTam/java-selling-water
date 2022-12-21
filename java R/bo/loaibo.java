package bo;

import java.util.ArrayList;

import bean.loaibean;
import dao.loaidao;

public class loaibo {
    loaidao ldao=new loaidao();
    ArrayList<loaibean> ds;
    public ArrayList<loaibean> getloai(){
    	ds=ldao.getloai();
    	return ds;
    }
    public int Them(String maloai,String tenloai) throws Exception{
		 return ldao.Them(maloai, tenloai);
	 }
	 public int Xoa(String maloai)  throws Exception{
		 return ldao.Xoa(maloai);
	 }
	 public int Sua(String maloai,String tenloaimoi)  throws Exception{
		 return ldao.Sua(maloai, tenloaimoi);
		 
	 }
	 public loaibean chon(String maloai) throws Exception{
		 for(loaibean k:ldao.getloai())
			 if(k.getMaloai().equals(maloai))
				 return k;
		 return null;
	 }
}