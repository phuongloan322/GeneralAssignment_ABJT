package loanttp.model.bean;

public class KhachHang {
	public String MaKH;
	public String TenKH;
	public String DiaChi;
	public String SoDienThoai;
	public String DiaChiEmail;
	
	public KhachHang() {
		super();
		// TODO Auto-generated constructor stub
	}
	public KhachHang(String maKH, String tenKH, String diaChi, String soDienThoai, String diaChiEmail) {
		super();
		MaKH = maKH;
		TenKH = tenKH;
		DiaChi = diaChi;
		SoDienThoai = soDienThoai;
		DiaChiEmail = diaChiEmail;
	}
	public String getMaKH() {
		return MaKH;
	}
	public void setMaKH(String maKH) {
		MaKH = maKH;
	}
	public String getTenKH() {
		return TenKH;
	}
	public void setTenKH(String tenKH) {
		TenKH = tenKH;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public String getSoDienThoai() {
		return SoDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		SoDienThoai = soDienThoai;
	}
	public String getDiaChiEmail() {
		return DiaChiEmail;
	}
	public void setDiaChiEmail(String diaChiEmail) {
		DiaChiEmail = diaChiEmail;
	}
	
	
}
