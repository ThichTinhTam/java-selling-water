package bean;

public class dangkyadminbean {
	private String TenDangNhap;
	private String MatKhau;
	private Boolean Quyen;
	public dangkyadminbean(String tenDangNhap, String matKhau, Boolean quyen) {
		super();
		TenDangNhap = tenDangNhap;
		MatKhau = matKhau;
		Quyen = quyen;
	}
	public dangkyadminbean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getTenDangNhap() {
		return TenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
	public Boolean getQuyen() {
		return Quyen;
	}
	public void setQuyen(Boolean quyen) {
		Quyen = quyen;
	}
	
}
