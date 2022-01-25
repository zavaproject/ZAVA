package kr.co.domain;

import java.io.Serializable;

public class ReviewVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int rno;
	private String pid;
	private String title;
	private String mid;
	private String content;
	private String regdate;
	private String updatedate;
	private int rating;
	
	public ReviewVO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewVO(int rno, String pid, String title, String mid, String content, String regdate, String updatedate,
			int rating) {
		super();
		this.rno = rno;
		this.pid = pid;
		this.title = title;
		this.mid = mid;
		this.content = content;
		this.regdate = regdate;
		this.updatedate = updatedate;
		this.rating = rating;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReviewVO [rno=" + rno + ", pid=" + pid + ", title=" + title + ", mid=" + mid + ", content=" + content
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", rating=" + rating + "]";
	}
	
	
	
}
