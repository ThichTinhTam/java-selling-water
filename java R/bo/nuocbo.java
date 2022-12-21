package bo;

import java.util.ArrayList;
import java.util.Date;

import bean.loaibean;
import bean.nuocbean;
import bean.nuocbean;
import dao.nuocdao;

public class nuocbo {
	nuocdao sdao=new nuocdao();
	giohangbo ghbo=new giohangbo();
	public ArrayList<nuocbean> getnuoc() throws Exception{
		return sdao.getnuoc();
	}
	public ArrayList<nuocbean> getncc() throws Exception{
		return sdao.getncc();
	}
	public Long Demnuoc(String maloai) throws Exception{
		ArrayList<nuocbean> ds=getnuoc();
		Long d=(long)0;
			for(nuocbean s: ds)
				if(s.getMaloai().equals(maloai))
					d++;
			return d;
	}

	public ArrayList<nuocbean> TimLoai(String maloai) throws Exception{
		ArrayList<nuocbean> ds= getnuoc();
		ArrayList<nuocbean> tam= new ArrayList<nuocbean>();
			for(nuocbean s: ds)
				if(s.getMaloai().equals(maloai))
					tam.add(s);
			return tam;
	   }
	
	public nuocbean Timnuoc(String manuoc) throws Exception{
		ArrayList<nuocbean> ds= getnuoc();
			for(nuocbean s: ds)
				if(s.getManuoc().equals(manuoc))
					return s;
		return null;	
	   }
	public ArrayList<nuocbean> Tim(String key) throws Exception{
		ArrayList<nuocbean> ds= getnuoc();
		ArrayList<nuocbean> tam= new ArrayList<nuocbean>();
		   	for(nuocbean s: ds)
		   		if(s.getTennuoc().trim().toLowerCase().contains(key.trim().toLowerCase())||
		   				s.getNcc().trim().toLowerCase().contains(key.trim().toLowerCase())||
		   				s.getManuoc().trim().toLowerCase().contains(key.trim().toLowerCase())||
		   				s.getMaloai().trim().toLowerCase().contains(key.trim().toLowerCase()))
		tam.add(s);
		return tam;
	   }
	public int xoanuoc(String manuoc) throws Exception{
		return sdao.xoanuoc(manuoc);
	}
	public int suanuoc(String manuoc, String tennuoc, String ncc, long soluong, long gia, String maloai, String anh, Date ngaynhap) throws Exception{
		return sdao.suanuoc(manuoc, tennuoc, ncc, soluong, gia, maloai, anh, ngaynhap);
	}
	public int themnuoc(String manuoc, String tennuoc, String ncc, long soluong, long gia, String maloai, String anh, Date ngaynhap) throws Exception{
		return sdao.themnuoc(manuoc, tennuoc, ncc, soluong, gia, maloai, anh, ngaynhap);
	}
	public nuocbean getNew() {
		   return sdao.getNew();
	   }
}
