package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import xyz.itwll.dto.MemberDTO;

public class MemberDAO extends JdbcDAO{
	
	
	private static MemberDAO memberDAO = new MemberDAO();
	
	private MemberDAO() {
		
	}
	
	public static MemberDAO getMemberDAO() {
		return memberDAO;
	}
	
	// 회원정보를 전달받아 Member 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
	
	public int insertMember(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			conn = getConnection();
			
			String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, sysdate, null, 1)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getMobile());
			pstmt.setString(6, member.getZipcode());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getAddress2());
			
			rows = pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("insertMember() 메소드 오류" + e.getMessage());
		}finally {
			close(conn, pstmt, null);
		}
		
		return rows;
	}
	
	public MemberDTO selectMember(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO member = null;
		int rows = 0;
		try {
			conn = getConnection();
			
			String sql = "select * from member where id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			
			
			if(rs.next()) {
				member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setMobile(rs.getString("mobile"));
				member.setZipcode(rs.getString("zipcode"));
				member.setAddress(rs.getString("address1"));
				member.setAddress2(rs.getString("address2"));
				member.setJoinDate(rs.getString("join_date"));
				member.setLastLogin(rs.getString("last_login"));
				member.setMemberStatus(rs.getInt("member_status"));
				
			}
		}catch(SQLException e) {
			System.out.println("[에러]selectMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(conn, pstmt, rs);
		}

		return member;
	}
	
	public int updateLastLogin(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			conn = getConnection();
			
			String sql = "update member set last_login = sysdate where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			
			rows = pstmt.executeUpdate();
	}catch(SQLException e) {
		System.out.println("updateLastLogin메소드 오류 = " + e.getMessage());
	}finally {
		close(conn, pstmt, null);
	}
		return rows;
	}
	
	public int updateMember(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			conn = getConnection();
			
			String sql = "update member set passwd = ? , name = ? "
					+ ", email = ?, mobile = ? , address1 = ? , address2 = ? where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getMobile());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getAddress2());
			pstmt.setString(7, member.getId());
			
			
			rows = pstmt.executeUpdate();
	}catch(SQLException e) {
		System.out.println("updateMember메소드 오류 = " + e.getMessage());
	}finally {
		close(conn, pstmt, null);
	}
		return rows;
	}
	
	public int updateMemberStatus(String id, int memberStatus) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			conn = getConnection();
			
			String sql = "update member set member_status = ? where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberStatus);
			pstmt.setString(2, id);
			
			
			rows = pstmt.executeUpdate();
	}catch(SQLException e) {
		System.out.println("updateMemberStatus 메소드 오류 = " + e.getMessage());
	}finally {
		close(conn, pstmt, null);
	}
		return rows;
	}
	
	public String findmember(String name, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = null;
		
		try {
			conn = getConnection();
			
			String sql = "select id from member where name = ? and email = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			id = rs.getString("id");
		}catch(SQLException e) {
			System.out.println("findmember() 메소드 오류 = " + e.getMessage());
		}finally {
			close(conn, pstmt, rs);
		}
		
		return id;
	}
}
