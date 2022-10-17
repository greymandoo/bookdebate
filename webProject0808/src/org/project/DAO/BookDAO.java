package org.project.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.project.DTO.Book_p01;
import org.project.dbConnect.DBConnect;

public class BookDAO {
	private BookDAO () {
		
	}
	private static final BookDAO INSTANCE = new BookDAO();
	public static BookDAO getINSTANCE() {
		return INSTANCE;
	}
	
	public ArrayList<String> getBookList() {
		ArrayList<String> b_titles = new ArrayList<String>();
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "select b_title from book_p01 order by b_title asc";
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				b_titles.add(rs.getString(1));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstm != null) pstm.close();
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return b_titles;
	}
	
	public boolean ISBNCheckDo(String bookNo) {
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			query = "select bookNo from book_p01 where bookNo=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, bookNo);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) result = true;
			
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
		return result;
	}
	
	public int addBookDo(Map<String, String> bookMap) {
		int rs = 0;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "insert into book_p01 values(?,?,?,?,?,?,?)";
		
		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
						
			pstm.setString(1, bookMap.get("bookNo"));
			pstm.setString(2, bookMap.get("b_title"));
			pstm.setString(3, bookMap.get("author"));
			pstm.setString(4, bookMap.get("publisher"));
			pstm.setString(5, bookMap.get("p_date"));
			pstm.setString(6, bookMap.get("introduction"));
			pstm.setString(7, bookMap.get("cover"));
			
			rs = pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstm != null) pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return rs;
	}
	
	public int getTotalNum() {
		int num = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "select count(*) from book_p01";
		
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
	
	public ArrayList<Book_p01> selectPageBooksDo(int page) {
		ArrayList<Book_p01> books = new ArrayList<Book_p01>();
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			query = "select * from( " + 
					"select rownum as recnum,bookNo,b_title,author,publisher,p_date,introduction,cover from( " + 
					"select bookNo,b_title,author,publisher,p_date,introduction,cover from book_p01 order by b_title asc " + 
					")) where recnum between (?-1)*10+1 and ?*10 ";
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, page);
			pstm.setInt(2, page);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				Book_p01 book = new Book_p01();
				
				book.setBookNo(rs.getString(2));
				book.setB_title(rs.getString(3));
				book.setAuthor(rs.getString(4));
				book.setPublisher(rs.getString(5));
				book.setP_date(rs.getDate(6));
				book.setIntroduction(rs.getString(7));
				book.setCover(rs.getString(8));
				
				books.add(book);
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
		
		return books;
	}
	
	public int getTotalNumForSearch(String category, String searching) {
		int num = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "select count(*) from book_p01 where " + category + " like ?";
		
		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, "%"+searching+"%");
			
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
	
	public ArrayList<Book_p01> selectPageBooksForSearchDo(String category, String searching, int page) {
		ArrayList<Book_p01> books = new ArrayList<Book_p01>();
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			query = "select * from( " + 
					"select rownum as recnum,bookNo,b_title,author,publisher,p_date,introduction,cover from( " + 
					"select bookNo,b_title,author,publisher,p_date,introduction,cover from book_p01 order by b_title asc) " + 
					" where " + category + " like ? ) where recNum between(?-1)*10+1 and ?*10";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, "%"+searching+"%");
			pstm.setInt(2, page);
			pstm.setInt(3, page);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				String bookNo = rs.getString(2);
				String b_title = rs.getString(3);
				String author = rs.getString(4);
				String publisher = rs.getString(5);
				Date p_date = rs.getDate(6);
				String introduction = rs.getString(7);
				String cover = rs.getString(8);
				
				books.add(new Book_p01(bookNo, b_title, author, publisher, p_date, introduction, cover));
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
		
		return books;
	}

	public Book_p01 selectArticleDo(String bookNo) {
		Book_p01 book = null;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "select * from book_p01 where bookNo=?";
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, bookNo);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				String b_title = rs.getString(2);
				String author = rs.getString(3);
				String publisher = rs.getString(4);
				Date p_date = rs.getDate(5);
				String introduction = rs.getString(6);
				String cover = rs.getString(7);
				
				book = new Book_p01(bookNo, b_title, author, publisher, p_date, introduction, cover);
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
		
		return book;
	}

	public int deleteDo(String bookNo) {
		int rs = 0;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "delete from book_p01 where bookNo=?";
		
		try {
			conn = DBConnect.getConnection();
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, bookNo);
			
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

	public int modifyBookDo(Map<String, String> bookMap) {
		int rs = 0;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		
		try {
			conn = DBConnect.getConnection();
			
			if(bookMap.get("cover") != null && bookMap.get("cover").length() !=0) {
				query = "update book_p01 set b_title=?,author=?,publisher=?,p_date=?,introduction=?,cover=? where bookNo=?";
				
				pstm = conn.prepareStatement(query);
				
				pstm.setString(1, bookMap.get("b_title"));
				pstm.setString(2, bookMap.get("author"));
				pstm.setString(3, bookMap.get("publisher"));
				pstm.setString(4, bookMap.get("p_date"));
				pstm.setString(5, bookMap.get("introduction"));
				pstm.setString(6, bookMap.get("cover"));
				pstm.setString(7, bookMap.get("bookNo"));
				
			} else {
				query = "update book_p01 set b_title=?,author=?,publisher=?,p_date=?,introduction=? where bookNo=?";
				
				pstm = conn.prepareCall(query);
				
				pstm.setString(1, bookMap.get("b_title"));
				pstm.setString(2, bookMap.get("author"));
				pstm.setString(3, bookMap.get("publisher"));
				pstm.setString(4, bookMap.get("p_date"));
				pstm.setString(5, bookMap.get("introduction"));
				pstm.setString(6, bookMap.get("bookNo"));
			}
			
			rs = pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstm != null) pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return rs;
	}
	
}
