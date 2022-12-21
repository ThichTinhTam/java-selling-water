package bean;

import java.util.Date;

public class nuocbean {
	private String manuoc;
	private String tennuoc;
	private String ncc;
	private Long soluong;
	private Long gia;
	private String anh;
	private String maloai;
	private Date NgayNhap;
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
	public String getNcc() {
		return ncc;
	}
	public void setNcc(String ncc) {
		this.ncc = ncc;
	}
	public Long getSoluong() {
		return soluong;
	}
	public void setSoluong(Long soluong) {
		this.soluong = soluong;
	}
	public Long getGia() {
		return gia;
	}
	public void setGia(Long gia) {
		this.gia = gia;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public Date getNgayNhap() {
		return NgayNhap;
	}
	public void setNgayNhap(Date ngayNhap) {
		NgayNhap = ngayNhap;
	}
	public nuocbean(String manuoc, String tennuoc, String ncc, Long soluong, Long gia, String anh, String maloai, Date NgayNhap) {
		super();
		this.manuoc = manuoc;
		this.tennuoc = tennuoc;
		this.ncc = ncc;
		this.soluong = soluong;
		this.gia = gia;
		this.anh = anh;
		this.maloai = maloai;
		this.NgayNhap = NgayNhap;
	}
	
	
	public nuocbean(String manuoc, String ncc) {
		super();
		this.manuoc = manuoc;
		this.ncc = ncc;
	}
	public nuocbean() {
		super();
		// TODO Auto-generated constructor stub
	}
}