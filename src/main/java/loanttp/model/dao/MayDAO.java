package loanttp.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import loanttp.Utils.DBUtil;
import loanttp.model.bean.DichVu;
import loanttp.model.bean.May;

public class MayDAO {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet rs;
	
	public List<May> getAllMay() throws Exception {
		String sql = "select * from May";
		List<May> mayList = new ArrayList<May>();
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			May may = new May(rs.getString("MaMay"), rs.getString("ViTri"), rs.getString("TrangThai"));
			mayList.add(may);
		}
		return mayList;
	}
	
	public List<May> getDichVuByPaging(int PageNumber, int PageSize) throws Exception {
		List<May> mayList = new ArrayList<May>();
		
		connection = DBUtil.getInstance().getConnection();
		String sql = "{CALL proc_PagingMay(?,?)}";
		CallableStatement cs;
		cs = connection.prepareCall(sql);
		cs.setInt(1, PageNumber);
		cs.setInt(2, PageSize);
		rs = cs.executeQuery();
		
		while(rs.next()) {
			May may = new May(rs.getString("MaMay"), rs.getString("ViTri"), rs.getString("TrangThai"));
			mayList.add(may);
		}
		rs.close();
		return mayList;
	}
	
	public List<May> Search(String search) throws Exception {
		String sql = "select * from May where MaMay = ? or ViTri like ? or TrangThai like ?";
		List<May> mayList = new ArrayList<May>();
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, search);
		preparedStatement.setString(2, "%"+search+"%");
		preparedStatement.setString(3, "%"+search+"%");
		
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			May may = new May(rs.getString("MaMay"), rs.getString("ViTri"), rs.getString("TrangThai"));
			mayList.add(may);
		}
		return mayList;
	}
	
	public int addMay(May may) throws Exception {
		int rs = 0;
		String sql = "insert May values(?,?,?)";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, may.getMaMay());
		preparedStatement.setString(2, may.getViTri());
		preparedStatement.setString(3, may.getTrangThai());
		
		rs = preparedStatement.executeUpdate();
		return rs;
	}
	
	public May getMayById(String maMay) throws Exception {
		May may = null;
		String sql = "select * from May where MaMay = ?";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, maMay);
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			may = new May(rs.getString("MaMay"), rs.getString("ViTri"), rs.getString("TrangThai"));
		}
		return may;
	}
	
	public int updateMay(May may) throws Exception {
		int rs = 0;
		String sql = "update May set ViTri = ?, TrangThai = ? where MaMay = ?";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, may.ViTri);
		preparedStatement.setString(2, may.TrangThai);
		preparedStatement.setString(3, may.MaMay);
		rs = preparedStatement.executeUpdate();
		return rs;
	}
	
	public int deleteSuDungMay(String maMay) throws Exception {
		int rs = 0;
		String sql = "delete from SuDungMay where MaMay = ? ";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, maMay);
		rs = preparedStatement.executeUpdate();
		return rs;
	}

	public int deleteMay(String maMay) throws Exception {
		int rs = 0;
		String sql = "delete from May where MaMay = ? ";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, maMay);
		rs = preparedStatement.executeUpdate();
		return rs;
	}

}
