package loanttp.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import loanttp.Utils.DBUtil;

public class DangkyDAO {
	private Connection connection;
	private PreparedStatement preparedStatement;
	
	public int DangKySuDungMay(String makh, String mamay, String ngaybatdau, String giobatdau, String thoigiansudung) throws Exception {
		int rs = 0;
		String sql = "insert SuDungMay values(?,?,?,?,?)";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, makh);
		preparedStatement.setString(2, mamay);
		preparedStatement.setString(3, ngaybatdau);
		preparedStatement.setString(4, giobatdau);
		preparedStatement.setString(5, thoigiansudung);
		rs = preparedStatement.executeUpdate();
		return rs;
	}
	
	public int DangKySuDungDichVu(String makh, String madv, String ngaysd, String giosd, String soluong) throws Exception {
		int rs = 0;
		String sql = "insert SuDungDichVu values(?,?,?,?,?)";
		connection = DBUtil.getInstance().getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, makh);
		preparedStatement.setString(2, madv);
		preparedStatement.setString(3, ngaysd);
		preparedStatement.setString(4, giosd);
		preparedStatement.setString(5, soluong);
		rs = preparedStatement.executeUpdate();
		return rs;
	}
	
}
