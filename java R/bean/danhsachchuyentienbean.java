package bean;

public class danhsachchuyentienbean {
	private long makh;
	private String tennuoc;
	private int SoLuongMua;
	private long gia;
	private long thanhtien;
	private boolean damua;
	
	public danhsachchuyentienbean(long makh, String tennuoc, int soLuongMua, long gia, long thanhtien, boolean damua) {
		super();
		this.makh = makh;
		this.tennuoc = tennuoc;
		SoLuongMua = soLuongMua;
		this.gia = gia;
		this.thanhtien = thanhtien;
		this.damua = damua;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public String getTennuoc() {
		return tennuoc;
	}
	public void setTennuoc(String tennuoc) {
		this.tennuoc = tennuoc;
	}
	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	
	
	
}