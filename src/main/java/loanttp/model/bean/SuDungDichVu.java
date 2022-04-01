package loanttp.model.bean;

public class SuDungDichVu {
	public String MaKH;
	public DichVu DV;
	public String NgaySuDung;
	public String GioSuDung;
	public String SoLuong;
	
	public SuDungDichVu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SuDungDichVu(String maKH, DichVu dV, String ngaySuDung, String gioSuDung, String soLuong) {
		super();
		MaKH = maKH;
		DV = dV;
		NgaySuDung = ngaySuDung;
		GioSuDung = gioSuDung;
		SoLuong = soLuong;
	}

	public String getMaKH() {
		return MaKH;
	}

	public void setMaKH(String maKH) {
		MaKH = maKH;
	}

	public DichVu getDV() {
		return DV;
	}

	public void setDV(DichVu dV) {
		DV = dV;
	}

	public String getNgaySuDung() {
		return NgaySuDung;
	}

	public void setNgaySuDung(String ngaySuDung) {
		NgaySuDung = ngaySuDung;
	}

	public String getGioSuDung() {
		return GioSuDung;
	}

	public void setGioSuDung(String gioSuDung) {
		GioSuDung = gioSuDung;
	}

	public String getSoLuong() {
		return SoLuong;
	}

	public void setSoLuong(String soLuong) {
		SoLuong = soLuong;
	}
	
}
