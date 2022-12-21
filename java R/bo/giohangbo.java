package bo;

import java.util.ArrayList;

import bean.giohangbean;


public class giohangbo {
	public ArrayList<giohangbean> ds=
			   new ArrayList<giohangbean>();
	   public void Them(String manuoc, String tennuoc, long gia, long soluong, String anh) {
		   for(giohangbean h: ds)
			   if(h.getManuoc().equals(manuoc)) {
				   h.setSoluong(h.getSoluong()+ soluong);
				   return;
			   }
		   ds.add(new giohangbean(manuoc, tennuoc, gia, soluong, anh));
	   }
	   public long Tongtien() {
		   long s=0;
		   for(giohangbean h: ds)
			   s=s+h.getThanhtien();
		   return s;
	   }

	   public void Xoa(String manuoc) {
		  
		   for(giohangbean h: ds)
			   if(h.getManuoc().equals(manuoc)) {
				   ds.remove(h);
				   return;
	   }
}
	   
	   
	   }