package org.project.DTO;

import java.sql.Date;

public class Book_p01 {
	private String bookNo;
	private String b_title;
	private String author;
	private String publisher;
	private Date p_date;
	private String introduction;
	private String cover;
	
	public Book_p01() {}
	
	public Book_p01(String bookNo, String b_title, String author, String publisher, Date p_date, String introduction,
			String cover) {
		super();
		this.bookNo = bookNo;
		this.b_title = b_title;
		this.author = author;
		this.publisher = publisher;
		this.p_date = p_date;
		this.introduction = introduction;
		this.cover = cover;
	}

	public String getBookNo() {
		return bookNo;
	}

	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

}
