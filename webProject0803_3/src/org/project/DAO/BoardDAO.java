package org.project.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.project.DTO.Board_p01;
import org.project.dbConnect.DBConnect;

public class BoardDAO {
	private BoardDAO() {
		
	}
	private static final BoardDAO INSTANCE = new BoardDAO();
	public static BoardDAO getInstance() {
		return INSTANCE;
	}
	
	public int getTotalNum() {
		int num = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "select count(*) from board_p01";
		
		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				num = rs.getInt(1);
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
		
		return num;
	}
	

	public Board_p01 selectArticleDo(int articleNo) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		ResultSet rs = null;
		Board_p01 article = new Board_p01();
		
		try {
			conn = DBConnect.getConnection();
			query = "select * from board_p01 where articleno=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, articleNo);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				article.setArticleNo(articleNo);
				article.setParentNo(rs.getInt(2));
				article.setTitle(rs.getString(3));
				article.setContent(rs.getString(4));
				article.setUserId(rs.getString(5));
				article.setWriteDate(rs.getDate(6));
			}
			return article;
			
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

	public int insertDo(Board_p01 article) {
		int rs = 0;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "insert into board_p01 values(articleno_seq.nextval,?,?,?,?,sysdate)";

		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, article.getParentNo());
			pstm.setString(2, article.getTitle());
			pstm.setString(3, article.getContent());
			pstm.setString(4, article.getUserId());
			
			rs = pstm.executeUpdate();
			
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
		
		return rs;
	}

	public ArrayList<Board_p01> selectPageArticlesDo(int page) {
		ArrayList<Board_p01> articles = new ArrayList<Board_p01>();
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			query = "select * from (" + 
					"select ROWNUM as recNum,LVL,articleNo,parentNo,title,content,userId,writeDate from (" + 
					"select LEVEL as LVL,articleno,parentno,title,content,userId,writeDate from board_p01 " + 
					"START WITH parentNo=0 CONNECT BY PRIOR articleNo=parentNo ORDER SIBLINGS BY articleNo DESC" + 
					")) where recNum between(?-1)*10+1 and ?*10";
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, page);
			pstm.setInt(2, page);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				int level = rs.getInt(2);
				int articleNo = rs.getInt(3);
				int parentNo = rs.getInt(4);
				String title = rs.getString(5);
				String content = rs.getString(6);
				String userId = rs.getString(7);
				Date writeDate = rs.getDate(8);
				
				articles.add(new Board_p01(level, articleNo, parentNo, title, content, userId, writeDate));
			}
			return articles;
			
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

	public int modifyDo(int articleNo, String title, String content, String userId) {
		int rs = 0;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "update board_p01 set title=?,content=? where articleNo=? and userId=?";

		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, title);
			pstm.setString(2, content);
			pstm.setInt(3, articleNo);
			pstm.setString(4, userId);
			
			rs = pstm.executeUpdate();
			
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
		
		return rs;
	}

	public int deleteDo(String userId, int articleNo) {
		int rs = 0;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "delete from board_p01 where articleNo=? and userId=?";

		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, articleNo);
			pstm.setString(2, userId);
			
			rs = pstm.executeUpdate();
			
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
		
		return rs;
	}

	public int modifyForAdminDo(int articleNo, String title, String content) {
		int rs = 0;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "update board_p01 set title=?,content=? where articleNo=?";

		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, title);
			pstm.setString(2, content);
			pstm.setInt(3, articleNo);
			
			rs = pstm.executeUpdate();
			
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
		
		return rs;
	}

	public int deleteForAdminDo(int articleNo) {
		int rs = 0;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "delete from board_p01 where articleNo=?";

		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, articleNo);
			
			rs = pstm.executeUpdate();
			
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
		
		return rs;
	}

	public int getArticleNum(String userId) {
		int num = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "select count(*) from board_p01 where userId=?";
		
		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, userId);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				num = rs.getInt(1);
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
		
		return num;
	}
	
	public int deleteArticlesDo(String userId) {
		int rs = 0;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "delete from board_p01 where userId=?";

		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, userId);
			
			rs = pstm.executeUpdate();
			
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
		
		return rs;
	}
	
	public ArrayList<Board_p01> selectUserArticlesDo(String writer, int page) {
		ArrayList<Board_p01> articles = new ArrayList<Board_p01>();
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			query = "select * from \r\n" + 
					" (select ROWNUM as recNum,LVL,articleNo,parentNo,title,content,userId,writeDate from \r\n" + 
					" (select LEVEL as LVL,articleno,parentno,title,content,userId,writeDate from board_p01 \r\n" + 
					" START WITH parentNo=0 CONNECT BY PRIOR articleNo=parentNo ORDER SIBLINGS BY articleNo DESC)\r\n" + 
					" where userid=? ) where recNum between(?-1)*10+1 and ?*10";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, writer);
			pstm.setInt(2, page);
			pstm.setInt(3, page);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				int level = rs.getInt(2);
				int articleNo = rs.getInt(3);
				int parentNo = rs.getInt(4);
				String title = rs.getString(5);
				String content = rs.getString(6);
				String userId = rs.getString(7);
				Date writeDate = rs.getDate(8);
				
				articles.add(new Board_p01(level, articleNo, parentNo, title, content, userId, writeDate));
			}
			return articles;
			
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
