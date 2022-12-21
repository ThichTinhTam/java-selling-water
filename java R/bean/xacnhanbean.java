package bean;

import java.util.Date;

public class xacnhanbean {
   private long MaChiTietHD;
   private String hoten;
   private String tennuoc;
   private Date NgayMua;
   private int SoLuongMua;
   private long gia;
   private long ThanhTien;
   private boolean damua;
public xacnhanbean(long maChiTietHD, String hoten, String tennuoc, Date ngayMua, int soLuongMua, long gia,
		long thanhTien, boolean damua) {
	super();
	MaChiTietHD = maChiTietHD;
	this.hoten = hoten;
	this.tennuoc = tennuoc;
	NgayMua = ngayMua;
	SoLuongMua = soLuongMua;
	this.gia = gia;
	ThanhTien = thanhTien;
	this.damua = damua;
}
public long getMaChiTietHD() {
	return MaChiTietHD;
}
public void setMaChiTietHD(long maChiTietHD) {
	MaChiTietHD = maChiTietHD;
}
public String getHoten() {
	return hoten;
}
public void setHoten(String hoten) {
	this.hoten = hoten;
}
public String getTennuoc() {
	return tennuoc;
}
public void setTennuoc(String tennuoc) {
	this.tennuoc = tennuoc;
}
public Date getNgayMua() {
	return NgayMua;
}
public void setNgayMua(Date ngayMua) {
	NgayMua = ngayMua;
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
public long getThanhTien() {
	return ThanhTien;
}
public void setThanhTien(long thanhTien) {
	ThanhTien = thanhTien;
}
public boolean isDamua() {
	return damua;
}
public void setDamua(boolean damua) {
	this.damua = damua;
}
@Override
public String toString() {
	return "xacnhanbean [MaChiTietHD=" + MaChiTietHD + ", hoten=" + hoten + ", tennuoc=" + tennuoc + ", NgayMua="
			+ NgayMua + ", SoLuongMua=" + SoLuongMua + ", gia=" + gia + ", ThanhTien=" + ThanhTien + ", damua=" + damua
			+ "]";
}
   
}
