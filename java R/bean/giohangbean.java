package bean;

public class giohangbean {
	private String manuoc;
	private String tennuoc;
	private long gia;
	private long soluong;
	private long thanhtien;
	private String anh;
	public giohangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public giohangbean(String manuoc, String tennuoc, long gia, long soluong, String anh) {
		super();
		this.manuoc = manuoc;
		this.tennuoc = tennuoc;
		this.gia = gia;
		this.soluong = soluong;
		this.thanhtien = soluong*gia;
		this.anh = anh;
	
	}
	

	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getManuoc() {
		return manuoc;
	}
	public void setManuoc(String manuoc) {
		this.manuoc = manuoc;
	}
	public String getTennuoc() {
		return tennuoc;
	}
	public void setTennuoc(String tennuoc) {
		this.tennuoc = tennuoc;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	
	
	
}
