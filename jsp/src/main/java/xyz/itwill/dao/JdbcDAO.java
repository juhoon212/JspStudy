package xyz.itwill.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public abstract class JdbcDAO { // 상속만을 목적으로 작성된 클래스
	
	private static DataSource dataSource;
	
	static {
		try {
			dataSource = (DataSource)new InitialContext().lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		} 
	}
	
	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	
	
	public void close(Connection conn, Statement pstmt, ResultSet rs) {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
