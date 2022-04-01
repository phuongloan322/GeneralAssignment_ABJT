package loanttp.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import loanttp.Utils.DBUtil;
import loanttp.model.bean.DichVu;
import loanttp.model.bean.KhachHang;

public class DichVuDAO {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet rs;
	
	public List<DichVu> getAllDichVu() throws Exception {
		String sql = "select * from DichVu";
		List<DichVu> DichVuList = new ArrayList<DichVu>();
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			DichVu DichVu = new DichVu(rs.getString("MaDV"), rs.getString("TenDV"), rs.getString("DonViTinh"), rs.getString("DonGia"));
			DichVuList.add(DichVu);
		}
		return DichVuList;
	}
	
	public List<DichVu> getDichVuByPaging(int PageNumber, int PageSize) throws Exception {
		List<DichVu> DichVuList = new ArrayList<DichVu>();
		
		connection = DBUtil.getInstance().getConnection();
		String sql = "{CALL proc_PagingDichVu(?,?)}";
		CallableStatement cs;
		cs = connection.prepareCall(sql);
		cs.setInt(1, PageNumber);
		cs.setInt(2, PageSize);
		rs = cs.executeQuery();
		
		while(rs.next()) {
			DichVu DichVu = new DichVu(rs.getString("MaDV"), rs.getString("TenDV"), rs.getString("DonViTinh"), rs.getString("DonGia"));
			DichVuList.add(DichVu);
		}
		rs.close();
		return DichVuList;
	}
	
	public List<DichVu> SearchText(String search) throws Exception {
		String sql = "select * from DichVu where maDV = ? or tenDV like ? or DonViTinh = ?";
		List<DichVu> DichVuList = new ArrayList<DichVu>();
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, search);
		preparedStatement.setString(2, "%"+search+"%");
		preparedStatement.setString(3, search);
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			DichVu DichVu = new DichVu(rs.getString("MaDV"), rs.getString("TenDV"), rs.getString("DonViTinh"), rs.getString("DonGia"));
			DichVuList.add(DichVu);
		}
		return DichVuList;
	}
	
	public List<DichVu> SearchNumber(String search) throws Exception {
		String sql = "select * from DichVu where DonGia >= ? ";
		List<DichVu> DichVuList = new ArrayList<DichVu>();
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, search);
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			DichVu DichVu = new DichVu(rs.getString("MaDV"), rs.getString("TenDV"), rs.getString("DonViTinh"), rs.getString("DonGia"));
			DichVuList.add(DichVu);
		}
		return DichVuList;
	}
	
	public int addDichVu(DichVu DichVu) throws Exception {
		int rs = 0;
		String sql = "insert DichVu values(?,?,?,?)";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, DichVu.getMaDV());
		preparedStatement.setString(2, DichVu.getTenDV());
		preparedStatement.setString(3, DichVu.getDonViTinh());
		preparedStatement.setString(4, DichVu.getDonGia());
		
		rs = preparedStatement.executeUpdate();
		return rs;
	}
	
	public DichVu getDichVuById(String maDichVu) throws Exception {
		DichVu DichVu = null;
		String sql = "select * from DichVu where MaDV = ?";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, maDichVu);
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			DichVu =  new DichVu(rs.getString("MaDV"), rs.getString("TenDV"), rs.getString("DonViTinh"), rs.getString("DonGia"));
		}
		return DichVu;
	}

	public int deleteDichVu(String maDichVu) throws Exception {
		int rs = 0;
		String sql = "delete SuDungDichVu where MaDV = ? "
				+ "delete from DichVu where MaDV = ?";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, maDichVu);
		preparedStatement.setString(2, maDichVu);
		rs = preparedStatement.executeUpdate();
		return rs;
	}
	
	public int updateDichVu(DichVu DichVu) throws Exception {
		int rs = 0;
		String sql = "update DichVu set TenDV = ?, DonViTinh = ?, DonGia = ? where MaDV = ?";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, DichVu.TenDV);
		preparedStatement.setString(2, DichVu.DonViTinh);
		preparedStatement.setString(3, DichVu.DonGia);
		preparedStatement.setString(4, DichVu.MaDV);
		
		rs = preparedStatement.executeUpdate();
		return rs;
	}
}
