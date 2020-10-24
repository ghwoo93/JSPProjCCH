package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;

public class BBSDao {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	public BBSDao(ServletContext context,String user,String pwd) {
		try {
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			conn = DriverManager.getConnection(context.getInitParameter("ORACLE_URL"),user,pwd);
			System.out.println("DB 연결 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(conn!=null) conn.close();
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
		} catch (SQLException e) {
		
		} 
	}
	
	public boolean isMember(String user,String password) {
		String sql="SELECT COUNT(*) FROM member WHERE id=? AND pwd=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
