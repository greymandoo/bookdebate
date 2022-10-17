package org.project.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.project.DTO.Board_p01;
import org.project.dbConnect.DBConnect;

public class ArticleDAO {
	private ArticleDAO() {
		
	}
	private static final ArticleDAO INSTANCE = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return INSTANCE;
	}
	
	public ArrayList<Board_p01> selectArticlesDo() {
		ArrayList<Board_p01> articles = new ArrayList<Board_p01>();
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			query = "select level,articleno,parentno,title,content,userid,writedate "
					+ "from board_p01 "
					+ "start with parentno=0 "
					+ "connect by prior articleno=parentno "
					+ "order siblings by articleno desc";
			pstm = conn.prepareStatement(query);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				int level = rs.getInt(1);
				int articleNo = rs.getInt(2);
				int parentNo = rs.getInt(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				String userId = rs.getString(6);
				Date writeDate = rs.getDate(7);
				
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
	
	
	
}
