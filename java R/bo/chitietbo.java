package bo;

import dao.chitietdao;

public class chitietbo {
  chitietdao ct= new chitietdao();
  public int Them(String manuoc, long soluongmua, long mahd) {
	  return ct.Them(manuoc, soluongmua, mahd);
  }
  public long getthongke() {
	   return ct.getthongke();
  }
  public long gettongtienthuvao() {
	   return ct.gettongtienthuvao();
 }
}
