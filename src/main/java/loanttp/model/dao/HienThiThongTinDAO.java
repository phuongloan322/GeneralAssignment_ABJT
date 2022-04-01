package loanttp.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import loanttp.Utils.DBUtil;
import loanttp.model.bean.DichVu;
import loanttp.model.bean.KhachHang;
import loanttp.model.bean.May;
import loanttp.model.bean.SuDungDichVu;
import loanttp.model.bean.SuDungMay;

public class HienThiThongTinDAO {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet rs;
	KhachhangDAO khdao = new KhachhangDAO();
	MayDAO maydao = new MayDAO();
	DichVuDAO dvdao = new DichVuDAO();
	
	public List<SuDungMay> SuDungMay() throws Exception {
		List<SuDungMay> dsSDMay = new ArrayList<SuDungMay>();
		String sql = "select kh.MaKH, TenKH, m.MaMay, ViTri, TrangThai, NgayBatDauSuDung, GioBatDauSuDung, ThoiGianSuDung, dv.MaDV, NgaySuDung, GioSuDung, SoLuong, DonGia\r\n" + 
				"from KhachHang kh join SuDungMay sdm on kh.MaKH = sdm.MaKH\r\n" + 
				"				  join May m on sdm.MaMay = m.MaMay\r\n" + 
				"				  left join SuDungDichVu sddv on kh.MaKH = sddv.MaKH\r\n" + 
				"				  left join DichVu dv on dv.MaDV = sddv.MaDV";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			KhachHang khachHang = khdao.getKhachHangById(rs.getString("MaKH"));
			May may = maydao.getMayById(rs.getString("MaMay"));
			SuDungMay sdmay = new SuDungMay(khachHang, may, rs.getString("NgayBatDauSuDung"), rs.getString("GioBatDauSuDung"), rs.getString("ThoiGianSuDung"));
			dsSDMay.add(sdmay);
		}
		return dsSDMay;
	}
	
	public List<SuDungDichVu> SuDungDichVu() throws Exception {
		List<SuDungDichVu> dsSDDV = new ArrayList<SuDungDichVu>();
		String sql = "select kh.MaKH, TenKH, m.MaMay, ViTri, TrangThai, NgayBatDauSuDung, GioBatDauSuDung, ThoiGianSuDung, dv.MaDV, NgaySuDung, GioSuDung, SoLuong, DonGia\r\n" + 
				"from KhachHang kh join SuDungMay sdm on kh.MaKH = sdm.MaKH\r\n" + 
				"				  join May m on sdm.MaMay = m.MaMay\r\n" + 
				"				  left join SuDungDichVu sddv on kh.MaKH = sddv.MaKH\r\n" + 
				"				  left join DichVu dv on dv.MaDV = sddv.MaDV";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			DichVu dv = dvdao.getDichVuById(rs.getString("MaDV"));
			SuDungDichVu sddv = new SuDungDichVu(rs.getString("MaKH"), dv, rs.getString("NgaySuDung"), rs.getString("GioSuDung"), rs.getString("SoLuong"));
			dsSDDV.add(sddv);
		}
		return dsSDDV;
	}
	
}
