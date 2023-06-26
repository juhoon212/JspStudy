package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwll.dto.StudentDTO;

// Student 테이블에 CRUD 기능 제공하는 클래스
public class StudentDAO extends JdbcDAO{
	
	private static StudentDAO studentDAO = new StudentDAO();
	
	private StudentDAO() {
		
	}
	
	public static StudentDAO getStudent() {
		return studentDAO;
	}
	
	public int insertStudent(StudentDTO studentDTO) {

		Connection conn = null;
		PreparedStatement pstmt = null;
	
		
		int rows = 0;
		
		try {
			conn = getConnection();
			
			String sql = "insert into student values(?, ? ,? ,? ,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, studentDTO.getNo());
			pstmt.setString(2, studentDTO.getName());
			pstmt.setString(3, studentDTO.getPhone());
			pstmt.setString(4, studentDTO.getAddress());
			pstmt.setString(5, studentDTO.getBirthday());
			
			rows = pstmt.executeUpdate();
	
		} catch(SQLException e) {
			System.out.println("insertStudent() 메소드 오류" + e.getMessage());
		} finally {
			close(conn, pstmt, null);
		}
		return rows;
	}
	
	public int deleteStudent(int no) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int rows = 0;
		
		try {
			conn = getConnection();
			
			String sql = "delete from student where no = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("deleteStudent() 메소드 오류" + e.getMessage());
		} finally {
			close(conn, pstmt, null);
		}
		
		return rows;
	}
	
	public int updateStudent(StudentDTO student) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		
		try {
			conn = getConnection();
			
			String sql = "update student set name = ?, phone = ?, address = ? , birthday = ? where no = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, student.getName());
			pstmt.setString(2, student.getPhone());
			pstmt.setString(3, student.getAddress());
			pstmt.setString(4, student.getBirthday());
			pstmt.setInt(5, student.getNo());
			
			rows = pstmt.executeUpdate();
			
			
			
		}catch(SQLException e) {
			System.out.println("updateStudent() 메소드 오류 = " + e.getMessage());
		} finally {
			close(conn, pstmt, null);
		}
				
		return rows;
	}
	
	public StudentDTO selectStudent(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudentDTO student = null;
		
		try {
			conn = getConnection();
			
			String sql = "select * from student where no = ?";
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				student = new StudentDTO();
				student.setNo(rs.getInt("no"));
				student.setName(rs.getString("name"));
				student.setPhone(rs.getString("phone"));
				student.setAddress(rs.getString("address"));
				student.setBirthday(rs.getString("birthday"));
			}
		}catch(SQLException e) {
			System.out.println("selectStudent() 메소드 오류 = " + e.getMessage());
		}finally {
			close(conn, pstmt, rs);
		}
		
		return student;
	}
	
	public List<StudentDTO> selectAllStudent() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StudentDTO> studentList = new ArrayList<>();
		
		try {
			conn = getConnection();
			
			String sql = "select * from student";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StudentDTO student = new StudentDTO();
				
				student.setNo(rs.getInt("no"));
				student.setName(rs.getString("name"));
				student.setPhone(rs.getString("phone"));
				student.setAddress(rs.getString("address"));
				student.setBirthday(rs.getString("birthday"));
				
				studentList.add(student);
			}
			
			
		} catch(SQLException e) {
			System.out.println("selectAllStudent() 메소드 오류 = " + e.getMessage());
		} finally {
			close(conn, pstmt, rs);
		}
		
		return studentList;
	}
	
}
