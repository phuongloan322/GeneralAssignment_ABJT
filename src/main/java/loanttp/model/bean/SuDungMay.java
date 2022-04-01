package loanttp.model.bean;

public class SuDungMay {
	public KhachHang KH;
	public May May;
	public String NgayBatDauSuDung;
	public String GioBatDauSuDung;
	public String ThoiGianSuDung;
	
	public SuDungMay() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SuDungMay(KhachHang kH, May may, String ngayBatDauSuDung, String gioBatDauSuDung,
			String thoiGianSuDung) {
		super();
		KH = kH;
		May = may;
		NgayBatDauSuDung = ngayBatDauSuDung;
		GioBatDauSuDung = gioBatDauSuDung;
		ThoiGianSuDung = thoiGianSuDung;
	}

	public KhachHang getKH() {
		return KH;
	}

	public void setKH(KhachHang kH) {
		KH = kH;
	}

	public May getMay() {
		return May;
	}

	public void setMay(May may) {
		May = may;
	}

	public String getNgayBatDauSuDung() {
		return NgayBatDauSuDung;
	}

	public void setNgayBatDauSuDung(String ngayBatDauSuDung) {
		NgayBatDauSuDung = ngayBatDauSuDung;
	}

	public String getGioBatDauSuDung() {
		return GioBatDauSuDung;
	}

	public void setGioBatDauSuDung(String gioBatDauSuDung) {
		GioBatDauSuDung = gioBatDauSuDung;
	}

	public String getThoiGianSuDung() {
		return ThoiGianSuDung;
	}

	public void setThoiGianSuDung(String thoiGianSuDung) {
		ThoiGianSuDung = thoiGianSuDung;
	}
	
}
