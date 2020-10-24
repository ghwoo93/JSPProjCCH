package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;

/*
 * DAO(Data Access Object):데이타에 접근해서 CRUD작업을
 *                         수행하는 업무처리 로직을 갖고 있는 객체
 * 
 */
public class BBSDao {
	//[멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	//[생성자]
	public BBSDao(ServletContext context,String user,String password) {
		try {
			//드라이버 로딩]
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			//데이타베이스 연결]
			conn = DriverManager.getConnection(context.getInitParameter("ORACLE_URL"),user,password);
			System.out.println("데이타 베이스 연결 성공");
		}
		catch(ClassNotFoundException | SQLException e) {e.printStackTrace();}
	}//////////////////
	//자원반납용]
	public void close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		}
		catch(SQLException e) {e.printStackTrace();}
		
	}/////////////////close
	//회원 여부 판단용]
	public boolean isMember(String user,String password) {
		String sql="SELECT COUNT(*) FROM member WHERE id=? AND pwd=?";
		try {
			psmt =conn.prepareStatement(sql);
			psmt.setString(1, user);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) return false;
		}
		catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}////////////isMember
}
