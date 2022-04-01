package loanttp.model.bean;

import javax.persistence.*;
public class DichVu {
	public String MaDV;
	public String TenDV;
	public String DonViTinh;
	public String DonGia;
	
	public DichVu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DichVu(String maDV, String tenDV, String donViTinh, String donGia) {
		super();
		MaDV = maDV;
		TenDV = tenDV;
		DonViTinh = donViTinh;
		DonGia = donGia;
	}
	public String getMaDV() {
		return MaDV;
	}
	public void setMaDV(String maDV) {
		MaDV = maDV;
	}
	public String getTenDV() {
		return TenDV;
	}
	public void setTenDV(String tenDV) {
		TenDV = tenDV;
	}
	public String getDonViTinh() {
		return DonViTinh;
	}
	public void setDonViTinh(String donViTinh) {
		DonViTinh = donViTinh;
	}
	public String getDonGia() {
		return DonGia;
	}
	public void setDonGia(String donGia) {
		DonGia = donGia;
	}

	
	
	
}
