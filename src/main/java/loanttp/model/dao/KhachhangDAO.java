package loanttp.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import loanttp.Utils.DBUtil;
import loanttp.model.bean.KhachHang;
import loanttp.model.bean.KhachHang;
import loanttp.model.bean.KhachHang;

public class KhachhangDAO {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet rs;
	
	public List<KhachHang> getAllKhachHang() throws Exception {
		String sql = "select * from KhachHang";
		List<KhachHang> KhachHangList = new ArrayList<KhachHang>();
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			KhachHang KhachHang = new KhachHang(rs.getString("MaKH"), rs.getString("TenKH"), rs.getString("DiaChi"), rs.getString("SoDienThoai"), rs.getString("DiaChiEmail"));
			KhachHangList.add(KhachHang);
		}
		return KhachHangList;
	}
	
	public List<KhachHang> getAccountByPaging(int PageNumber, int PageSize) throws Exception {
		List<KhachHang> KhachHangList = new ArrayList<KhachHang>();
		
		connection = DBUtil.getInstance().getConnection();
		String sql = "{CALL proc_PagingKhachHang(?,?)}";
		CallableStatement cs;
		cs = connection.prepareCall(sql);
		cs.setInt(1, PageNumber);
		cs.setInt(2, PageSize);
		rs = cs.executeQuery();
		
		while(rs.next()) {
			KhachHang KhachHang = new KhachHang(rs.getString("MaKH"), rs.getString("TenKH"), rs.getString("DiaChi"), rs.getString("SoDienThoai"), rs.getString("DiaChiEmail"));
			KhachHangList.add(KhachHang);
		}
		rs.close();
		return KhachHangList;
	}
	
	public List<KhachHang> Search(String search) throws Exception {
		String sql = "select * from KhachHang where MaKH = ? or TenKH like ? or DiaChi like ? or SoDienThoai = ? or DiaChiEmail like ?";
		List<KhachHang> KhachHangList = new ArrayList<KhachHang>();
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, search);
		preparedStatement.setString(2, "%"+search+"%");
		preparedStatement.setString(3, "%"+search+"%");
		preparedStatement.setString(4, search);
		preparedStatement.setString(5, "%"+search+"%");
		
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			KhachHang KhachHang = new KhachHang(rs.getString("MaKH"), rs.getString("TenKH"), rs.getString("DiaChi"), rs.getString("SoDienThoai"), rs.getString("DiaChiEmail"));
			KhachHangList.add(KhachHang);
		}
		return KhachHangList;
	}
	
	public int addKhachHang(KhachHang kh) throws Exception {
		int rs = 0;
		String sql = "insert KhachHang values(?,?,?,?,?)";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, kh.getMaKH());
		preparedStatement.setString(2, kh.getTenKH());
		preparedStatement.setString(3, kh.getDiaChi());
		preparedStatement.setString(4, kh.getSoDienThoai());
		preparedStatement.setString(5, kh.getDiaChiEmail());
		
		rs = preparedStatement.executeUpdate();
		return rs;
	}
	
	public KhachHang getKhachHangById(String maKhachHang) throws Exception {
		KhachHang KhachHang = null;
		String sql = "select * from KhachHang where MaKH = ?";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, maKhachHang);
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			KhachHang = new KhachHang(rs.getString("MaKH"), rs.getString("TenKH"), rs.getString("DiaChi"), rs.getString("SoDienThoai"), rs.getString("DiaChiEmail"));
			
		}
		return KhachHang;
	}

	public int deleteKhachHang(String maKhachHang) throws Exception {
		int rs = 0;
		String sql = "delete from SuDungMay where MaKH = ? "
				+ "delete from SuDungMay where MaKH = ? "
				+ "delete from KhachHang where MaKH = ?";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, maKhachHang);
		preparedStatement.setString(2, maKhachHang);
		preparedStatement.setString(3, maKhachHang);
		rs = preparedStatement.executeUpdate();
		return rs;
	}
	
	public int updateKhachHang(KhachHang KhachHang) throws Exception {
		int rs = 0;
		String sql = "update KhachHang set TenKH = ?, DiaChi = ?, SoDienThoai = ?, DiaChiEmail = ? where MaKH = ?";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, KhachHang.TenKH);
		preparedStatement.setString(2, KhachHang.DiaChi);
		preparedStatement.setString(3, KhachHang.SoDienThoai);
		preparedStatement.setString(4, KhachHang.DiaChiEmail);
		preparedStatement.setString(5, KhachHang.MaKH);
		
		rs = preparedStatement.executeUpdate();
		return rs;
	}

}
