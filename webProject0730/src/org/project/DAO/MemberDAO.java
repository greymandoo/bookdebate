package org.project.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.project.DTO.Member_p01;
import org.project.dbConnect.DBConnect;

public class MemberDAO {
	private MemberDAO() {
		
	}
	private static final MemberDAO INSTANCE = new MemberDAO();
	public static MemberDAO getInstance() {
		return INSTANCE;
	}
	
	public int insertDo(Member_p01 member) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		
		try {
			conn = DBConnect.getConnection();
			query = "insert into member_p01 values(?,?,?,?,sysdate)";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, member.getUserId());
			pstm.setString(2, member.getUserPw());
			pstm.setString(3, member.getUserName());
			pstm.setString(4, member.getEmail());
			
			return pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstm != null) pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return -1;
	}

	public ArrayList<Member_p01> selectMembersDo() {
		ArrayList<Member_p01> members = new ArrayList<Member_p01>();
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			query = "select * from member_p01";
			pstm = conn.prepareStatement(query);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				String userId = rs.getString(1);
				String userPw = rs.getString(2);
				String userName = rs.getString(3);
				String email = rs.getString(4);
				Date joinDate = rs.getDate(5);
				
				members.add(new Member_p01(userId, userPw, userName, email, joinDate));
			}
			return members;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstm != null) pstm.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	public boolean idCheckDo(String userId) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			query = "select userId from member_p01 where userId=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, userId);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstm != null) pstm.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public int deleteDo(String userId, String userPw) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		
		try {
			conn = DBConnect.getConnection();
			query = "delete from member_p01 where userId=? and userPw=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, userId);
			pstm.setString(2, userPw);
			
			return pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstm != null) pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public int modifyDo(String userId, String userPw, String userName, String email) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		
		try {
			conn = DBConnect.getConnection();
			query = "update member_p01 set userName=?,email=? where userId=? and userPw=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, userName);
			pstm.setString(2, email);
			pstm.setString(3, userId);
			pstm.setString(4, userPw);
			
			return pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstm != null) pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public int adminDeleteDo(String userId) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		
		try {
			conn = DBConnect.getConnection();
			query = "delete from member_p01 where userId=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, userId);
			
			return pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstm != null) pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public int adminModifyDo(String userId, String userName, String email) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		
		try {
			conn = DBConnect.getConnection();
			query = "update member_p01 set userName=?,email=? where userId=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, userName);
			pstm.setString(2, email);
			pstm.setString(3, userId);
			
			return pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstm != null) pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public String loginDo(String userId, String userPw) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			query = "select username from member_p01 where userId=? and userPw=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, userId);
			pstm.setString(2, userPw);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstm != null) pstm.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public Member_p01 selectMemberDo(String userId) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		ResultSet rs = null;
		Member_p01 member = null;
		
		try {
			conn = DBConnect.getConnection();
			query = "select * from member_p01 where userId=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, userId);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				String userPw = rs.getString(2);
				String userName = rs.getString(3);
				String email = rs.getString(4);
				Date joinDate = rs.getDate(5);
				
				member = new Member_p01(userId, userPw, userName, email, joinDate);
			}
			return member;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstm != null) pstm.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	
}
